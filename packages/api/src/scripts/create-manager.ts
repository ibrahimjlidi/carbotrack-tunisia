import bcrypt from 'bcryptjs';
import { emitKeypressEvents, createInterface } from 'node:readline';
import type { RowDataPacket } from 'mysql2/promise';
import { pool, insertRecord, queryOne } from '../lib/db.js';
import { userCreateSchema } from '../modules/auth/schemas.js';

function ask(question: string): Promise<string> {
  const interface_ = createInterface({ input: process.stdin, output: process.stdout });
  return new Promise((resolve) => {
    interface_.question(question, (answer) => {
      interface_.close();
      resolve(answer);
    });
  });
}

function askSecret(question: string): Promise<string> {
  if (!process.stdin.isTTY || !process.stdin.setRawMode) {
    throw new Error('Run this command from an interactive terminal so the password can be entered without echo.');
  }

  process.stdout.write(question);
  emitKeypressEvents(process.stdin);
  process.stdin.setRawMode(true);
  process.stdin.resume();

  return new Promise((resolve, reject) => {
    let value = '';
    const cleanup = () => {
      process.stdin.off('keypress', onKeypress);
      process.stdin.setRawMode(false);
      process.stdin.pause();
      process.stdout.write('\n');
    };
    const onKeypress = (character: string, key: { name?: string; ctrl?: boolean }) => {
      if (key.ctrl && key.name === 'c') {
        cleanup();
        reject(new Error('Password entry cancelled.'));
      } else if (key.name === 'return' || key.name === 'enter') {
        cleanup();
        resolve(value);
      } else if (key.name === 'backspace') {
        value = [...value].slice(0, -1).join('');
      } else if (character && !key.ctrl && !key.name?.startsWith('arrow')) {
        value += character;
      }
    };

    process.stdin.on('keypress', onKeypress);
  });
}

async function createManager() {
  const username = (await ask('Manager username: ')).trim();
  const nom = (await ask('Manager last name: ')).trim();
  const prenom = (await ask('Manager first name: ')).trim();
  const password = await askSecret('Manager password (12+ characters, hidden): ');
  const confirmation = await askSecret('Confirm password: ');

  if (password !== confirmation) {
    throw new Error('The passwords do not match.');
  }
  if (password.length < 12) {
    throw new Error('Choose a manager password with at least 12 characters.');
  }

  const input = userCreateSchema.parse({ username, nom, prenom, password, role: 'gerant' });
  const passwordHash = await bcrypt.hash(input.password, 12);
  const connection = await pool.getConnection();
  let lockAcquired = false;
  let transactionStarted = false;

  try {
    const lock = await queryOne<RowDataPacket & { acquired: number | null }>(
      'SELECT GET_LOCK(?, 10) AS acquired',
      [`${process.env.DB_NAME ?? 'station'}:create-manager`],
      connection,
    );
    if (Number(lock?.acquired) !== 1) {
      throw new Error('Could not acquire the manager setup lock. Try again.');
    }
    lockAcquired = true;

    const existing = await queryOne('SELECT id FROM `User` WHERE role = ? LIMIT 1', ['gerant'], connection);
    if (existing) {
      throw new Error('A manager account already exists. Create additional users from the application instead.');
    }

    await connection.beginTransaction();
    transactionStarted = true;
    const id = await insertRecord('User', {
      username: input.username,
      passwordHash,
      nom: input.nom,
      prenom: input.prenom,
      telephone: input.telephone,
      role: 'gerant',
      magasinId: null,
    }, connection);
    await connection.commit();
    transactionStarted = false;
    process.stdout.write(`Manager account "${input.username}" created in database "${process.env.DB_NAME}".\n`);
  } catch (error) {
    if (transactionStarted) {
      await connection.rollback();
    }
    throw error;
  } finally {
    try {
      if (lockAcquired) {
        await queryOne('SELECT RELEASE_LOCK(?) AS released', [`${process.env.DB_NAME ?? 'station'}:create-manager`], connection);
      }
    } finally {
      connection.release();
      await pool.end();
    }
  }
}

createManager().catch((error: unknown) => {
  console.error(error instanceof Error ? error.message : error);
  process.exitCode = 1;
});
