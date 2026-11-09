import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import './test-env.js';
import { loadConfig } from '../src/lib/config.js';

describe('config validation', () => {
  it('accepts a valid environment', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      DB_PORT: '3306',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      PORT: '4000',
    });

    assert.equal(config.DB_HOST, '127.0.0.1');
    assert.equal(config.JWT_SECRET, 'this-is-a-valid-secret-value-32chars');
  });

  it('rejects a short JWT secret without leaking the original value', () => {
    const shortSecret = 'short-secret';

    try {
      loadConfig({
        DB_HOST: '127.0.0.1',
        DB_USER: 'station',
        DB_PASSWORD: 'strong-password-123',
        DB_NAME: 'station_service_test',
        DB_PORT: '3306',
        JWT_SECRET: shortSecret,
        PORT: '4000',
      });
      throw new Error('Expected loadConfig to reject an invalid env');
    } catch (error) {
      const message = String(error);
      assert.match(message, /JWT_SECRET/);
      assert.doesNotMatch(message, new RegExp(shortSecret.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')));
    }
  });
});
