import type { PoolConnection, RowDataPacket } from 'mysql2/promise';
import { execute, insertRecord, pool, queryOne } from '../lib/db.js';

const BASE_DAY = Date.UTC(2026, 1, 1);
const DAYS = 14;
const NOW = new Date();

interface IdRow extends RowDataPacket {
  id: number;
}

interface FixtureContext {
  magasinId: number;
  equipeId: number;
  caisseId: number;
  vendeurId: number;
  cuves: [number, number];
  pompeId: number;
  modePaymentId: number;
  fournisseurCarburantIds: number[];
  fournisseurBoutiqueIds: number[];
  clientIds: number[];
  produitIds: number[];
}

const created = {
  clients: 0,
  suppliers: 0,
  products: 0,
  productPurchases: 0,
  fuelDeliveries: 0,
  pumpReadings: 0,
  cashReceipts: 0,
  deliveryNotes: 0,
  fuelInventories: 0,
};

function day(offset: number): string {
  return new Date(BASE_DAY + offset * 86_400_000).toISOString().slice(0, 10);
}

async function findId(sql: string, values: readonly (string | number)[], connection: PoolConnection): Promise<number | null> {
  const row = await queryOne<IdRow>(sql, values, connection);
  return row ? Number(row.id) : null;
}

async function requireId(sql: string, values: readonly (string | number)[], label: string, connection: PoolConnection): Promise<number> {
  const id = await findId(sql, values, connection);
  if (id === null) throw new Error(`Missing prerequisite ${label}. Apply migrations and packages/api/sql/seed.sql first.`);
  return id;
}

async function loadBase(connection: PoolConnection): Promise<FixtureContext> {
  const stationId = await requireId('SELECT id FROM `Station` WHERE code = ?', ['EL-AMAL-DEMO'], 'demo station', connection);
  const magasinId = await requireId('SELECT id FROM `Magasin` WHERE stationId = ?', [stationId], 'demo store', connection);
  const equipeId = await requireId('SELECT id FROM `Equipe` WHERE code = ?', ['DEMO-MATIN'], 'demo shift', connection);
  const caisseId = await requireId('SELECT id FROM `Caisse` WHERE code = ?', ['DEMO-CAISSE'], 'demo cashier', connection);
  const vendeurId = await requireId('SELECT id FROM `Vendeur` WHERE matricule = ?', ['DEMO-VENDEUR'], 'demo seller', connection);
  const cuveSp95 = await requireId('SELECT id FROM `Cuve` WHERE code = ?', ['DEMO-SP95'], 'demo SP95 tank', connection);
  const cuveGasoil = await requireId('SELECT id FROM `Cuve` WHERE code = ?', ['DEMO-GASOIL'], 'demo diesel tank', connection);
  const pompeId = await requireId('SELECT id FROM `Pompe` WHERE code = ?', ['DEMO-P1'], 'demo pump', connection);
  const modePaymentId = await requireId('SELECT id FROM `ModePayment` WHERE libelle = ?', ['Especes (demo)'], 'demo cash payment method', connection);

  const fuelSupplierIds: number[] = [];
  const shopSupplierIds: number[] = [];
  for (let index = 1; index <= 8; index += 1) {
    const fuelSupplier = index <= 4;
    const code = `FXSTG-${fuelSupplier ? 'F' : 'S'}${String(fuelSupplier ? index : index - 4).padStart(2, '0')}`;
    let id = await findId('SELECT id FROM `Fournisseur` WHERE code = ?', [code], connection);
    if (id === null) {
      id = await insertRecord('Fournisseur', {
        code,
        raisonSociale: `Fournisseur fixture staging ${String(index).padStart(2, '0')}`,
        adresse: 'Donnees fictives - staging',
      }, connection);
      created.suppliers += 1;
    }
    (fuelSupplier ? fuelSupplierIds : shopSupplierIds).push(id);
  }

  const clientIds: number[] = [];
  for (let index = 1; index <= 12; index += 1) {
    const name = `Client fixture staging ${String(index).padStart(2, '0')}`;
    let id = await findId('SELECT id FROM `Client` WHERE nomClient = ?', [name], connection);
    if (id === null) {
      id = await insertRecord('Client', {
        nomClient: name,
        adresse: 'Donnees fictives - staging',
        quota: 5000,
        soldeAnterieur: 0,
        tva: 19,
      }, connection);
      created.clients += 1;
    }
    clientIds.push(id);
  }

  const familleName = 'Fixture staging - boutique';
  let familleId = await findId('SELECT id FROM `FamilleProduit` WHERE libelle = ? ORDER BY id LIMIT 1', [familleName], connection);
  if (familleId === null) {
    familleId = await insertRecord('FamilleProduit', {
      libelle: familleName,
      typeProd: 'Boutique',
      compteCPT: '707100',
      compteACH: '607100',
    }, connection);
  }

  const produitIds: number[] = [];
  for (let index = 1; index <= 20; index += 1) {
    const code = `FXSTG-P${String(index).padStart(3, '0')}`;
    let id = await findId('SELECT id FROM `Produit` WHERE code = ?', [code], connection);
    if (id === null) {
      const prixAchatHT = 5 + index * 1.25;
      id = await insertRecord('Produit', {
        code,
        codeProduit: code,
        libelle: `Produit fixture staging ${String(index).padStart(2, '0')}`,
        prixVenteHT: prixAchatHT * 1.35,
        tva: 19,
        actif: true,
        familleId,
        fournisseurId: shopSupplierIds[(index - 1) % shopSupplierIds.length],
        prixAchatHT,
        stock: 0,
        tauxTVA: 19,
      }, connection);
      created.products += 1;
    }
    produitIds.push(id);
  }

  return {
    magasinId,
    equipeId,
    caisseId,
    vendeurId,
    cuves: [cuveSp95, cuveGasoil],
    pompeId,
    modePaymentId,
    fournisseurCarburantIds: fuelSupplierIds,
    fournisseurBoutiqueIds: shopSupplierIds,
    clientIds,
    produitIds,
  };
}

