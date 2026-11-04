-- MySQL 8.0+ data export converted from the project MongoDB archive.
-- ObjectId values are retained as 24-character strings; MongoDB references are not enforced as foreign keys.
-- Embedded Mongoose arrays are represented by ordered child tables. Mixed fields are stored as JSON. Password hashes and refresh tokens are sensitive.
SET NAMES utf8mb4;
SET SQL_MODE = 'NO_BACKSLASH_ESCAPES';
CREATE DATABASE IF NOT EXISTS `kiosk_tunisia` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `kiosk_tunisia`;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

CREATE TABLE IF NOT EXISTS `users` (
  `id` CHAR(24) NOT NULL,
  `username` VARCHAR(191) NULL,
  `email` VARCHAR(191) NULL,
  `password_hash` VARCHAR(255) NULL,
  `role` VARCHAR(191) NULL,
  `first_name` VARCHAR(191) NULL,
  `last_name` VARCHAR(191) NULL,
  `phone` VARCHAR(191) NULL,
  `active` TINYINT(1) NULL,
  `station_id` CHAR(24) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_users_username (username),
  UNIQUE KEY uq_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `role`, `first_name`, `last_name`, `phone`, `active`, `station_id`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f6820ef314025d47170d', 'admin', 'admin@fuelstation.tn', '$2b$10$RYhP1/r1S2jaIP5mNPJtM.3XI53P2RipJEybIpRpDsOWjcr0xqkGa', 'ADMIN', 'Station', 'Administrator', NULL, 1, NULL, '2026-10-29 07:32:18.289000', '2026-10-30 07:37:49.076000', 0),
('6ae2ffae22bbcb7a6e400d22', 'demo_st001_manager', 'demo_st001_manager@example.test', '$2b$10$sQG3PFtD5kGEA5iQ1l04lOYVSFryoFZ9HR1tqgHfd1nAfDGoIRc/u', 'MANAGER', 'Nabil', 'Hammami', '+216 20 555 000', 1, '6ae2f6830ef314025d471724', '2026-10-29 08:11:26.246000', '2026-10-29 08:11:26.246000', 0),
('6ae2ffae22bbcb7a6e400d25', 'demo_st001_supervisor', 'demo_st001_supervisor@example.test', '$2b$10$sF.pMKXwRMXYh3PJvQQyKuqSi2gn7ynwP8RsC4uGG3QyHMXaKh.TC', 'SUPERVISOR', 'Salma', 'Ben Ali', '+216 20 555 001', 1, '6ae2f6830ef314025d471724', '2026-10-29 08:11:26.394000', '2026-10-29 08:11:26.394000', 0),
('6ae2ffae22bbcb7a6e400d28', 'demo_st001_operator', 'demo_st001_operator@example.test', '$2b$10$AgcL6rSVdcL1kyn1nTMPY.nAEZNWqT.Eazqc46u1pSrpkuvoigAW2', 'OPERATOR', 'Hedi', 'Mansour', '+216 20 555 002', 1, '6ae2f6830ef314025d471724', '2026-10-29 08:11:26.502000', '2026-10-29 08:11:26.502000', 0),
('6ae2ffae22bbcb7a6e400d63', 'demo_st002_manager', 'demo_st002_manager@example.test', '$2b$10$/URJKP3/opkF.82s9awT5OPrM/vaYVZv7HzXoTD9dt6tMBxc0kt36', 'MANAGER', 'Nabil', 'Hammami', '+216 20 555 010', 1, '6ae2ffae22bbcb7a6e400d12', '2026-10-29 08:11:26.781000', '2026-10-29 08:11:26.781000', 0),
('6ae2ffae22bbcb7a6e400d66', 'demo_st002_supervisor', 'demo_st002_supervisor@example.test', '$2b$10$hs7MtyREE.7DdRzZ.pMr/eXpvmj95LyuX.4PjvEqUJ015ETHNXVAC', 'SUPERVISOR', 'Salma', 'Ben Ali', '+216 20 555 011', 1, '6ae2ffae22bbcb7a6e400d12', '2026-10-29 08:11:26.883000', '2026-10-29 08:11:26.883000', 0),
('6ae2ffae22bbcb7a6e400d69', 'demo_st002_operator', 'demo_st002_operator@example.test', '$2b$10$htC7pnGtfmJpBKE0d1ek7O2pyA8oOyET/0cyMXTFelGlN6f2bZU0O', 'OPERATOR', 'Hedi', 'Mansour', '+216 20 555 012', 1, '6ae2ffae22bbcb7a6e400d12', '2026-10-29 08:11:26.988000', '2026-10-29 08:11:26.988000', 0),
('6ae2ffaf22bbcb7a6e400da4', 'demo_st003_manager', 'demo_st003_manager@example.test', '$2b$10$/wqpVWLf4Qg9KPdP2c0va.BEu5pVwz62TqcSxRlDc/Guv6I8nRDQ.', 'MANAGER', 'Nabil', 'Hammami', '+216 20 555 020', 1, '6ae2ffae22bbcb7a6e400d15', '2026-10-29 08:11:27.183000', '2026-10-29 08:11:27.183000', 0),
('6ae2ffaf22bbcb7a6e400da7', 'demo_st003_supervisor', 'demo_st003_supervisor@example.test', '$2b$10$aPi381MmBYPZCes9.mqk5uZ5CP1F89JDwYInoihRr0sICRVe2YAe2', 'SUPERVISOR', 'Salma', 'Ben Ali', '+216 20 555 021', 1, '6ae2ffae22bbcb7a6e400d15', '2026-10-29 08:11:27.281000', '2026-10-29 08:11:27.281000', 0),
('6ae2ffaf22bbcb7a6e400daa', 'demo_st003_operator', 'demo_st003_operator@example.test', '$2b$10$FMG4ImQHYhVo2xbfteuYdeuzh8i9ORWJqXAhvpd4gLlExXWg7yKJW', 'OPERATOR', 'Hedi', 'Mansour', '+216 20 555 022', 1, '6ae2ffae22bbcb7a6e400d15', '2026-10-29 08:11:27.380000', '2026-10-29 08:11:27.380000', 0),
('6ae2ffaf22bbcb7a6e400de5', 'demo_st004_manager', 'demo_st004_manager@example.test', '$2b$10$NWUNjo4bG.EuaILocwTmDu8PUPJJyGSwagAbEvV0kNl19cB4h70l2', 'MANAGER', 'Nabil', 'Hammami', '+216 20 555 030', 1, '6ae2ffae22bbcb7a6e400d18', '2026-10-29 08:11:27.567000', '2026-10-29 08:11:27.567000', 0),
('6ae2ffaf22bbcb7a6e400de8', 'demo_st004_supervisor', 'demo_st004_supervisor@example.test', '$2b$10$GxsalXopL24LEiS6.r2eaOePxmIxg/xkCCUQCC7aq1xHDdSHbv.FK', 'SUPERVISOR', 'Salma', 'Ben Ali', '+216 20 555 031', 1, '6ae2ffae22bbcb7a6e400d18', '2026-10-29 08:11:27.665000', '2026-10-29 08:11:27.665000', 0),
('6ae2ffaf22bbcb7a6e400deb', 'demo_st004_operator', 'demo_st004_operator@example.test', '$2b$10$qywcRROIMavkJbLEqAv5Z.uRlzvChQuWpfs17wLWy7s/ciQRcfGe6', 'OPERATOR', 'Hedi', 'Mansour', '+216 20 555 032', 1, '6ae2ffae22bbcb7a6e400d18', '2026-10-29 08:11:27.766000', '2026-10-29 08:11:27.766000', 0),
('6ae34939785dcf31ee0db321', 'ghassen85', 'ghassen@gmail.com', '$2b$10$rvsZanAV7c.VkzLjFuK7KOnZ5XNBwnvFAYW5iTidtttr2kvO8W5nq', 'OPERATOR', 'ghassen', 'ben', NULL, 1, NULL, '2026-10-29 13:25:13.240000', '2026-10-29 13:25:13.240000', 0);

CREATE TABLE IF NOT EXISTS `stations` (
  `id` CHAR(24) NOT NULL,
  `name` VARCHAR(191) NULL,
  `code` VARCHAR(191) NULL,
  `address` TEXT NULL,
  `city` VARCHAR(191) NULL,
  `phone` VARCHAR(191) NULL,
  `tax_id` VARCHAR(191) NULL,
  `manager_id` CHAR(24) NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_stations_code (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `stations` (`id`, `name`, `code`, `address`, `city`, `phone`, `tax_id`, `manager_id`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f6830ef314025d471724', 'Station Kiosque - Les Berges du Lac 2', 'ST-001', 'Avenue de la Bourse, Lac 2', 'Tunis', '+216 71 999 888', '1234567/A/M/000', '6ae2ffae22bbcb7a6e400d22', 1, '2026-10-29 07:32:19.299000', '2026-10-29 08:11:26.608000', 0),
('6ae2ffae22bbcb7a6e400d12', 'Station Sousse Centre', 'ST-002', 'Avenue Habib Bourguiba', 'Sousse', '+216 73 210 002', 'DEMO-002', '6ae2ffae22bbcb7a6e400d63', 1, '2026-10-29 08:11:26.164000', '2026-10-29 08:11:27.086000', 0),
('6ae2ffae22bbcb7a6e400d15', 'Station Sfax Port', 'ST-003', 'Route du Port', 'Sfax', '+216 74 210 003', 'DEMO-003', '6ae2ffaf22bbcb7a6e400da4', 1, '2026-10-29 08:11:26.179000', '2026-10-29 08:11:27.473000', 0),
('6ae2ffae22bbcb7a6e400d18', 'Station Hammamet Centre', 'ST-004', 'Avenue de la République', 'Hammamet', '+216 72 210 004', 'DEMO-004', '6ae2ffaf22bbcb7a6e400de5', 1, '2026-10-29 08:11:26.192000', '2026-10-29 08:11:27.866000', 0),
('6ae31e24ca07390732450971', 'station gabes', 'STATION-23', 'gabes', 'Gabes', '+21675000222', '2385', NULL, 1, '2026-10-29 10:21:24.600000', '2026-10-29 10:21:24.600000', 0);

CREATE TABLE IF NOT EXISTS `products` (
  `id` CHAR(24) NOT NULL,
  `name` VARCHAR(191) NULL,
  `code` VARCHAR(191) NULL,
  `category` VARCHAR(191) NULL,
  `purchase_price` DOUBLE NULL,
  `selling_price` DOUBLE NULL,
  `vat_rate` DOUBLE NULL,
  `unit_of_measure` VARCHAR(191) NULL,
  `min_stock_alert` DOUBLE NULL,
  `current_stock` DOUBLE NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_products_code (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `products` (`id`, `name`, `code`, `category`, `purchase_price`, `selling_price`, `vat_rate`, `unit_of_measure`, `min_stock_alert`, `current_stock`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 'FUEL', 1.85, 2.2, 19.0, 'LITER', 3000.0, 15000.0, 1, '2026-10-29 07:32:19.233000', '2026-10-29 07:32:19.233000', 0),
('6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 'FUEL', 2.1, 2.52, 19.0, 'LITER', 2500.0, 18000.0, 1, '2026-10-29 07:32:19.286000', '2026-10-29 07:32:19.286000', 0),
('6ae2f6830ef314025d471721', 'Gasoil 50 Premium', 'GASOIL_50', 'FUEL', 2.02, 2.4, 19.0, 'LITER', 2000.0, 12000.0, 1, '2026-10-29 07:32:19.294000', '2026-10-29 07:32:19.294000', 0);

CREATE TABLE IF NOT EXISTS `pumps` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `pump_number` VARCHAR(191) NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `pumps` (`id`, `station_id`, `pump_number`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f6830ef314025d47172e', '6ae2f6830ef314025d471724', 'Pump 01', 1, '2026-10-29 07:32:19.334000', '2026-10-29 07:32:19.334000', 0),
('6ae2f6830ef314025d471731', '6ae2f6830ef314025d471724', 'Pump 02', 1, '2026-10-29 07:32:19.334000', '2026-10-29 07:32:19.334000', 0),
('6ae2f6830ef314025d471734', '6ae2f6830ef314025d471724', 'Pump 03', 1, '2026-10-29 07:32:19.334000', '2026-10-29 07:32:19.334000', 0),
('6ae2f6830ef314025d471737', '6ae2f6830ef314025d471724', 'Pump 04', 1, '2026-10-29 07:32:19.334000', '2026-10-29 07:32:19.334000', 0),
('6ae2ffae22bbcb7a6e400d3b', '6ae2f6830ef314025d471724', 'Demo ST-001 Pompe 01', 1, '2026-10-29 08:11:26.665000', '2026-10-29 08:11:26.665000', 0),
('6ae2ffaf22bbcb7a6e400d7c', '6ae2ffae22bbcb7a6e400d12', 'Demo ST-002 Pompe 01', 1, '2026-10-29 08:11:27.117000', '2026-10-29 08:11:27.117000', 0),
('6ae2ffaf22bbcb7a6e400dbd', '6ae2ffae22bbcb7a6e400d15', 'Demo ST-003 Pompe 01', 1, '2026-10-29 08:11:27.501000', '2026-10-29 08:11:27.501000', 0),
('6ae2ffaf22bbcb7a6e400dfe', '6ae2ffae22bbcb7a6e400d18', 'Demo ST-004 Pompe 01', 1, '2026-10-29 08:11:27.894000', '2026-10-29 08:11:27.894000', 0);

CREATE TABLE IF NOT EXISTS `tanks` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `product_id` CHAR(24) NULL,
  `tank_number` VARCHAR(191) NULL,
  `capacity` DOUBLE NULL,
  `current_stock` DOUBLE NULL,
  `min_level_alert` DOUBLE NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `tanks` (`id`, `station_id`, `product_id`, `tank_number`, `capacity`, `current_stock`, `min_level_alert`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f6830ef314025d471727', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d47171d', 'Tank 1 - Gasoil (25,000L)', 25000.0, 15000.0, 3000.0, 1, '2026-10-29 07:32:19.310000', '2026-10-29 07:32:19.310000', 0),
('6ae2f6830ef314025d471728', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d47171f', 'Tank 2 - Sans Plomb (30,000L)', 30000.0, 18000.0, 2500.0, 1, '2026-10-29 07:32:19.310000', '2026-10-29 07:32:19.310000', 0),
('6ae2f6830ef314025d471729', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d471721', 'Tank 3 - Gasoil 50 (20,000L)', 20000.0, 12000.0, 2000.0, 1, '2026-10-29 07:32:19.310000', '2026-10-29 07:32:19.310000', 0),
('6ae2ffae22bbcb7a6e400d32', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d47171d', 'Demo ST-001 Cuve 1', 20000.0, 10000.0, 2000.0, 1, '2026-10-29 08:11:26.637000', '2026-10-29 08:11:26.637000', 0),
('6ae2ffae22bbcb7a6e400d35', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d47171f', 'Demo ST-001 Cuve 2', 25000.0, 11000.0, 2000.0, 1, '2026-10-29 08:11:26.647000', '2026-10-29 08:11:26.647000', 0),
('6ae2ffae22bbcb7a6e400d38', '6ae2f6830ef314025d471724', '6ae2f6830ef314025d471721', 'Demo ST-001 Cuve 3', 30000.0, 12000.0, 2000.0, 1, '2026-10-29 08:11:26.652000', '2026-10-29 08:11:26.652000', 0),
('6ae2ffaf22bbcb7a6e400d73', '6ae2ffae22bbcb7a6e400d12', '6ae2f6830ef314025d47171d', 'Demo ST-002 Cuve 1', 20000.0, 10500.0, 2000.0, 1, '2026-10-29 08:11:27.101000', '2026-10-29 08:11:27.101000', 0),
('6ae2ffaf22bbcb7a6e400d76', '6ae2ffae22bbcb7a6e400d12', '6ae2f6830ef314025d47171f', 'Demo ST-002 Cuve 2', 25000.0, 11500.0, 2000.0, 1, '2026-10-29 08:11:27.106000', '2026-10-29 08:11:27.106000', 0),
('6ae2ffaf22bbcb7a6e400d79', '6ae2ffae22bbcb7a6e400d12', '6ae2f6830ef314025d471721', 'Demo ST-002 Cuve 3', 30000.0, 12500.0, 2000.0, 1, '2026-10-29 08:11:27.112000', '2026-10-29 08:11:27.112000', 0),
('6ae2ffaf22bbcb7a6e400db4', '6ae2ffae22bbcb7a6e400d15', '6ae2f6830ef314025d47171d', 'Demo ST-003 Cuve 1', 20000.0, 11000.0, 2000.0, 1, '2026-10-29 08:11:27.486000', '2026-10-29 08:11:27.486000', 0),
('6ae2ffaf22bbcb7a6e400db7', '6ae2ffae22bbcb7a6e400d15', '6ae2f6830ef314025d47171f', 'Demo ST-003 Cuve 2', 25000.0, 12000.0, 2000.0, 1, '2026-10-29 08:11:27.490000', '2026-10-29 08:11:27.490000', 0),
('6ae2ffaf22bbcb7a6e400dba', '6ae2ffae22bbcb7a6e400d15', '6ae2f6830ef314025d471721', 'Demo ST-003 Cuve 3', 30000.0, 13000.0, 2000.0, 1, '2026-10-29 08:11:27.497000', '2026-10-29 08:11:27.497000', 0),
('6ae2ffaf22bbcb7a6e400df5', '6ae2ffae22bbcb7a6e400d18', '6ae2f6830ef314025d47171d', 'Demo ST-004 Cuve 1', 20000.0, 11500.0, 2000.0, 1, '2026-10-29 08:11:27.880000', '2026-10-29 08:11:27.880000', 0),
('6ae2ffaf22bbcb7a6e400df8', '6ae2ffae22bbcb7a6e400d18', '6ae2f6830ef314025d47171f', 'Demo ST-004 Cuve 2', 25000.0, 12500.0, 2000.0, 1, '2026-10-29 08:11:27.884000', '2026-10-29 08:11:27.884000', 0),
('6ae2ffaf22bbcb7a6e400dfb', '6ae2ffae22bbcb7a6e400d18', '6ae2f6830ef314025d471721', 'Demo ST-004 Cuve 3', 30000.0, 13500.0, 2000.0, 1, '2026-10-29 08:11:27.887000', '2026-10-29 08:11:27.887000', 0);

CREATE TABLE IF NOT EXISTS `shifts` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `shift_type` VARCHAR(191) NULL,
  `shift_date` DATETIME(6) NULL,
  `shift_number` INT NULL,
  `status` VARCHAR(191) NULL,
  `opened_by_id` CHAR(24) NULL,
  `closed_by_id` CHAR(24) NULL,
  `team_id` CHAR(24) NULL,
  `total_sales_ht` DOUBLE NULL,
  `total_vat` DOUBLE NULL,
  `total_sales_ttc` DOUBLE NULL,
  `total_profit` DOUBLE NULL,
  `cash_amount` DOUBLE NULL,
  `bank_card_amount` DOUBLE NULL,
  `fuel_card_amount` DOUBLE NULL,
  `bank_transfer_amount` DOUBLE NULL,
  `credit_amount` DOUBLE NULL,
  `total_payments` DOUBLE NULL,
  `balance` DOUBLE NULL,
  `is_balanced` TINYINT(1) NULL,
  `total_expenses` DOUBLE NULL,
  `opened_at` DATETIME(6) NULL,
  `closed_at` DATETIME(6) NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_shifts_station_date_type (station_id, shift_date, shift_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `shifts` (`id`, `station_id`, `shift_type`, `shift_date`, `shift_number`, `status`, `opened_by_id`, `closed_by_id`, `team_id`, `total_sales_ht`, `total_vat`, `total_sales_ttc`, `total_profit`, `cash_amount`, `bank_card_amount`, `fuel_card_amount`, `bank_transfer_amount`, `credit_amount`, `total_payments`, `balance`, `is_balanced`, `total_expenses`, `opened_at`, `closed_at`, `notes`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d40', '6ae2f6830ef314025d471724', 'MORNING', '2026-10-29 00:00:00.000000', 1, 'CLOSED', '6ae2ffae22bbcb7a6e400d22', '6ae2ffae22bbcb7a6e400d22', '6ae2ffae22bbcb7a6e400d2c', 290.756, 55.244, 346.0, 56.0, 220.0, 126.0, 0.0, 0.0, 0.0, 346.0, 0.0, 1, 0.0, '2026-10-29 06:00:00.000000', '2026-10-29 14:00:00.000000', 'DEMO DATA: Morning shift for Station Kiosque - Les Berges du Lac 2', '2026-10-29 08:11:26.685000', '2026-10-29 08:11:26.685000', 0),
('6ae2ffae22bbcb7a6e400d45', '6ae2f6830ef314025d471724', 'AFTERNOON', '2026-10-29 00:00:00.000000', 2, 'OPEN', '6ae2ffae22bbcb7a6e400d22', NULL, '6ae2ffae22bbcb7a6e400d2f', 0.0, 0.0, 0.0, 0.0, 0.011, 0.025, 0.024, 0.017, 0.043, 0.12, 0.12, 0, 0.0, '2026-10-29 08:11:26.694000', NULL, 'DEMO DATA: Open afternoon shift for Station Kiosque - Les Berges du Lac 2', '2026-10-29 08:11:26.696000', '2026-10-29 08:14:14.486000', 0),
('6ae2ffaf22bbcb7a6e400d81', '6ae2ffae22bbcb7a6e400d12', 'MORNING', '2026-10-29 00:00:00.000000', 1, 'CLOSED', '6ae2ffae22bbcb7a6e400d63', '6ae2ffae22bbcb7a6e400d63', '6ae2ffaf22bbcb7a6e400d6d', 290.756, 55.244, 346.0, 56.0, 220.0, 126.0, 0.0, 0.0, 0.0, 346.0, 0.0, 1, 0.0, '2026-10-29 06:00:00.000000', '2026-10-29 14:00:00.000000', 'DEMO DATA: Morning shift for Station Sousse Centre', '2026-10-29 08:11:27.128000', '2026-10-29 08:11:27.128000', 0),
('6ae2ffaf22bbcb7a6e400d86', '6ae2ffae22bbcb7a6e400d12', 'AFTERNOON', '2026-10-29 00:00:00.000000', 2, 'OPEN', '6ae2ffae22bbcb7a6e400d63', NULL, '6ae2ffaf22bbcb7a6e400d70', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, '2026-10-29 08:11:27.132000', NULL, 'DEMO DATA: Open afternoon shift for Station Sousse Centre', '2026-10-29 08:11:27.134000', '2026-10-29 08:11:27.134000', 0),
('6ae2ffaf22bbcb7a6e400dc2', '6ae2ffae22bbcb7a6e400d15', 'MORNING', '2026-10-29 00:00:00.000000', 1, 'CLOSED', '6ae2ffaf22bbcb7a6e400da4', '6ae2ffaf22bbcb7a6e400da4', '6ae2ffaf22bbcb7a6e400dae', 290.756, 55.244, 346.0, 56.0, 220.0, 126.0, 0.0, 0.0, 0.0, 346.0, 0.0, 1, 0.0, '2026-10-29 06:00:00.000000', '2026-10-29 14:00:00.000000', 'DEMO DATA: Morning shift for Station Sfax Port', '2026-10-29 08:11:27.514000', '2026-10-29 08:11:27.514000', 0),
('6ae2ffaf22bbcb7a6e400dc7', '6ae2ffae22bbcb7a6e400d15', 'AFTERNOON', '2026-10-29 00:00:00.000000', 2, 'OPEN', '6ae2ffaf22bbcb7a6e400da4', NULL, '6ae2ffaf22bbcb7a6e400db1', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, '2026-10-29 08:11:27.520000', NULL, 'DEMO DATA: Open afternoon shift for Station Sfax Port', '2026-10-29 08:11:27.521000', '2026-10-29 08:11:27.521000', 0),
('6ae2ffaf22bbcb7a6e400e03', '6ae2ffae22bbcb7a6e400d18', 'MORNING', '2026-10-29 00:00:00.000000', 1, 'CLOSED', '6ae2ffaf22bbcb7a6e400de5', '6ae2ffaf22bbcb7a6e400de5', '6ae2ffaf22bbcb7a6e400def', 290.756, 55.244, 346.0, 56.0, 220.0, 126.0, 0.0, 0.0, 0.0, 346.0, 0.0, 1, 0.0, '2026-10-29 06:00:00.000000', '2026-10-29 14:00:00.000000', 'DEMO DATA: Morning shift for Station Hammamet Centre', '2026-10-29 08:11:27.902000', '2026-10-29 08:11:27.902000', 0),
('6ae2ffaf22bbcb7a6e400e08', '6ae2ffae22bbcb7a6e400d18', 'AFTERNOON', '2026-10-29 00:00:00.000000', 2, 'OPEN', '6ae2ffaf22bbcb7a6e400de5', NULL, '6ae2ffaf22bbcb7a6e400df2', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, '2026-10-29 08:11:27.906000', NULL, 'DEMO DATA: Open afternoon shift for Station Hammamet Centre', '2026-10-29 08:11:27.908000', '2026-10-29 08:11:27.908000', 0),
('6ae3000c2c688913b8dc3902', '6ae2ffae22bbcb7a6e400d18', 'MORNING', '2026-10-30 00:00:00.000000', 1, 'OPEN', '6ae2f6820ef314025d47170d', NULL, '6ae2ffaf22bbcb7a6e400dae', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, '2026-10-29 08:13:00.249000', NULL, NULL, '2026-10-29 08:13:00.267000', '2026-10-29 08:13:00.267000', 0),
('6ae31d4aca0739073245090c', '6ae2ffae22bbcb7a6e400d18', 'NIGHT', '2026-10-29 00:00:00.000000', 3, 'CLOSED', '6ae2f6820ef314025d47170d', '6ae2f6820ef314025d47170d', '6ae2ffaf22bbcb7a6e400db1', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, '2026-10-29 10:17:46.407000', '2026-10-29 10:18:41.367000', '', '2026-10-29 10:17:46.432000', '2026-10-29 10:18:41.371000', 0);

CREATE TABLE IF NOT EXISTS `customers` (
  `id` CHAR(24) NOT NULL,
  `name` VARCHAR(191) NULL,
  `phone` VARCHAR(191) NULL,
  `email` VARCHAR(191) NULL,
  `address` TEXT NULL,
  `credit_balance` DOUBLE NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `credit_balance`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d1f', 'Entreprise Démo', '+216 20 555 010', 'client.demo@example.test', 'Tunis, Tunisie', 0.178, '2026-10-29 08:11:26.229000', '2026-10-29 10:18:32.299000', 0);

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` CHAR(24) NOT NULL,
  `name` VARCHAR(191) NULL,
  `code` VARCHAR(191) NULL,
  `contact_person` VARCHAR(191) NULL,
  `phone` VARCHAR(191) NULL,
  `email` VARCHAR(191) NULL,
  `address` TEXT NULL,
  `tax_id` VARCHAR(191) NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_suppliers_code (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `suppliers` (`id`, `name`, `code`, `contact_person`, `phone`, `email`, `address`, `tax_id`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d1c', 'Fournisseur Démo Tunisie', 'DEMO-SUP-001', 'Amine Ben Salem', '+216 71 555 001', 'demo.supplier@example.test', 'Zone Industrielle, Tunis', 'DEMO-SUP-TAX', 1, '2026-10-29 08:11:26.217000', '2026-10-29 08:11:26.217000', 0);

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `supplier_id` CHAR(24) NULL,
  `type` VARCHAR(191) NULL,
  `description` TEXT NULL,
  `amount` DOUBLE NULL,
  `paid` TINYINT(1) NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `expenses` (`id`, `station_id`, `supplier_id`, `type`, `description`, `amount`, `paid`, `notes`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d4e', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d1c', 'MAINTENANCE', 'Demo maintenance - Station Kiosque - Les Berges du Lac 2', 125.0, 1, 'DEMO DATA: Maintenance expense for ST-001', '2026-10-29 08:11:26.716000', '2026-10-29 08:11:26.716000', 0),
('6ae2ffaf22bbcb7a6e400d8f', '6ae2ffae22bbcb7a6e400d12', '6ae2ffae22bbcb7a6e400d1c', 'MAINTENANCE', 'Demo maintenance - Station Sousse Centre', 135.0, 1, 'DEMO DATA: Maintenance expense for ST-002', '2026-10-29 08:11:27.149000', '2026-10-29 08:11:27.149000', 0),
('6ae2ffaf22bbcb7a6e400dd0', '6ae2ffae22bbcb7a6e400d15', '6ae2ffae22bbcb7a6e400d1c', 'MAINTENANCE', 'Demo maintenance - Station Sfax Port', 145.0, 1, 'DEMO DATA: Maintenance expense for ST-003', '2026-10-29 08:11:27.534000', '2026-10-29 08:11:27.534000', 0),
('6ae2ffaf22bbcb7a6e400e11', '6ae2ffae22bbcb7a6e400d18', '6ae2ffae22bbcb7a6e400d1c', 'MAINTENANCE', 'Demo maintenance - Station Hammamet Centre', 155.0, 1, 'DEMO DATA: Maintenance expense for ST-004', '2026-10-29 08:11:27.927000', '2026-10-29 08:11:27.927000', 0);

CREATE TABLE IF NOT EXISTS `product_purchases` (
  `id` CHAR(24) NOT NULL,
  `product_id` CHAR(24) NULL,
  `station_id` CHAR(24) NULL,
  `supplier` VARCHAR(191) NULL,
  `quantity` DOUBLE NULL,
  `unit_cost` DOUBLE NULL,
  `total_cost` DOUBLE NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `product_purchases` (`id`, `product_id`, `station_id`, `supplier`, `quantity`, `unit_cost`, `total_cost`, `notes`, `created_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d51', '6ae2f6830ef314025d47171d', '6ae2f6830ef314025d471724', 'Fournisseur Démo Tunisie', 2500.0, 1.85, 4625.0, 'DEMO DATA: Fuel delivery for ST-001', '2026-10-29 08:11:26.724000', 0),
('6ae2ffaf22bbcb7a6e400d92', '6ae2f6830ef314025d47171d', '6ae2ffae22bbcb7a6e400d12', 'Fournisseur Démo Tunisie', 2500.0, 1.85, 4625.0, 'DEMO DATA: Fuel delivery for ST-002', '2026-10-29 08:11:27.153000', 0),
('6ae2ffaf22bbcb7a6e400dd3', '6ae2f6830ef314025d47171d', '6ae2ffae22bbcb7a6e400d15', 'Fournisseur Démo Tunisie', 2500.0, 1.85, 4625.0, 'DEMO DATA: Fuel delivery for ST-003', '2026-10-29 08:11:27.536000', 0),
('6ae2ffaf22bbcb7a6e400e14', '6ae2f6830ef314025d47171d', '6ae2ffae22bbcb7a6e400d18', 'Fournisseur Démo Tunisie', 2500.0, 1.85, 4625.0, 'DEMO DATA: Fuel delivery for ST-004', '2026-10-29 08:11:27.931000', 0);

CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` CHAR(24) NOT NULL,
  `supplier_id` CHAR(24) NULL,
  `station_id` CHAR(24) NULL,
  `order_number` VARCHAR(191) NULL,
  `order_date` DATETIME(6) NULL,
  `delivery_date` DATETIME(6) NULL,
  `status` VARCHAR(191) NULL,
  `total_amount` DOUBLE NULL,
  `notes` TEXT NULL,
  `created_by_id` CHAR(24) NULL,
  `delivered_by` VARCHAR(191) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_purchase_orders_number (order_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `station_id`, `order_number`, `order_date`, `delivery_date`, `status`, `total_amount`, `notes`, `created_by_id`, `delivered_by`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d54', '6ae2ffae22bbcb7a6e400d1c', '6ae2f6830ef314025d471724', 'DEMO-PO-ST-001', '2026-10-29 00:00:00.000000', NULL, 'PENDING', 3030.0, 'DEMO DATA: Pending order for Station Kiosque - Les Berges du Lac 2', '6ae2f6820ef314025d47170d', NULL, '2026-10-29 08:11:26.734000', '2026-10-29 08:11:26.734000', 0),
('6ae2ffaf22bbcb7a6e400d95', '6ae2ffae22bbcb7a6e400d1c', '6ae2ffae22bbcb7a6e400d12', 'DEMO-PO-ST-002', '2026-10-29 00:00:00.000000', NULL, 'PENDING', 3030.0, 'DEMO DATA: Pending order for Station Sousse Centre', '6ae2f6820ef314025d47170d', NULL, '2026-10-29 08:11:27.158000', '2026-10-29 08:11:27.158000', 0),
('6ae2ffaf22bbcb7a6e400dd6', '6ae2ffae22bbcb7a6e400d1c', '6ae2ffae22bbcb7a6e400d15', 'DEMO-PO-ST-003', '2026-10-29 00:00:00.000000', NULL, 'PENDING', 3030.0, 'DEMO DATA: Pending order for Station Sfax Port', '6ae2f6820ef314025d47170d', NULL, '2026-10-29 08:11:27.540000', '2026-10-29 08:11:27.540000', 0),
('6ae2ffaf22bbcb7a6e400e17', '6ae2ffae22bbcb7a6e400d1c', '6ae2ffae22bbcb7a6e400d18', 'DEMO-PO-ST-004', '2026-10-29 00:00:00.000000', NULL, 'PENDING', 3030.0, 'DEMO DATA: Pending order for Station Hammamet Centre', '6ae2f6820ef314025d47170d', NULL, '2026-10-29 08:11:27.935000', '2026-10-29 08:11:27.935000', 0);

CREATE TABLE IF NOT EXISTS `tank_gaugings` (
  `id` CHAR(24) NOT NULL,
  `tank_id` CHAR(24) NULL,
  `station_id` CHAR(24) NULL,
  `gauged_at` DATETIME(6) NULL,
  `dip_reading` DOUBLE NULL,
  `calculated_volume` DOUBLE NULL,
  `water_level` DOUBLE NULL,
  `temperature` DOUBLE NULL,
  `theoretical_stock` DOUBLE NULL,
  `variance` DOUBLE NULL,
  `operator_id` CHAR(24) NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `tank_gaugings` (`id`, `tank_id`, `station_id`, `gauged_at`, `dip_reading`, `calculated_volume`, `water_level`, `temperature`, `theoretical_stock`, `variance`, `operator_id`, `notes`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d57', '6ae2ffae22bbcb7a6e400d32', '6ae2f6830ef314025d471724', '2026-10-29 07:00:00.000000', 420.0, 9850.0, 12.0, 22.0, 10000.0, -150.0, '6ae2ffae22bbcb7a6e400d28', 'DEMO DATA: Gauge for ST-001', '2026-10-29 08:11:26.747000', '2026-10-29 08:11:26.747000', 0),
('6ae2ffaf22bbcb7a6e400d98', '6ae2ffaf22bbcb7a6e400d73', '6ae2ffae22bbcb7a6e400d12', '2026-10-29 07:00:00.000000', 420.0, 10350.0, 12.0, 22.0, 10500.0, -150.0, '6ae2ffae22bbcb7a6e400d69', 'DEMO DATA: Gauge for ST-002', '2026-10-29 08:11:27.164000', '2026-10-29 08:11:27.164000', 0),
('6ae2ffaf22bbcb7a6e400dd9', '6ae2ffaf22bbcb7a6e400db4', '6ae2ffae22bbcb7a6e400d15', '2026-10-29 07:00:00.000000', 420.0, 10850.0, 12.0, 22.0, 11000.0, -150.0, '6ae2ffaf22bbcb7a6e400daa', 'DEMO DATA: Gauge for ST-003', '2026-10-29 08:11:27.547000', '2026-10-29 08:11:27.547000', 0),
('6ae2ffaf22bbcb7a6e400e1a', '6ae2ffaf22bbcb7a6e400df5', '6ae2ffae22bbcb7a6e400d18', '2026-10-29 07:00:00.000000', 420.0, 11350.0, 12.0, 22.0, 11500.0, -150.0, '6ae2ffaf22bbcb7a6e400deb', 'DEMO DATA: Gauge for ST-004', '2026-10-29 08:11:27.938000', '2026-10-29 08:11:27.938000', 0);

CREATE TABLE IF NOT EXISTS `kif_returns` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `shift_id` CHAR(24) NULL,
  `return_date` DATETIME(6) NULL,
  `product_id` CHAR(24) NULL,
  `quantity` DOUBLE NULL,
  `reason` TEXT NULL,
  `notes` TEXT NULL,
  `operator_id` CHAR(24) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `kif_returns` (`id`, `station_id`, `shift_id`, `return_date`, `product_id`, `quantity`, `reason`, `notes`, `operator_id`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d5a', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d40', '2026-10-29 10:00:00.000000', '6ae2f6830ef314025d47171d', 8.0, 'Demo verification return', 'DEMO DATA: Kif return for ST-001', '6ae2ffae22bbcb7a6e400d28', '2026-10-29 08:11:26.754000', '2026-10-29 08:11:26.754000', 0),
('6ae2ffaf22bbcb7a6e400d9b', '6ae2ffae22bbcb7a6e400d12', '6ae2ffaf22bbcb7a6e400d81', '2026-10-29 10:00:00.000000', '6ae2f6830ef314025d47171d', 9.0, 'Demo verification return', 'DEMO DATA: Kif return for ST-002', '6ae2ffae22bbcb7a6e400d69', '2026-10-29 08:11:27.167000', '2026-10-29 08:11:27.167000', 0),
('6ae2ffaf22bbcb7a6e400ddc', '6ae2ffae22bbcb7a6e400d15', '6ae2ffaf22bbcb7a6e400dc2', '2026-10-29 10:00:00.000000', '6ae2f6830ef314025d47171d', 10.0, 'Demo verification return', 'DEMO DATA: Kif return for ST-003', '6ae2ffaf22bbcb7a6e400daa', '2026-10-29 08:11:27.550000', '2026-10-29 08:11:27.550000', 0),
('6ae2ffaf22bbcb7a6e400e1d', '6ae2ffae22bbcb7a6e400d18', '6ae2ffaf22bbcb7a6e400e03', '2026-10-29 10:00:00.000000', '6ae2f6830ef314025d47171d', 11.0, 'Demo verification return', 'DEMO DATA: Kif return for ST-004', '6ae2ffaf22bbcb7a6e400deb', '2026-10-29 08:11:27.943000', '2026-10-29 08:11:27.943000', 0);

CREATE TABLE IF NOT EXISTS `daily_closures` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `closure_date` DATETIME(6) NULL,
  `status` VARCHAR(191) NULL,
  `sales_ttc` DOUBLE NULL,
  `total_payments` DOUBLE NULL,
  `total_expenses` DOUBLE NULL,
  `total_purchases` DOUBLE NULL,
  `total_kif_quantity` DOUBLE NULL,
  `variance` DOUBLE NULL,
  `is_balanced` TINYINT(1) NULL,
  `notes` TEXT NULL,
  `closed_by_id` CHAR(24) NULL,
  `closed_at` DATETIME(6) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_daily_closures_station_date (station_id, closure_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `daily_closures` (`id`, `station_id`, `closure_date`, `status`, `sales_ttc`, `total_payments`, `total_expenses`, `total_purchases`, `total_kif_quantity`, `variance`, `is_balanced`, `notes`, `closed_by_id`, `closed_at`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d5d', '6ae2f6830ef314025d471724', '2026-10-29 00:00:00.000000', 'OPEN', 346.0, 346.0, 125.0, 4625.0, 8.0, 0.0, 1, 'DEMO DATA: Daily closure for ST-001', NULL, NULL, '2026-10-29 08:11:26.764000', '2026-10-29 08:11:26.764000', 0),
('6ae2ffaf22bbcb7a6e400d9e', '6ae2ffae22bbcb7a6e400d12', '2026-10-29 00:00:00.000000', 'OPEN', 346.0, 346.0, 135.0, 4625.0, 9.0, 0.0, 1, 'DEMO DATA: Daily closure for ST-002', NULL, NULL, '2026-10-29 08:11:27.172000', '2026-10-29 08:11:27.172000', 0),
('6ae2ffaf22bbcb7a6e400ddf', '6ae2ffae22bbcb7a6e400d15', '2026-10-29 00:00:00.000000', 'OPEN', 346.0, 346.0, 145.0, 4625.0, 10.0, 0.0, 1, 'DEMO DATA: Daily closure for ST-003', NULL, NULL, '2026-10-29 08:11:27.553000', '2026-10-29 08:11:27.553000', 0),
('6ae2ffaf22bbcb7a6e400e20', '6ae2ffae22bbcb7a6e400d18', '2026-10-29 00:00:00.000000', 'OPEN', 346.0, 346.0, 155.0, 4625.0, 11.0, 0.0, 1, 'DEMO DATA: Daily closure for ST-004', NULL, NULL, '2026-10-29 08:11:27.949000', '2026-10-29 08:11:27.949000', 0);

CREATE TABLE IF NOT EXISTS `sales` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `shift_id` CHAR(24) NULL,
  `pump_id` CHAR(24) NULL,
  `pistol_id` CHAR(24) NULL,
  `product_id` CHAR(24) NULL,
  `customer_id` CHAR(24) NULL,
  `product_name` VARCHAR(191) NULL,
  `product_code` VARCHAR(191) NULL,
  `employee_id` CHAR(24) NULL,
  `quantity` DOUBLE NULL,
  `purchase_price` DOUBLE NULL,
  `selling_price` DOUBLE NULL,
  `vat_rate` DOUBLE NULL,
  `amount_ht` DOUBLE NULL,
  `vat_amount` DOUBLE NULL,
  `amount_ttc` DOUBLE NULL,
  `profit` DOUBLE NULL,
  `payment_method` VARCHAR(191) NULL,
  `created_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `sales` (`id`, `station_id`, `shift_id`, `pump_id`, `pistol_id`, `product_id`, `customer_id`, `product_name`, `product_code`, `employee_id`, `quantity`, `purchase_price`, `selling_price`, `vat_rate`, `amount_ht`, `vat_amount`, `amount_ttc`, `profit`, `payment_method`, `created_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d48', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d40', '6ae2ffae22bbcb7a6e400d3b', '6ae2ffae22bbcb7a6e400d3c', '6ae2f6830ef314025d47171d', NULL, 'Diesel (Gasoil)', 'GASOIL', '6ae2ffae22bbcb7a6e400d28', 100.0, 1.85, 2.2, 19.0, 184.874, 35.126, 220.0, 35.0, 'CASH', '2026-10-29 08:11:26.702000', 0),
('6ae2ffae22bbcb7a6e400d4b', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d40', '6ae2ffae22bbcb7a6e400d3b', '6ae2ffae22bbcb7a6e400d3d', '6ae2f6830ef314025d47171f', NULL, 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', '6ae2ffae22bbcb7a6e400d28', 50.0, 2.1, 2.52, 19.0, 105.882, 20.118, 126.0, 21.0, 'BANK_CARD', '2026-10-29 08:11:26.710000', 0),
('6ae2ffaf22bbcb7a6e400d89', '6ae2ffae22bbcb7a6e400d12', '6ae2ffaf22bbcb7a6e400d81', '6ae2ffaf22bbcb7a6e400d7c', '6ae2ffaf22bbcb7a6e400d7d', '6ae2f6830ef314025d47171d', NULL, 'Diesel (Gasoil)', 'GASOIL', '6ae2ffae22bbcb7a6e400d69', 100.0, 1.85, 2.2, 19.0, 184.874, 35.126, 220.0, 35.0, 'CASH', '2026-10-29 08:11:27.138000', 0),
('6ae2ffaf22bbcb7a6e400d8c', '6ae2ffae22bbcb7a6e400d12', '6ae2ffaf22bbcb7a6e400d81', '6ae2ffaf22bbcb7a6e400d7c', '6ae2ffaf22bbcb7a6e400d7e', '6ae2f6830ef314025d47171f', NULL, 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', '6ae2ffae22bbcb7a6e400d69', 50.0, 2.1, 2.52, 19.0, 105.882, 20.118, 126.0, 21.0, 'BANK_CARD', '2026-10-29 08:11:27.143000', 0),
('6ae2ffaf22bbcb7a6e400dca', '6ae2ffae22bbcb7a6e400d15', '6ae2ffaf22bbcb7a6e400dc2', '6ae2ffaf22bbcb7a6e400dbd', '6ae2ffaf22bbcb7a6e400dbe', '6ae2f6830ef314025d47171d', NULL, 'Diesel (Gasoil)', 'GASOIL', '6ae2ffaf22bbcb7a6e400daa', 100.0, 1.85, 2.2, 19.0, 184.874, 35.126, 220.0, 35.0, 'CASH', '2026-10-29 08:11:27.525000', 0),
('6ae2ffaf22bbcb7a6e400dcd', '6ae2ffae22bbcb7a6e400d15', '6ae2ffaf22bbcb7a6e400dc2', '6ae2ffaf22bbcb7a6e400dbd', '6ae2ffaf22bbcb7a6e400dbf', '6ae2f6830ef314025d47171f', NULL, 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', '6ae2ffaf22bbcb7a6e400daa', 50.0, 2.1, 2.52, 19.0, 105.882, 20.118, 126.0, 21.0, 'BANK_CARD', '2026-10-29 08:11:27.531000', 0),
('6ae2ffaf22bbcb7a6e400e0b', '6ae2ffae22bbcb7a6e400d18', '6ae2ffaf22bbcb7a6e400e03', '6ae2ffaf22bbcb7a6e400dfe', '6ae2ffaf22bbcb7a6e400dff', '6ae2f6830ef314025d47171d', NULL, 'Diesel (Gasoil)', 'GASOIL', '6ae2ffaf22bbcb7a6e400deb', 100.0, 1.85, 2.2, 19.0, 184.874, 35.126, 220.0, 35.0, 'CASH', '2026-10-29 08:11:27.916000', 0),
('6ae2ffaf22bbcb7a6e400e0e', '6ae2ffae22bbcb7a6e400d18', '6ae2ffaf22bbcb7a6e400e03', '6ae2ffaf22bbcb7a6e400dfe', '6ae2ffaf22bbcb7a6e400e00', '6ae2f6830ef314025d47171f', NULL, 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', '6ae2ffaf22bbcb7a6e400deb', 50.0, 2.1, 2.52, 19.0, 105.882, 20.118, 126.0, 21.0, 'BANK_CARD', '2026-10-29 08:11:27.921000', 0),
('6ae31d78ca0739073245092d', '6ae2ffae22bbcb7a6e400d18', '6ae31d4aca0739073245090c', '6ae2ffaf22bbcb7a6e400dfe', '6ae2ffaf22bbcb7a6e400dff', '6ae2f6830ef314025d47171d', '6ae2ffae22bbcb7a6e400d1f', 'Diesel (Gasoil)', 'GASOIL', '6ae2f6820ef314025d47170d', 0.08100000000558794, 1.85, 2.2, 19.0, 0.15, 0.028, 0.178, 0.028, 'CREDIT', '2026-10-29 10:18:32.281000', 0),
('6ae34c2b785dcf31ee0db4bd', '6ae31e24ca07390732450971', NULL, NULL, NULL, '6ae2f6830ef314025d471721', NULL, 'Gasoil 50 Premium', 'GASOIL_50', '6ae34939785dcf31ee0db321', 4.3, 2.02, 2.4, 19.0, 8.672268907563025, 1.647731092436974, 10.319999999999999, 1.6339999999999995, 'CASH', '2026-10-29 13:37:47.603000', 0);

CREATE TABLE IF NOT EXISTS `credit_transactions` (
  `id` CHAR(24) NOT NULL,
  `customer_id` CHAR(24) NULL,
  `station_id` CHAR(24) NULL,
  `type` VARCHAR(191) NULL,
  `reference_id` CHAR(24) NULL,
  `amount` DOUBLE NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `credit_transactions` (`id`, `customer_id`, `station_id`, `type`, `reference_id`, `amount`, `notes`, `created_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d60', '6ae2ffae22bbcb7a6e400d1f', '6ae2f6830ef314025d471724', 'SALE', NULL, 75.0, 'DEMO DATA: Credit test for ST-001', '2026-10-29 08:11:26.771000', 0),
('6ae2ffaf22bbcb7a6e400da1', '6ae2ffae22bbcb7a6e400d1f', '6ae2ffae22bbcb7a6e400d12', 'SALE', NULL, 85.0, 'DEMO DATA: Credit test for ST-002', '2026-10-29 08:11:27.178000', 0),
('6ae2ffaf22bbcb7a6e400de2', '6ae2ffae22bbcb7a6e400d1f', '6ae2ffae22bbcb7a6e400d15', 'SALE', NULL, 95.0, 'DEMO DATA: Credit test for ST-003', '2026-10-29 08:11:27.561000', 0),
('6ae2ffaf22bbcb7a6e400e23', '6ae2ffae22bbcb7a6e400d1f', '6ae2ffae22bbcb7a6e400d18', 'SALE', NULL, 105.0, 'DEMO DATA: Credit test for ST-004', '2026-10-29 08:11:27.952000', 0),
('6ae31d78ca0739073245092f', '6ae2ffae22bbcb7a6e400d1f', '6ae2ffae22bbcb7a6e400d18', 'SALE', '6ae31d78ca0739073245092d', 0.178, 'Credit portion for sale 6ae31d78ca0739073245092d', '2026-10-29 10:18:32.290000', 0);

CREATE TABLE IF NOT EXISTS `teams` (
  `id` CHAR(24) NOT NULL,
  `name` VARCHAR(191) NULL,
  `station_id` CHAR(24) NULL,
  `leader_id` CHAR(24) NULL,
  `active` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_teams_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `teams` (`id`, `name`, `station_id`, `leader_id`, `active`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2ffae22bbcb7a6e400d2c', 'Demo ST-001 Équipe Matin', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d25', 1, '2026-10-29 08:11:26.622000', '2026-10-29 08:11:26.622000', 0),
('6ae2ffae22bbcb7a6e400d2f', 'Demo ST-001 Équipe Soir', '6ae2f6830ef314025d471724', '6ae2ffae22bbcb7a6e400d22', 1, '2026-10-29 08:11:26.630000', '2026-10-29 08:11:26.630000', 0),
('6ae2ffaf22bbcb7a6e400d6d', 'Demo ST-002 Équipe Matin', '6ae2ffae22bbcb7a6e400d12', '6ae2ffae22bbcb7a6e400d66', 1, '2026-10-29 08:11:27.091000', '2026-10-29 08:11:27.091000', 0),
('6ae2ffaf22bbcb7a6e400d70', 'Demo ST-002 Équipe Soir', '6ae2ffae22bbcb7a6e400d12', '6ae2ffae22bbcb7a6e400d63', 1, '2026-10-29 08:11:27.097000', '2026-10-29 08:11:27.097000', 0),
('6ae2ffaf22bbcb7a6e400dae', 'Demo ST-003 Équipe Matin', '6ae2ffae22bbcb7a6e400d15', '6ae2ffaf22bbcb7a6e400da7', 1, '2026-10-29 08:11:27.480000', '2026-10-29 08:11:27.480000', 0),
('6ae2ffaf22bbcb7a6e400db1', 'Demo ST-003 Équipe Soir', '6ae2ffae22bbcb7a6e400d15', '6ae2ffaf22bbcb7a6e400da4', 1, '2026-10-29 08:11:27.483000', '2026-10-29 08:11:27.483000', 0),
('6ae2ffaf22bbcb7a6e400def', 'Demo ST-004 Équipe Matin', '6ae2ffae22bbcb7a6e400d18', '6ae2ffaf22bbcb7a6e400de8', 0, '2026-10-29 08:11:27.869000', '2026-10-29 10:34:42.849000', 0),
('6ae2ffaf22bbcb7a6e400df2', 'Demo ST-004 Équipe Soir', '6ae2ffae22bbcb7a6e400d18', '6ae2ffaf22bbcb7a6e400de5', 0, '2026-10-29 08:11:27.874000', '2026-10-29 10:21:45.391000', 0),
('6ae325d0bf3024343a08ed3e', 'team 2', '6ae31e24ca07390732450971', '6ae2ffaf22bbcb7a6e400deb', 0, '2026-10-29 10:54:08.597000', '2026-10-29 13:17:22.374000', 1),
('6ae34742785dcf31ee0db2f6', 'team3', '6ae31e24ca07390732450971', '6ae2ffaf22bbcb7a6e400de8', 0, '2026-10-29 13:16:50.693000', '2026-10-29 13:16:52.298000', 0);

CREATE TABLE IF NOT EXISTS `refresh_tokens` (
  `id` CHAR(24) NOT NULL,
  `user_id` CHAR(24) NULL,
  `token` VARCHAR(512) NULL,
  `expires_at` DATETIME(6) NULL,
  `revoked` TINYINT(1) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_refresh_tokens_token (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `refresh_tokens` (`id`, `user_id`, `token`, `expires_at`, `revoked`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f746bab571d69b6bd40a', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI1OTMzNCwiZXhwIjoxNzkzODY0MTM0fQ.cPx9R_OCqPtEHFIwKfKC7ns5sLXbgu2RDBfyD5JEYCs', '2026-11-05 07:35:34.583000', 0, '2026-10-29 07:35:34.591000', '2026-10-29 07:35:34.591000', 0),
('6ae2f769febfa3d8404bbb47', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI1OTM2OSwiZXhwIjoxNzkzODY0MTY5fQ.XytH5JaVv_CPi7KPtzCkKyFCWYYQaRMrfjX9TUdbszQ', '2026-11-05 07:36:09.520000', 0, '2026-10-29 07:36:09.526000', '2026-10-29 07:36:09.526000', 0),
('6ae2f78cfebfa3d8404bbb4c', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI1OTQwNCwiZXhwIjoxNzkzODY0MjA0fQ.5Ie1Vq3cC7BYtWKTsas27mfmE4exHk1o6AXpU-LiOW8', '2026-11-05 07:36:44.260000', 1, '2026-10-29 07:36:44.262000', '2026-10-29 07:44:18.406000', 0),
('6ae2f960febfa3d8404bbba6', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI1OTg3MiwiZXhwIjoxNzkzODY0NjcyfQ.jGdoWdVGfc4wFdEkDap6id5spE5DLxKjyR738xfwglw', '2026-11-05 07:44:32.010000', 1, '2026-10-29 07:44:32.012000', '2026-10-29 08:15:34.740000', 0),
('6ae2f9a4febfa3d8404bbbdb', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI1OTk0MCwiZXhwIjoxNzkzODY0NzQwfQ.s0UZcC686hOudpUlAj90OKO8e4N2WaorelOpbaMGmjw', '2026-11-05 07:45:40.533000', 0, '2026-10-29 07:45:40.534000', '2026-10-29 07:45:40.534000', 0),
('6ae300082c688913b8dc38de', '6ae2ffae22bbcb7a6e400d63', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2MyIsImlhdCI6MTc5MzI2MTU3NiwiZXhwIjoxNzkzODY2Mzc2fQ.U21EWCMfFslKCQd7aiIecDM8y_BrC_x78CQZ5YDc2K4', '2026-11-05 08:12:56.859000', 0, '2026-10-29 08:12:56.863000', '2026-10-29 08:12:56.863000', 0),
('6ae307895a64a810f6bf4dd2', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI2MzQ5NywiZXhwIjoxNzkzODY4Mjk3fQ.TsiVMfedLPI99cPhPjZpnU2MkLXy6Ud02ZsUwIsJ9DA', '2026-11-05 08:44:57.682000', 1, '2026-10-29 08:44:57.713000', '2026-10-29 13:25:24.695000', 0),
('6ae30cea5a64a810f6bf4ddb', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI2NDg3NCwiZXhwIjoxNzkzODY5Njc0fQ._4dDUKU4qWhVZZiw0WmgQaB3IyJOwJLxhwdzBFsRZAg', '2026-11-05 09:07:54.460000', 0, '2026-10-29 09:07:54.472000', '2026-10-29 09:07:54.472000', 0),
('6ae30d8b5a64a810f6bf4ed2', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI2NTAzNSwiZXhwIjoxNzkzODY5ODM1fQ.rIoJbwwG_Is91R_vRGjPMlmn-a_h_zU86cQARSuVt0Y', '2026-11-05 09:10:35.013000', 1, '2026-10-29 09:10:35.014000', '2026-10-29 09:10:46.730000', 0),
('6ae30d975a64a810f6bf4ff0', '6ae2ffae22bbcb7a6e400d63', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2MyIsImlhdCI6MTc5MzI2NTA0NywiZXhwIjoxNzkzODY5ODQ3fQ.BWtFNeEpJ5BfZtTd-YPpm14HJIWsW4HER9sejW-CKes', '2026-11-05 09:10:47.560000', 1, '2026-10-29 09:10:47.562000', '2026-10-29 09:10:59.968000', 0),
('6ae30da45a64a810f6bf510b', '6ae2ffae22bbcb7a6e400d66', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2NiIsImlhdCI6MTc5MzI2NTA2MCwiZXhwIjoxNzkzODY5ODYwfQ.TqirCLq3GviV6PN8rzc8tNDtanOTn0INPMCefUWNMMg', '2026-11-05 09:11:00.695000', 1, '2026-10-29 09:11:00.699000', '2026-10-29 09:11:11.898000', 0),
('6ae30db05a64a810f6bf5207', '6ae2ffae22bbcb7a6e400d69', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2OSIsImlhdCI6MTc5MzI2NTA3MiwiZXhwIjoxNzkzODY5ODcyfQ.yWmNA8HGwByUGx28RYHMva17cn3UVF8zYAKRjRFLSNk', '2026-11-05 09:11:12.514000', 1, '2026-10-29 09:11:12.524000', '2026-10-29 09:11:23.585000', 0),
('6ae30dcb5a64a810f6bf5295', '6ae2ffae22bbcb7a6e400d66', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2NiIsImlhdCI6MTc5MzI2NTA5OSwiZXhwIjoxNzkzODY5ODk5fQ.YQkfXlMMUPfQfLFdy_aA054e3pMntn240gLr0NLupgo', '2026-11-05 09:11:39.601000', 1, '2026-10-29 09:11:39.602000', '2026-10-29 09:11:41.640000', 0),
('6ae30dce5a64a810f6bf52a5', '6ae2ffae22bbcb7a6e400d69', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2OSIsImlhdCI6MTc5MzI2NTEwMiwiZXhwIjoxNzkzODY5OTAyfQ.-42u8BogAZWMPD0SNaGQye7ex-mPu-ZeO0WbP6HTzUA', '2026-11-05 09:11:42.351000', 1, '2026-10-29 09:11:42.352000', '2026-10-29 09:11:47.540000', 0),
('6ae30e405a64a810f6bf52cb', '6ae2ffae22bbcb7a6e400d69', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2OSIsImlhdCI6MTc5MzI2NTIxNiwiZXhwIjoxNzkzODcwMDE2fQ.xJoR8_zMqa_RsSqWvbAepC0toWUDMP-MVhPmChUM7ks', '2026-11-05 09:13:36.501000', 1, '2026-10-29 09:13:36.502000', '2026-10-29 09:26:32.480000', 0),
('6ae31149bf2b92584df33609', '6ae2ffae22bbcb7a6e400d66', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2NiIsImlhdCI6MTc5MzI2NTk5MywiZXhwIjoxNzkzODcwNzkzfQ.ZbmH4eCYIux180DSs5z7mjFREhXA62IOcMXYQjqM2LU', '2026-11-05 09:26:33.191000', 1, '2026-10-29 09:26:33.200000', '2026-10-29 09:26:36.635000', 0),
('6ae3114dbf2b92584df3362c', '6ae2ffae22bbcb7a6e400d63', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2MyIsImlhdCI6MTc5MzI2NTk5NywiZXhwIjoxNzkzODcwNzk3fQ.gcULllpQFrNGJ-oLMMwe6f7gBFW5rB2HfqHUcobxtXk', '2026-11-05 09:26:37.375000', 1, '2026-10-29 09:26:37.389000', '2026-10-29 09:26:39.516000', 0),
('6ae31150bf2b92584df3364f', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI2NjAwMCwiZXhwIjoxNzkzODcwODAwfQ.2tvlLi1S5yjWKOWtd8MUqDDI-WS-hBVwypCy0g-ioY8', '2026-11-05 09:26:40.387000', 1, '2026-10-29 09:26:40.396000', '2026-10-29 09:32:11.112000', 0),
('6ae3129b27e9e23d7d1f2336', '6ae2ffae22bbcb7a6e400d69', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmZmFlMjJiYmNiN2E2ZTQwMGQ2OSIsImlhdCI6MTc5MzI2NjMzMSwiZXhwIjoxNzkzODcxMTMxfQ.k3YUSjXuvB8TNpAh1CS_K3WhNcjQBs16CvzBx1waNK0', '2026-11-05 09:32:11.334000', 0, '2026-10-29 09:32:11.338000', '2026-10-29 09:32:11.338000', 0),
('6ae323242cd8839b21306559', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDU2NCwiZXhwIjoxNzkzODc1MzY0fQ.rkFOwIECE7xyHJrktO_VVzM11D1KWYzSxqxcoftgmFg', '2026-11-05 10:42:44.472000', 0, '2026-10-29 10:42:44.477000', '2026-10-29 10:42:44.477000', 0),
('6ae3232d2cd8839b21306563', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDU3MywiZXhwIjoxNzkzODc1MzczfQ.8DvPjUzsbioZCu28rLmJCJ9ZSv2roDcMKYf-ISQSfm4', '2026-11-05 10:42:53.702000', 0, '2026-10-29 10:42:53.704000', '2026-10-29 10:42:53.704000', 0),
('6ae323372cd8839b21306572', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDU4MywiZXhwIjoxNzkzODc1MzgzfQ.KbD0d0eZUqqmsXeqjRkrDYCDDV0sLh7MRYz1xI6o9OI', '2026-11-05 10:43:03.806000', 0, '2026-10-29 10:43:03.809000', '2026-10-29 10:43:03.809000', 0),
('6ae323462cd8839b21306581', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDU5OCwiZXhwIjoxNzkzODc1Mzk4fQ.LgdsVS7e3NWpFsWU027OczSumICyrj4glLIq8_LZTBY', '2026-11-05 10:43:18.062000', 0, '2026-10-29 10:43:18.064000', '2026-10-29 10:43:18.064000', 0),
('6ae323cd49b94ad61d10605f', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDczMywiZXhwIjoxNzkzODc1NTMzfQ.dv5jwPOWdtkmErAFPBX2PoK_5MpMrYei3KnsiOCRa6s', '2026-11-05 10:45:33.462000', 0, '2026-10-29 10:45:33.465000', '2026-10-29 10:45:33.465000', 0),
('6ae323e649b94ad61d106070', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDc1OCwiZXhwIjoxNzkzODc1NTU4fQ.miPCeB14RxrwX9MPF8UMDgI8GxuBuITO1sMS8iINGHM', '2026-11-05 10:45:58.804000', 0, '2026-10-29 10:45:58.806000', '2026-10-29 10:45:58.806000', 0),
('6ae3242849b94ad61d1060b7', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MDgyNCwiZXhwIjoxNzkzODc1NjI0fQ.9dPEpy_dwyAxyHXyZlzXWAOGfalFnIMEHj33mfr5X-g', '2026-11-05 10:47:04.241000', 0, '2026-10-29 10:47:04.242000', '2026-10-29 10:47:04.242000', 0),
('6ae326898e3a645108265ecb', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI3MTQzMywiZXhwIjoxNzkzODc2MjMzfQ.gBCjNhffttww9SRCXhxGNPXQIKJmYhU3MtbSCMstoVM', '2026-11-05 10:57:13.363000', 0, '2026-10-29 10:57:13.377000', '2026-10-29 10:57:13.377000', 0),
('6ae34958785dcf31ee0db327', '6ae34939785dcf31ee0db321', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTM0OTM5Nzg1ZGNmMzFlZTBkYjMyMSIsImlhdCI6MTc5MzI4MDM0NCwiZXhwIjoxNzkzODg1MTQ0fQ.PiqAi6naYugn5M5sb9eJgN_G7nF19L875BAlEpcZs54', '2026-11-05 13:25:44.137000', 1, '2026-10-29 13:25:44.139000', '2026-10-29 14:01:18.666000', 0),
('6ae351b1785dcf31ee0db4f7', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI4MjQ4MSwiZXhwIjoxNzkzODg3MjgxfQ.G9xNAdJ8Qu6G2ZAAOY2qEUS4SBvZs76U745mgz7EG5U', '2026-11-05 14:01:21.053000', 1, '2026-10-29 14:01:21.054000', '2026-10-29 14:15:33.666000', 0),
('6ae35513785dcf31ee0db596', '6ae34939785dcf31ee0db321', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTM0OTM5Nzg1ZGNmMzFlZTBkYjMyMSIsImlhdCI6MTc5MzI4MzM0NywiZXhwIjoxNzkzODg4MTQ3fQ.Fr9IwW3etyGByCPRMVb7NVLxuyotKVkYEcx42tgdv_w', '2026-11-05 14:15:47.197000', 1, '2026-10-29 14:15:47.198000', '2026-10-29 14:22:05.354000', 0),
('6ae3568e785dcf31ee0db725', '6ae34939785dcf31ee0db321', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTM0OTM5Nzg1ZGNmMzFlZTBkYjMyMSIsImlhdCI6MTc5MzI4MzcyNiwiZXhwIjoxNzkzODg4NTI2fQ.hjIzbujCoGrXVZEJnWQWVTlWGFi2GSJ5WLt9fQyClas', '2026-11-05 14:22:06.886000', 0, '2026-10-29 14:22:06.886000', '2026-10-29 14:22:06.886000', 0),
('6ae35af4506a1209334836a2', '6ae2f6820ef314025d47170d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhZTJmNjgyMGVmMzE0MDI1ZDQ3MTcwZCIsImlhdCI6MTc5MzI4NDg1MiwiZXhwIjoxNzkzODg5NjUyfQ.WUqspCFuR3hmgVqF9dYj0jxz57QM0MDadjvb7R02CiA', '2026-11-05 14:40:52.947000', 0, '2026-10-29 14:40:52.952000', '2026-10-29 14:40:52.952000', 0);

CREATE TABLE IF NOT EXISTS `settings` (
  `id` CHAR(24) NOT NULL,
  `setting_key` VARCHAR(191) NULL,
  `value` JSON NULL,
  `type` VARCHAR(191) NULL,
  `category` VARCHAR(191) NULL,
  `description` TEXT NULL,
  `updated_by_id` CHAR(24) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_settings_key (setting_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `audit_logs` (
  `id` CHAR(24) NOT NULL,
  `user_id` CHAR(24) NULL,
  `action` VARCHAR(191) NULL,
  `status` VARCHAR(191) NULL,
  `message` TEXT NULL,
  `metadata` JSON NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `status`, `message`, `metadata`, `created_at`, `updated_at`, `mongo_version`) VALUES
('6ae2f746bab571d69b6bd40c', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 07:35:34.598000', '2026-10-29 07:35:34.598000', 0),
('6ae2f769febfa3d8404bbb49', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 07:36:09.540000', '2026-10-29 07:36:09.540000', 0),
('6ae2f78cfebfa3d8404bbb4e', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 07:36:44.267000', '2026-10-29 07:36:44.267000', 0),
('6ae2f960febfa3d8404bbba8', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 07:44:32.015000', '2026-10-29 07:44:32.015000', 0),
('6ae2f9a4febfa3d8404bbbdd', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 07:45:40.537000', '2026-10-29 07:45:40.537000', 0),
('6ae300082c688913b8dc38e0', '6ae2ffae22bbcb7a6e400d63', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_manager@example.test logged in', NULL, '2026-10-29 08:12:56.897000', '2026-10-29 08:12:56.897000', 0),
('6ae307895a64a810f6bf4dd4', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 08:44:57.843000', '2026-10-29 08:44:57.843000', 0),
('6ae30cea5a64a810f6bf4ddd', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 09:07:54.506000', '2026-10-29 09:07:54.506000', 0),
('6ae30d8b5a64a810f6bf4ed4', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 09:10:35.022000', '2026-10-29 09:10:35.022000', 0),
('6ae30d975a64a810f6bf4ff2', '6ae2ffae22bbcb7a6e400d63', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_manager@example.test logged in', NULL, '2026-10-29 09:10:47.575000', '2026-10-29 09:10:47.575000', 0),
('6ae30da45a64a810f6bf510d', '6ae2ffae22bbcb7a6e400d66', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_supervisor@example.test logged in', NULL, '2026-10-29 09:11:00.704000', '2026-10-29 09:11:00.704000', 0),
('6ae30db05a64a810f6bf5209', '6ae2ffae22bbcb7a6e400d69', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_operator@example.test logged in', NULL, '2026-10-29 09:11:12.528000', '2026-10-29 09:11:12.528000', 0),
('6ae30dcb5a64a810f6bf5297', '6ae2ffae22bbcb7a6e400d66', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_supervisor@example.test logged in', NULL, '2026-10-29 09:11:39.611000', '2026-10-29 09:11:39.611000', 0),
('6ae30dce5a64a810f6bf52a7', '6ae2ffae22bbcb7a6e400d69', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_operator@example.test logged in', NULL, '2026-10-29 09:11:42.356000', '2026-10-29 09:11:42.356000', 0),
('6ae30e405a64a810f6bf52cd', '6ae2ffae22bbcb7a6e400d69', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_operator@example.test logged in', NULL, '2026-10-29 09:13:36.513000', '2026-10-29 09:13:36.513000', 0),
('6ae31149bf2b92584df3360b', '6ae2ffae22bbcb7a6e400d66', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_supervisor@example.test logged in', NULL, '2026-10-29 09:26:33.220000', '2026-10-29 09:26:33.220000', 0),
('6ae3114dbf2b92584df3362e', '6ae2ffae22bbcb7a6e400d63', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_manager@example.test logged in', NULL, '2026-10-29 09:26:37.407000', '2026-10-29 09:26:37.407000', 0),
('6ae31150bf2b92584df33651', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 09:26:40.401000', '2026-10-29 09:26:40.401000', 0),
('6ae3129b27e9e23d7d1f2338', '6ae2ffae22bbcb7a6e400d69', 'USER_LOGIN', 'SUCCESS', 'User demo_st002_operator@example.test logged in', NULL, '2026-10-29 09:32:11.346000', '2026-10-29 09:32:11.346000', 0),
('6ae323242cd8839b2130655b', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:42:44.505000', '2026-10-29 10:42:44.505000', 0),
('6ae3232d2cd8839b21306565', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:42:53.709000', '2026-10-29 10:42:53.709000', 0),
('6ae323372cd8839b21306574', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:43:03.824000', '2026-10-29 10:43:03.824000', 0),
('6ae323462cd8839b21306583', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:43:18.067000', '2026-10-29 10:43:18.067000', 0),
('6ae323cd49b94ad61d106061', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:45:33.479000', '2026-10-29 10:45:33.479000', 0),
('6ae323e649b94ad61d106072', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:45:58.839000', '2026-10-29 10:45:58.839000', 0),
('6ae3242849b94ad61d1060b9', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:47:04.251000', '2026-10-29 10:47:04.251000', 0),
('6ae326898e3a645108265ecd', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 10:57:13.399000', '2026-10-29 10:57:13.399000', 0),
('6ae34958785dcf31ee0db329', '6ae34939785dcf31ee0db321', 'USER_LOGIN', 'SUCCESS', 'User ghassen@gmail.com logged in', NULL, '2026-10-29 13:25:44.143000', '2026-10-29 13:25:44.143000', 0),
('6ae351b1785dcf31ee0db4f9', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 14:01:21.065000', '2026-10-29 14:01:21.065000', 0),
('6ae35513785dcf31ee0db598', '6ae34939785dcf31ee0db321', 'USER_LOGIN', 'SUCCESS', 'User ghassen@gmail.com logged in', NULL, '2026-10-29 14:15:47.201000', '2026-10-29 14:15:47.201000', 0),
('6ae3568e785dcf31ee0db727', '6ae34939785dcf31ee0db321', 'USER_LOGIN', 'SUCCESS', 'User ghassen@gmail.com logged in', NULL, '2026-10-29 14:22:06.890000', '2026-10-29 14:22:06.890000', 0),
('6ae35af4506a1209334836a4', '6ae2f6820ef314025d47170d', 'USER_LOGIN', 'SUCCESS', 'User admin@fuelstation.tn logged in', NULL, '2026-10-29 14:40:52.972000', '2026-10-29 14:40:52.972000', 0);

CREATE TABLE IF NOT EXISTS `day_closures` (
  `id` CHAR(24) NOT NULL,
  `station_id` CHAR(24) NULL,
  `closure_date` DATETIME(6) NULL,
  `status` VARCHAR(191) NULL,
  `closed_by_id` CHAR(24) NULL,
  `reopened_by_id` CHAR(24) NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `mongo_version` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY uq_day_closures_station_date (station_id, closure_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pump_pistols` (
  `pump_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `pistol_id` CHAR(24) NULL,
  `pistol_number` DOUBLE NULL,
  `product_id` CHAR(24) NULL,
  `current_closing_index` DOUBLE NULL,
  `active` TINYINT(1) NULL,
  PRIMARY KEY (`pump_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `pump_pistols` (`pump_id`, `position`, `pistol_id`, `pistol_number`, `product_id`, `current_closing_index`, `active`) VALUES
('6ae2f6830ef314025d47172e', 0, '6ae2f6830ef314025d47172f', 1.0, '6ae2f6830ef314025d47171d', 125000.0, 1),
('6ae2f6830ef314025d47172e', 1, '6ae2f6830ef314025d471730', 2.0, '6ae2f6830ef314025d47171f', 98450.5, 1),
('6ae2f6830ef314025d471731', 0, '6ae2f6830ef314025d471732', 1.0, '6ae2f6830ef314025d47171d', 110200.0, 1),
('6ae2f6830ef314025d471731', 1, '6ae2f6830ef314025d471733', 2.0, '6ae2f6830ef314025d47171f', 85300.0, 1),
('6ae2f6830ef314025d471734', 0, '6ae2f6830ef314025d471735', 1.0, '6ae2f6830ef314025d471721', 45200.0, 1),
('6ae2f6830ef314025d471734', 1, '6ae2f6830ef314025d471736', 2.0, '6ae2f6830ef314025d47171f', 72100.5, 1),
('6ae2f6830ef314025d471737', 0, '6ae2f6830ef314025d471738', 1.0, '6ae2f6830ef314025d47171d', 95400.0, 1),
('6ae2f6830ef314025d471737', 1, '6ae2f6830ef314025d471739', 2.0, '6ae2f6830ef314025d471721', 38900.0, 1),
('6ae2ffae22bbcb7a6e400d3b', 0, '6ae2ffae22bbcb7a6e400d3c', 1.0, '6ae2f6830ef314025d47171d', 128450.0, 1),
('6ae2ffae22bbcb7a6e400d3b', 1, '6ae2ffae22bbcb7a6e400d3d', 2.0, '6ae2f6830ef314025d47171f', 98210.0, 1),
('6ae2ffaf22bbcb7a6e400d7c', 0, '6ae2ffaf22bbcb7a6e400d7d', 1.0, '6ae2f6830ef314025d47171d', 128450.0, 1),
('6ae2ffaf22bbcb7a6e400d7c', 1, '6ae2ffaf22bbcb7a6e400d7e', 2.0, '6ae2f6830ef314025d47171f', 98210.0, 1),
('6ae2ffaf22bbcb7a6e400dbd', 0, '6ae2ffaf22bbcb7a6e400dbe', 1.0, '6ae2f6830ef314025d47171d', 128450.0, 1),
('6ae2ffaf22bbcb7a6e400dbd', 1, '6ae2ffaf22bbcb7a6e400dbf', 2.0, '6ae2f6830ef314025d47171f', 98210.0, 1),
('6ae2ffaf22bbcb7a6e400dfe', 0, '6ae2ffaf22bbcb7a6e400dff', 1.0, '6ae2f6830ef314025d47171d', 128450.0, 1),
('6ae2ffaf22bbcb7a6e400dfe', 1, '6ae2ffaf22bbcb7a6e400e00', 2.0, '6ae2f6830ef314025d47171f', 98210.0, 1);

CREATE TABLE IF NOT EXISTS `team_members` (
  `team_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `user_id` CHAR(24) NULL,
  PRIMARY KEY (`team_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `team_members` (`team_id`, `position`, `user_id`) VALUES
('6ae2ffae22bbcb7a6e400d2c', 0, '6ae2ffae22bbcb7a6e400d22'),
('6ae2ffae22bbcb7a6e400d2c', 1, '6ae2ffae22bbcb7a6e400d25'),
('6ae2ffae22bbcb7a6e400d2c', 2, '6ae2ffae22bbcb7a6e400d28'),
('6ae2ffae22bbcb7a6e400d2f', 0, '6ae2ffae22bbcb7a6e400d25'),
('6ae2ffae22bbcb7a6e400d2f', 1, '6ae2ffae22bbcb7a6e400d28'),
('6ae2ffaf22bbcb7a6e400d6d', 0, '6ae2ffae22bbcb7a6e400d63'),
('6ae2ffaf22bbcb7a6e400d6d', 1, '6ae2ffae22bbcb7a6e400d66'),
('6ae2ffaf22bbcb7a6e400d6d', 2, '6ae2ffae22bbcb7a6e400d69'),
('6ae2ffaf22bbcb7a6e400d70', 0, '6ae2ffae22bbcb7a6e400d66'),
('6ae2ffaf22bbcb7a6e400d70', 1, '6ae2ffae22bbcb7a6e400d69'),
('6ae2ffaf22bbcb7a6e400dae', 0, '6ae2ffaf22bbcb7a6e400da4'),
('6ae2ffaf22bbcb7a6e400dae', 1, '6ae2ffaf22bbcb7a6e400da7'),
('6ae2ffaf22bbcb7a6e400dae', 2, '6ae2ffaf22bbcb7a6e400daa'),
('6ae2ffaf22bbcb7a6e400db1', 0, '6ae2ffaf22bbcb7a6e400da7'),
('6ae2ffaf22bbcb7a6e400db1', 1, '6ae2ffaf22bbcb7a6e400daa'),
('6ae2ffaf22bbcb7a6e400def', 0, '6ae2ffaf22bbcb7a6e400de5'),
('6ae2ffaf22bbcb7a6e400def', 1, '6ae2ffaf22bbcb7a6e400de8'),
('6ae2ffaf22bbcb7a6e400def', 2, '6ae2ffaf22bbcb7a6e400deb'),
('6ae2ffaf22bbcb7a6e400df2', 0, '6ae2ffaf22bbcb7a6e400de8'),
('6ae2ffaf22bbcb7a6e400df2', 1, '6ae2ffaf22bbcb7a6e400deb'),
('6ae325d0bf3024343a08ed3e', 0, '6ae2ffaf22bbcb7a6e400da4'),
('6ae325d0bf3024343a08ed3e', 1, '6ae2ffae22bbcb7a6e400d66'),
('6ae325d0bf3024343a08ed3e', 2, '6ae2ffae22bbcb7a6e400d28');

CREATE TABLE IF NOT EXISTS `shift_employees` (
  `shift_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `user_id` CHAR(24) NULL,
  PRIMARY KEY (`shift_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `shift_employees` (`shift_id`, `position`, `user_id`) VALUES
('6ae2ffae22bbcb7a6e400d40', 0, '6ae2ffae22bbcb7a6e400d22'),
('6ae2ffae22bbcb7a6e400d40', 1, '6ae2ffae22bbcb7a6e400d25'),
('6ae2ffae22bbcb7a6e400d40', 2, '6ae2ffae22bbcb7a6e400d28'),
('6ae2ffae22bbcb7a6e400d45', 0, '6ae2ffae22bbcb7a6e400d25'),
('6ae2ffae22bbcb7a6e400d45', 1, '6ae2ffae22bbcb7a6e400d28'),
('6ae2ffaf22bbcb7a6e400d81', 0, '6ae2ffae22bbcb7a6e400d63'),
('6ae2ffaf22bbcb7a6e400d81', 1, '6ae2ffae22bbcb7a6e400d66'),
('6ae2ffaf22bbcb7a6e400d81', 2, '6ae2ffae22bbcb7a6e400d69'),
('6ae2ffaf22bbcb7a6e400d86', 0, '6ae2ffae22bbcb7a6e400d66'),
('6ae2ffaf22bbcb7a6e400d86', 1, '6ae2ffae22bbcb7a6e400d69'),
('6ae2ffaf22bbcb7a6e400dc2', 0, '6ae2ffaf22bbcb7a6e400da4'),
('6ae2ffaf22bbcb7a6e400dc2', 1, '6ae2ffaf22bbcb7a6e400da7'),
('6ae2ffaf22bbcb7a6e400dc2', 2, '6ae2ffaf22bbcb7a6e400daa'),
('6ae2ffaf22bbcb7a6e400dc7', 0, '6ae2ffaf22bbcb7a6e400da7'),
('6ae2ffaf22bbcb7a6e400dc7', 1, '6ae2ffaf22bbcb7a6e400daa'),
('6ae2ffaf22bbcb7a6e400e03', 0, '6ae2ffaf22bbcb7a6e400de5'),
('6ae2ffaf22bbcb7a6e400e03', 1, '6ae2ffaf22bbcb7a6e400de8'),
('6ae2ffaf22bbcb7a6e400e03', 2, '6ae2ffaf22bbcb7a6e400deb'),
('6ae2ffaf22bbcb7a6e400e08', 0, '6ae2ffaf22bbcb7a6e400de8'),
('6ae2ffaf22bbcb7a6e400e08', 1, '6ae2ffaf22bbcb7a6e400deb'),
('6ae3000c2c688913b8dc3902', 0, '6ae2ffaf22bbcb7a6e400da4'),
('6ae3000c2c688913b8dc3902', 1, '6ae2ffaf22bbcb7a6e400da7'),
('6ae3000c2c688913b8dc3902', 2, '6ae2ffaf22bbcb7a6e400daa'),
('6ae31d4aca0739073245090c', 0, '6ae2ffaf22bbcb7a6e400da7'),
('6ae31d4aca0739073245090c', 1, '6ae2ffaf22bbcb7a6e400daa');

CREATE TABLE IF NOT EXISTS `shift_pump_readings` (
  `shift_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `pump_id` CHAR(24) NULL,
  `pump_number` VARCHAR(191) NULL,
  PRIMARY KEY (`shift_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `shift_pump_readings` (`shift_id`, `position`, `pump_id`, `pump_number`) VALUES
('6ae2ffae22bbcb7a6e400d40', 0, '6ae2ffae22bbcb7a6e400d3b', 'Demo ST-001 Pompe 01'),
('6ae2ffaf22bbcb7a6e400d81', 0, '6ae2ffaf22bbcb7a6e400d7c', 'Demo ST-002 Pompe 01'),
('6ae2ffaf22bbcb7a6e400dc2', 0, '6ae2ffaf22bbcb7a6e400dbd', 'Demo ST-003 Pompe 01'),
('6ae2ffaf22bbcb7a6e400e03', 0, '6ae2ffaf22bbcb7a6e400dfe', 'Demo ST-004 Pompe 01'),
('6ae3000c2c688913b8dc3902', 0, '6ae2ffaf22bbcb7a6e400dfe', 'Demo ST-004 Pompe 01'),
('6ae31d4aca0739073245090c', 0, '6ae2ffaf22bbcb7a6e400dfe', 'Demo ST-004 Pompe 01');

CREATE TABLE IF NOT EXISTS `shift_pistol_readings` (
  `shift_id` CHAR(24) NOT NULL,
  `pump_position` INT NOT NULL,
  `position` INT NOT NULL,
  `pistol_id` CHAR(24) NULL,
  `pistol_number` DOUBLE NULL,
  `product_id` CHAR(24) NULL,
  `product_name` VARCHAR(191) NULL,
  `product_code` VARCHAR(191) NULL,
  `purchase_price` DOUBLE NULL,
  `selling_price` DOUBLE NULL,
  `vat_rate` DOUBLE NULL,
  `opening_index` DOUBLE NULL,
  `closing_index` DOUBLE NULL,
  `volume_sold` DOUBLE NULL,
  `amount_ht` DOUBLE NULL,
  `vat_amount` DOUBLE NULL,
  `amount_ttc` DOUBLE NULL,
  `profit` DOUBLE NULL,
  PRIMARY KEY (`shift_id`, `pump_position`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `shift_pistol_readings` (`shift_id`, `pump_position`, `position`, `pistol_id`, `pistol_number`, `product_id`, `product_name`, `product_code`, `purchase_price`, `selling_price`, `vat_rate`, `opening_index`, `closing_index`, `volume_sold`, `amount_ht`, `vat_amount`, `amount_ttc`, `profit`) VALUES
('6ae2ffae22bbcb7a6e400d40', 0, 0, '6ae2ffae22bbcb7a6e400d3c', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128350.0, 128450.0, 100.0, 184.874, 35.126, 220.0, 35.0),
('6ae2ffae22bbcb7a6e400d40', 0, 1, '6ae2ffae22bbcb7a6e400d3d', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98160.0, 98210.0, 50.0, 105.882, 20.118, 126.0, 21.0),
('6ae2ffaf22bbcb7a6e400d81', 0, 0, '6ae2ffaf22bbcb7a6e400d7d', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128350.0, 128450.0, 100.0, 184.874, 35.126, 220.0, 35.0),
('6ae2ffaf22bbcb7a6e400d81', 0, 1, '6ae2ffaf22bbcb7a6e400d7e', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98160.0, 98210.0, 50.0, 105.882, 20.118, 126.0, 21.0),
('6ae2ffaf22bbcb7a6e400dc2', 0, 0, '6ae2ffaf22bbcb7a6e400dbe', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128350.0, 128450.0, 100.0, 184.874, 35.126, 220.0, 35.0),
('6ae2ffaf22bbcb7a6e400dc2', 0, 1, '6ae2ffaf22bbcb7a6e400dbf', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98160.0, 98210.0, 50.0, 105.882, 20.118, 126.0, 21.0),
('6ae2ffaf22bbcb7a6e400e03', 0, 0, '6ae2ffaf22bbcb7a6e400dff', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128350.0, 128450.0, 100.0, 184.874, 35.126, 220.0, 35.0),
('6ae2ffaf22bbcb7a6e400e03', 0, 1, '6ae2ffaf22bbcb7a6e400e00', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98160.0, 98210.0, 50.0, 105.882, 20.118, 126.0, 21.0),
('6ae3000c2c688913b8dc3902', 0, 0, '6ae2ffaf22bbcb7a6e400dff', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128450.0, 128450.0, 0.0, 0.0, 0.0, 0.0, 0.0),
('6ae3000c2c688913b8dc3902', 0, 1, '6ae2ffaf22bbcb7a6e400e00', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98210.0, 98210.0, 0.0, 0.0, 0.0, 0.0, 0.0),
('6ae31d4aca0739073245090c', 0, 0, '6ae2ffaf22bbcb7a6e400dff', 1.0, '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 'GASOIL', 1.85, 2.2, 19.0, 128450.0, 128450.0, 0.0, 0.0, 0.0, 0.0, 0.0),
('6ae31d4aca0739073245090c', 0, 1, '6ae2ffaf22bbcb7a6e400e00', 2.0, '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 'SANS_PLOMB', 2.1, 2.52, 19.0, 98210.0, 98210.0, 0.0, 0.0, 0.0, 0.0, 0.0);

CREATE TABLE IF NOT EXISTS `shift_product_volumes` (
  `shift_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `volume_id` CHAR(24) NULL,
  `product_id` CHAR(24) NULL,
  `product_name` VARCHAR(191) NULL,
  `volume_sold` DOUBLE NULL,
  PRIMARY KEY (`shift_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `shift_product_volumes` (`shift_id`, `position`, `volume_id`, `product_id`, `product_name`, `volume_sold`) VALUES
('6ae2ffae22bbcb7a6e400d40', 0, '6ae2ffae22bbcb7a6e400d41', '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 100),
('6ae2ffae22bbcb7a6e400d40', 1, '6ae2ffae22bbcb7a6e400d42', '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 50),
('6ae2ffaf22bbcb7a6e400d81', 0, '6ae2ffaf22bbcb7a6e400d82', '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 100),
('6ae2ffaf22bbcb7a6e400d81', 1, '6ae2ffaf22bbcb7a6e400d83', '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 50),
('6ae2ffaf22bbcb7a6e400dc2', 0, '6ae2ffaf22bbcb7a6e400dc3', '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 100),
('6ae2ffaf22bbcb7a6e400dc2', 1, '6ae2ffaf22bbcb7a6e400dc4', '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 50),
('6ae2ffaf22bbcb7a6e400e03', 0, '6ae2ffaf22bbcb7a6e400e04', '6ae2f6830ef314025d47171d', 'Diesel (Gasoil)', 100),
('6ae2ffaf22bbcb7a6e400e03', 1, '6ae2ffaf22bbcb7a6e400e05', '6ae2f6830ef314025d47171f', 'Unleaded Petrol (Sans Plomb)', 50);

CREATE TABLE IF NOT EXISTS `purchase_order_items` (
  `purchase_order_id` CHAR(24) NOT NULL,
  `position` INT NOT NULL,
  `product_id` CHAR(24) NULL,
  `quantity` DOUBLE NULL,
  `unit_price` DOUBLE NULL,
  `total_price` DOUBLE NULL,
  `tank_id` CHAR(24) NULL,
  PRIMARY KEY (`purchase_order_id`, `position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `purchase_order_items` (`purchase_order_id`, `position`, `product_id`, `quantity`, `unit_price`, `total_price`, `tank_id`) VALUES
('6ae2ffae22bbcb7a6e400d54', 0, '6ae2f6830ef314025d471721', 1500.0, 2.02, 3030.0, '6ae2ffae22bbcb7a6e400d38'),
('6ae2ffaf22bbcb7a6e400d95', 0, '6ae2f6830ef314025d471721', 1500.0, 2.02, 3030.0, '6ae2ffaf22bbcb7a6e400d79'),
('6ae2ffaf22bbcb7a6e400dd6', 0, '6ae2f6830ef314025d471721', 1500.0, 2.02, 3030.0, '6ae2ffaf22bbcb7a6e400dba'),
('6ae2ffaf22bbcb7a6e400e17', 0, '6ae2f6830ef314025d471721', 1500.0, 2.02, 3030.0, '6ae2ffaf22bbcb7a6e400dfb');

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_MODE = DEFAULT;
