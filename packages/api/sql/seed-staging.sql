DROP PROCEDURE IF EXISTS `seed_staging_demo_data`;
DELIMITER //
CREATE PROCEDURE `seed_staging_demo_data`()
BEGIN
  DECLARE v_station_id INTEGER;
  DECLARE v_magasin_id INTEGER;
  DECLARE v_equipe_id INTEGER;
  DECLARE v_caisse_id INTEGER;
  DECLARE v_vendeur_id INTEGER;
  DECLARE v_cuve_sp95_id INTEGER;
  DECLARE v_cuve_gasoil_id INTEGER;
  DECLARE v_pompe_sp95_id INTEGER;
  DECLARE v_mode_payment_id INTEGER;
  DECLARE v_famille_id INTEGER;
  DECLARE v_fournisseur_fuel_id INTEGER;
  DECLARE v_fournisseur_boutique_id INTEGER;
  DECLARE v_client_taxi_id INTEGER;
  DECLARE v_client_transport_id INTEGER;
  DECLARE v_product_id INTEGER;
  DECLARE v_filter_id INTEGER;
  DECLARE v_achat_prod_id INTEGER;
  DECLARE v_achat_fuel_id INTEGER;
  DECLARE v_inventaire_id INTEGER;
  DECLARE v_recette_id INTEGER;
  DECLARE v_bonliv_id INTEGER;
  DECLARE v_created BOOLEAN DEFAULT FALSE;
  DECLARE v_demo_date DATE DEFAULT '2026-01-15';

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  IF RIGHT(DATABASE(), 8) <> '_staging' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Refusing staging seed: the database name must end with _staging.';
  END IF;

  START TRANSACTION;

  SET v_station_id = (SELECT `id` FROM `Station` WHERE `code` = 'EL-AMAL-DEMO' LIMIT 1);
  SET v_magasin_id = (SELECT `id` FROM `Magasin` WHERE `stationId` = v_station_id LIMIT 1);
  SET v_equipe_id = (SELECT `id` FROM `Equipe` WHERE `code` = 'DEMO-MATIN' LIMIT 1);
  SET v_caisse_id = (SELECT `id` FROM `Caisse` WHERE `code` = 'DEMO-CAISSE' LIMIT 1);
  SET v_vendeur_id = (SELECT `id` FROM `Vendeur` WHERE `matricule` = 'DEMO-VENDEUR' LIMIT 1);
  SET v_cuve_sp95_id = (SELECT `id` FROM `Cuve` WHERE `code` = 'DEMO-SP95' LIMIT 1);
  SET v_cuve_gasoil_id = (SELECT `id` FROM `Cuve` WHERE `code` = 'DEMO-GASOIL' LIMIT 1);
  SET v_pompe_sp95_id = (SELECT `id` FROM `Pompe` WHERE `code` = 'DEMO-P1' LIMIT 1);
  SET v_mode_payment_id = (SELECT `id` FROM `ModePayment` WHERE `libelle` = 'Especes (demo)' LIMIT 1);

  IF v_station_id IS NULL OR v_magasin_id IS NULL OR v_equipe_id IS NULL
     OR v_caisse_id IS NULL OR v_vendeur_id IS NULL OR v_cuve_sp95_id IS NULL
     OR v_cuve_gasoil_id IS NULL OR v_pompe_sp95_id IS NULL OR v_mode_payment_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Run packages/api/sql/seed.sql before the staging seed.';
  END IF;

  INSERT INTO `Fournisseur`
    (`code`, `raisonSociale`, `telephone`, `adresse`, `createdAt`, `updatedAt`)
  SELECT 'STG-DEMO-FUEL', 'Fournisseur carburant (demo staging)', NULL, 'Donnees fictives - staging', NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Fournisseur` WHERE `code` = 'STG-DEMO-FUEL');

  INSERT INTO `Fournisseur`
    (`code`, `raisonSociale`, `telephone`, `adresse`, `createdAt`, `updatedAt`)
  SELECT 'STG-DEMO-SHOP', 'Fournisseur boutique (demo staging)', NULL, 'Donnees fictives - staging', NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Fournisseur` WHERE `code` = 'STG-DEMO-SHOP');

  SET v_fournisseur_fuel_id = (SELECT `id` FROM `Fournisseur` WHERE `code` = 'STG-DEMO-FUEL' LIMIT 1);
  SET v_fournisseur_boutique_id = (SELECT `id` FROM `Fournisseur` WHERE `code` = 'STG-DEMO-SHOP' LIMIT 1);

  INSERT INTO `Client`
    (`nomClient`, `adresse`, `telephone`, `quota`, `soldeAnterieur`, `tva`, `createdAt`, `updatedAt`)
  SELECT 'Client taxi (demo staging)', 'Donnees fictives - staging', NULL, 1500, 0, 19, NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Client` WHERE `nomClient` = 'Client taxi (demo staging)');

  INSERT INTO `Client`
    (`nomClient`, `adresse`, `telephone`, `quota`, `soldeAnterieur`, `tva`, `createdAt`, `updatedAt`)
  SELECT 'Client transport (demo staging)', 'Donnees fictives - staging', NULL, 3000, 0, 19, NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Client` WHERE `nomClient` = 'Client transport (demo staging)');

  SET v_client_taxi_id = (SELECT `id` FROM `Client` WHERE `nomClient` = 'Client taxi (demo staging)' ORDER BY `id` LIMIT 1);
  SET v_client_transport_id = (SELECT `id` FROM `Client` WHERE `nomClient` = 'Client transport (demo staging)' ORDER BY `id` LIMIT 1);

  INSERT INTO `FamilleProduit`
    (`libelle`, `typeProd`, `compteCPT`, `compteACH`, `createdAt`, `updatedAt`)
  SELECT 'Demo staging - lubrifiants', 'Boutique', '707100', '607100', NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `FamilleProduit` WHERE `libelle` = 'Demo staging - lubrifiants');

  SET v_famille_id = (SELECT `id` FROM `FamilleProduit` WHERE `libelle` = 'Demo staging - lubrifiants' ORDER BY `id` LIMIT 1);

  INSERT INTO `Produit`
    (`code`, `codeProduit`, `libelle`, `prixVenteHT`, `tva`, `actif`, `familleId`,
     `fournisseurId`, `prixAchatHT`, `stock`, `tauxTVA`, `createdAt`, `updatedAt`)
  SELECT 'STG-HUILE-5W30', 'STG-HUILE-5W30', 'Huile moteur 5W30 (demo staging)',
         30, 19, TRUE, v_famille_id, v_fournisseur_boutique_id, 18.5, 0, 19, NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Produit` WHERE `code` = 'STG-HUILE-5W30' OR `codeProduit` = 'STG-HUILE-5W30');

  INSERT INTO `Produit`
    (`code`, `codeProduit`, `libelle`, `prixVenteHT`, `tva`, `actif`, `familleId`,
     `fournisseurId`, `prixAchatHT`, `stock`, `tauxTVA`, `createdAt`, `updatedAt`)
  SELECT 'STG-FILTRE-AIR', 'STG-FILTRE-AIR', 'Filtre a air (demo staging)',
         24, 19, TRUE, v_famille_id, v_fournisseur_boutique_id, 15, 0, 19, NOW(3), NOW(3)
  WHERE NOT EXISTS (SELECT 1 FROM `Produit` WHERE `code` = 'STG-FILTRE-AIR' OR `codeProduit` = 'STG-FILTRE-AIR');

  SET v_product_id = (SELECT `id` FROM `Produit` WHERE `code` = 'STG-HUILE-5W30' LIMIT 1);
  SET v_filter_id = (SELECT `id` FROM `Produit` WHERE `code` = 'STG-FILTRE-AIR' LIMIT 1);

  IF v_fournisseur_fuel_id IS NULL OR v_fournisseur_boutique_id IS NULL
     OR v_client_taxi_id IS NULL OR v_client_transport_id IS NULL
     OR v_famille_id IS NULL OR v_product_id IS NULL OR v_filter_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'A staging demo record conflicts with a reserved seed code or name.';
  END IF;

  SET v_achat_prod_id = (
    SELECT `id` FROM `AchatProd` WHERE `numFacture` = 'STG-DEMO-ACHAT-PROD-001' LIMIT 1
  );
  IF v_achat_prod_id IS NULL THEN
    INSERT INTO `AchatProd`
      (`fournisseurId`, `magasinId`, `dateAchat`, `numFacture`, `dateFacture`, `totalTTC`, `totHT`,
       `reste`, `valide`, `createdAt`, `updatedAt`)
    VALUES
      (v_fournisseur_boutique_id, v_magasin_id, '2026-01-14', 'STG-DEMO-ACHAT-PROD-001', '2026-01-14',
       406.98, 342, 406.98, FALSE, NOW(3), NOW(3));
    SET v_achat_prod_id = LAST_INSERT_ID();

    INSERT INTO `DetailAchatProd`
      (`achatProdId`, `produitId`, `date`, `quantite`, `prixAchat`, `tauxTVA`, `valide`, `createdAt`, `updatedAt`)
    VALUES
      (v_achat_prod_id, v_product_id, '2026-01-14', 12, 18.5, 19, FALSE, NOW(3), NOW(3)),
      (v_achat_prod_id, v_filter_id, '2026-01-14', 8, 15, 19, FALSE, NOW(3), NOW(3));

    UPDATE `Produit`
    SET `stock` = `stock` + 12, `updatedAt` = NOW(3)
    WHERE `id` = v_product_id;

    UPDATE `Produit`
    SET `stock` = `stock` + 8, `updatedAt` = NOW(3)
    WHERE `id` = v_filter_id;
  END IF;

  SET v_achat_fuel_id = (
    SELECT `id` FROM `AchatEssence` WHERE `reference` = 'STG-DEMO-ACHAT-FUEL-001' LIMIT 1
  );
  IF v_achat_fuel_id IS NULL THEN
    INSERT INTO `AchatEssence`
      (`date`, `fournisseurId`, `type`, `reference`, `magasinId`, `createdAt`, `updatedAt`)
    VALUES
      ('2026-01-14', v_fournisseur_fuel_id, 'achat', 'STG-DEMO-ACHAT-FUEL-001', v_magasin_id, NOW(3), NOW(3));
    SET v_achat_fuel_id = LAST_INSERT_ID();

    INSERT INTO `DetailAchatEssence`
      (`achatId`, `cuveId`, `quantite`, `prixUnitaire`, `createdAt`, `updatedAt`)
    VALUES
      (v_achat_fuel_id, v_cuve_gasoil_id, 8000, 1.5, NOW(3), NOW(3));
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM `MobVCarCaisse`
    WHERE `date` = v_demo_date AND `equipeId` = v_equipe_id
      AND `caisseId` = v_caisse_id AND `pompeId` = v_pompe_sp95_id
  ) THEN
    INSERT INTO `MobVCarCaisse`
      (`date`, `equipeId`, `caisseId`, `pompeId`, `vendeurId`,
       `indexOuverture`, `indexFermeture`, `prixVente`, `createdAt`, `updatedAt`)
    VALUES
      (v_demo_date, v_equipe_id, v_caisse_id, v_pompe_sp95_id, v_vendeur_id,
       50000, 50060, 2.525, NOW(3), NOW(3));
  END IF;

  SET v_recette_id = (
    SELECT `id` FROM `RecetteCaisse`
    WHERE `date` = v_demo_date AND `equipeId` = v_equipe_id AND `caisseId` = v_caisse_id
    LIMIT 1
  );
  IF v_recette_id IS NULL THEN
    INSERT INTO `RecetteCaisse`
      (`date`, `equipeId`, `caisseId`, `vendeurId`, `totalRecettes`, `fait`,
       `magasinId`, `createdAt`, `updatedAt`)
    VALUES
      (v_demo_date, v_equipe_id, v_caisse_id, v_vendeur_id, 151.5, FALSE,
       v_magasin_id, NOW(3), NOW(3));
    SET v_recette_id = LAST_INSERT_ID();
    SET v_created = TRUE;
  END IF;

  IF v_created THEN
    INSERT INTO `DetailRecetteCaisse`
      (`numRecette`, `modePaymentId`, `montant`, `numero`, `idCuve`, `createdAt`, `updatedAt`)
    VALUES
      (v_recette_id, v_mode_payment_id, 151.5, 'STG-DEMO-RECETTE-001', v_cuve_sp95_id, NOW(3), NOW(3));
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM `Bonliv` WHERE `clientId` = v_client_taxi_id AND `date` = v_demo_date
  ) THEN
    INSERT INTO `Bonliv`
      (`date`, `clientId`, `totalHT`, `totalTTC`, `totTVA`, `createdAt`, `updatedAt`)
    VALUES
      (v_demo_date, v_client_taxi_id, 60, 71.4, 11.4, NOW(3), NOW(3));
    SET v_bonliv_id = LAST_INSERT_ID();

    INSERT INTO `Detbonliv`
      (`numLigne`, `bonlivId`, `idProduit`, `puHT`, `tva`, `qte`, `remise`, `ttc`, `date`, `createdAt`, `updatedAt`)
    VALUES
      (1, v_bonliv_id, v_product_id, 30, 19, 2, 0, 71.4, v_demo_date, NOW(3), NOW(3));
  END IF;

  SET v_inventaire_id = (
    SELECT `id` FROM `InventaireCarburant`
    WHERE `date` = v_demo_date AND `magasinId` = v_magasin_id
    LIMIT 1
  );
  IF v_inventaire_id IS NULL THEN
    INSERT INTO `InventaireCarburant`
      (`date`, `operateur`, `cloture`, `valeurStock`, `magasinId`, `createdAt`, `updatedAt`)
    VALUES
      (v_demo_date, 'Demo staging', FALSE, 62388.5, v_magasin_id, NOW(3), NOW(3));
    SET v_inventaire_id = LAST_INSERT_ID();

    INSERT INTO `DetailInventaireCarburant`
      (`inventaireCarId`, `cuveId`, `date`, `stockPhysique`, `stockComptable`,
       `prixUnitaire`, `valeur`, `ecart`, `createdAt`)
    VALUES
      (v_inventaire_id, v_cuve_sp95_id, v_demo_date, 11980, 12000, 1.7, 20366, -20, NOW(3)),
      (v_inventaire_id, v_cuve_gasoil_id, v_demo_date, 28015, 28000, 1.5, 42022.5, 15, NOW(3));
  END IF;

  COMMIT;
END//
DELIMITER ;

CALL `seed_staging_demo_data`();
DROP PROCEDURE `seed_staging_demo_data`;