async function seedProductPurchases(context: FixtureContext, connection: PoolConnection) {
  for (let index = 1; index <= 12; index += 1) {
    const invoice = `FXSTG-SHOP-${String(index).padStart(3, '0')}`;
    if (await findId('SELECT id FROM `AchatProd` WHERE numFacture = ? LIMIT 1', [invoice], connection) !== null) continue;

    const firstProduct = context.produitIds[(index * 2 - 2) % context.produitIds.length];
    const secondProduct = context.produitIds[(index * 2 - 1) % context.produitIds.length];
    const firstCost = 5 + (((index * 2 - 2) % 20) + 1) * 1.25;
    const secondCost = 5 + (((index * 2 - 1) % 20) + 1) * 1.25;
    const firstQuantity = 4 + index % 5;
    const secondQuantity = 3 + index % 4;
    const totalHT = firstCost * firstQuantity + secondCost * secondQuantity;
    const totalTTC = totalHT * 1.19;
    const dateAchat = day(index - 1);
    const fournisseurId = context.fournisseurBoutiqueIds[(index - 1) % context.fournisseurBoutiqueIds.length];
    const achatId = await insertRecord('AchatProd', {
      fournisseurId,
      magasinId: context.magasinId,
      dateAchat,
      dateFacture: dateAchat,
      numFacture: invoice,
      totalTTC,
      totHT: totalHT,
      reste: totalTTC,
      valide: false,
    }, connection);

    for (const [produitId, quantite, prixAchat] of [
      [firstProduct, firstQuantity, firstCost],
      [secondProduct, secondQuantity, secondCost],
    ] as const) {
      await insertRecord('DetailAchatProd', {
        achatProdId: achatId,
        produitId,
        date: dateAchat,
        quantite,
        prixAchat,
        tauxTVA: 19,
        valide: false,
      }, connection);
      await execute('UPDATE `Produit` SET stock = stock + ?, updatedAt = ? WHERE id = ?', [quantite, NOW, produitId], connection);
    }
    created.productPurchases += 1;
  }
}

async function seedFuelDeliveries(context: FixtureContext, connection: PoolConnection) {
  for (let index = 1; index <= 12; index += 1) {
    const reference = `FXSTG-FUEL-${String(index).padStart(3, '0')}`;
    if (await findId('SELECT id FROM `AchatEssence` WHERE reference = ? LIMIT 1', [reference], connection) !== null) continue;

    const cuveId = context.cuves[index % context.cuves.length];
    const quantity = cuveId === context.cuves[0] ? 3000 + (index % 4) * 250 : 5000 + (index % 4) * 500;
    const achatId = await insertRecord('AchatEssence', {
      date: day(index - 1),
      fournisseurId: context.fournisseurCarburantIds[(index - 1) % context.fournisseurCarburantIds.length],
      type: 'achat',
      reference,
      magasinId: context.magasinId,
    }, connection);
    await insertRecord('DetailAchatEssence', {
      achatId,
      cuveId,
      quantite: quantity,
      prixUnitaire: cuveId === context.cuves[0] ? 1.7 : 1.5,
    }, connection);
    created.fuelDeliveries += 1;
  }
}

async function seedPumpReadingsAndReceipts(context: FixtureContext, connection: PoolConnection) {
  const pumpPrice = 2.525;
  const volumePerDay = 30;
  const total = pumpPrice * volumePerDay;

  for (let index = 0; index < DAYS; index += 1) {
    const date = day(index);
    const readingExists = await findId(
      'SELECT id FROM `MobVCarCaisse` WHERE date = ? AND equipeId = ? AND caisseId = ? AND pompeId = ?',
      [date, context.equipeId, context.caisseId, context.pompeId],
      connection,
    );
    if (readingExists === null) {
      const opening = 50060 + index * volumePerDay;
      await insertRecord('MobVCarCaisse', {
        date,
        equipeId: context.equipeId,
        caisseId: context.caisseId,
        pompeId: context.pompeId,
        vendeurId: context.vendeurId,
        indexOuverture: opening,
        indexFermeture: opening + volumePerDay,
        prixVente: pumpPrice,
      }, connection);
      created.pumpReadings += 1;
    }

    const receiptExists = await findId(
      'SELECT id FROM `RecetteCaisse` WHERE date = ? AND equipeId = ? AND caisseId = ?',
      [date, context.equipeId, context.caisseId],
      connection,
    );
    if (receiptExists === null) {
      const recetteId = await insertRecord('RecetteCaisse', {
        date,
        equipeId: context.equipeId,
        caisseId: context.caisseId,
        vendeurId: context.vendeurId,
        totalRecettes: total,
        fait: false,
        magasinId: context.magasinId,
      }, connection);
      await insertRecord('DetailRecetteCaisse', {
        numRecette: recetteId,
        modePaymentId: context.modePaymentId,
        montant: total,
        numero: `FXSTG-CASH-${String(index + 1).padStart(3, '0')}`,
        idCuve: context.cuves[0],
      }, connection);
      created.cashReceipts += 1;
    }
  }
}

async function seedSales(context: FixtureContext, connection: PoolConnection) {
  for (let index = 0; index < DAYS; index += 1) {
    const date = day(index);
    const clientId = context.clientIds[index % context.clientIds.length];
    const produitId = context.produitIds[index % context.produitIds.length];
    if (await findId(
      'SELECT b.id FROM `Bonliv` b JOIN `Detbonliv` d ON d.bonlivId = b.id WHERE b.clientId = ? AND b.date = ? AND d.idProduit = ? LIMIT 1',
      [clientId, date, produitId],
      connection,
    ) !== null) continue;

    const product = await queryOne<RowDataPacket & { prixVenteHT: string | number }>(
      'SELECT prixVenteHT FROM `Produit` WHERE id = ?',
      [produitId],
      connection,
    );
    if (!product) throw new Error(`Fixture product ${produitId} could not be loaded.`);
    const unitPrice = Number(product.prixVenteHT);
    const quantity = 1 + index % 3;
    const totalHT = unitPrice * quantity;
    const totalTVA = totalHT * 0.19;
    const totalTTC = totalHT + totalTVA;
    const bonlivId = await insertRecord('Bonliv', {
      date,
      clientId,
      totalHT,
      totalTTC,
      totTVA: totalTVA,
      magasinId: context.magasinId,
    }, connection);
    await insertRecord('Detbonliv', {
      numLigne: 1,
      bonlivId,
      idProduit: produitId,
      puHT: unitPrice,
      tva: 19,
      qte: quantity,
      remise: 0,
      ttc: totalTTC,
      date,
    }, connection);

    const factureId = await insertRecord('Facture', {
      date,
      clientId,
      totalHT,
      totalTTC,
      totTVA: totalTVA,
      numBL: bonlivId,
      mtTimbre: 0.6,
      magasinId: context.magasinId,
    }, connection);
    await insertRecord('Detfact', {
      numLigne: 1,
      factureId,
      idProduit: produitId,
      puHT: unitPrice,
      qte: quantity,
      ttc: totalTTC,
      date,
    }, connection);
    await execute('UPDATE `Bonliv` SET numFact = ?, updatedAt = ? WHERE id = ?', [factureId, NOW, bonlivId], connection);
    created.deliveryNotes += 1;
  }
}

async function seedFuelInventories(context: FixtureContext, connection: PoolConnection) {
  const tanks = [
    { id: context.cuves[0], stock: 12_000, unitPrice: 1.7 },
    { id: context.cuves[1], stock: 20_000, unitPrice: 1.5 },
  ];

  for (let index = 0; index < DAYS; index += 1) {
    const date = day(index);
    const exists = await findId(
      'SELECT id FROM `InventaireCarburant` WHERE date = ? AND magasinId = ? AND operateur = ? LIMIT 1',
      [date, context.magasinId, 'Fixture staging batch'],
      connection,
    );
    if (exists !== null) continue;

    const id = await insertRecord('InventaireCarburant', {
      date,
      operateur: 'Fixture staging batch',
      cloture: false,
      valeurStock: tanks.reduce((sum, tank) => sum + tank.stock * tank.unitPrice, 0),
      magasinId: context.magasinId,
    }, connection);

    for (const [tankIndex, tank] of tanks.entries()) {
      const difference = ((index + tankIndex) % 5) - 2;
      const stockPhysique = tank.stock + difference;
      await insertRecord('DetailInventaireCarburant', {
        inventaireCarId: id,
        cuveId: tank.id,
        date,
        stockPhysique,
        stockComptable: tank.stock,
        prixUnitaire: tank.unitPrice,
        valeur: stockPhysique * tank.unitPrice,
        ecart: difference,
      }, connection);
    }
    created.fuelInventories += 1;
  }
}

async function main() {
  const database = process.env.DB_NAME?.trim();
  const allowNonStaging = process.env.ALLOW_NON_STAGING_FIXTURES === 'I_UNDERSTAND_THIS_INSERTS_FAKE_DATA';
  if (!database || (!database.endsWith('_staging') && !allowNonStaging)) {
    throw new Error('Refusing to seed fixtures: DB_NAME must end in _staging. For a disposable test database only, set ALLOW_NON_STAGING_FIXTURES=I_UNDERSTAND_THIS_INSERTS_FAKE_DATA.');
  }
  if (!database.endsWith('_staging')) {
    process.stderr.write(`WARNING: explicitly authorized fake fixture data for non-staging database "${database}".\n`);
  }

  const connection = await pool.getConnection();
  const lockName = `${database}:seed-fixtures`;
  let lockAcquired = false;
  let transactionStarted = false;

  try {
    const lock = await queryOne<RowDataPacket & { acquired: number | null }>(
      'SELECT GET_LOCK(?, 10) AS acquired',
      [lockName],
      connection,
    );
    if (Number(lock?.acquired) !== 1) throw new Error('Could not acquire fixture seed lock. Try again.');
    lockAcquired = true;

    const selectedDatabase = await queryOne<RowDataPacket & { name: string | null }>(
      'SELECT DATABASE() AS name',
      [],
      connection,
    );
    if (
      selectedDatabase?.name !== database
      || (!selectedDatabase.name.endsWith('_staging') && !allowNonStaging)
    ) {
      throw new Error('Refusing to seed fixtures: the connected database does not match DB_NAME or is not a staging database.');
    }

    await connection.beginTransaction();
    transactionStarted = true;
    const context = await loadBase(connection);
    await seedProductPurchases(context, connection);
    await seedFuelDeliveries(context, connection);
    await seedPumpReadingsAndReceipts(context, connection);
    await seedSales(context, connection);
    await seedFuelInventories(context, connection);
    await connection.commit();
    transactionStarted = false;

    process.stdout.write([
      `Fixture records created in ${database}:`,
      ...Object.entries(created).map(([name, count]) => `  ${name}: ${count}`),
    ].join('\n') + '\n');
  } catch (error) {
    if (transactionStarted) await connection.rollback();
    throw error;
  } finally {
    try {
      if (lockAcquired) await queryOne('SELECT RELEASE_LOCK(?) AS released', [lockName], connection);
    } finally {
      connection.release();
      await pool.end();
    }
  }
}

main().catch((error: unknown) => {
  console.error(error instanceof Error ? error.message : error);
  process.exitCode = 1;
});
