-- Fragment begins: 1 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (1, 'Main', strftime('%s','now'), 'dbdeploy', '1-create-changelog.sql');
CREATE TABLE IF NOT EXISTS 'changelog' (
    `change_number` UNSIGNED bigint(20) NOT NULL,
    'delta_set' TEXT NOT NULL, 
    `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'applied_by' TEXT NOT NULL,
    'description' TEXT NOT NULL, 
    'complete_dt' DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (`change_number`,`delta_set`) 
);


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 1
	                         AND delta_set = 'Main';
-- Fragment ends: 1 --
-- Fragment begins: 2 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (2, 'Main', strftime('%s','now'), 'dbdeploy', '2-create-companies.sql');
CREATE TABLE IF NOT EXISTS `companies` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL DEFAULT NULL,
  `address` VARCHAR(155) NULL DEFAULT NULL,
  `city` VARCHAR(155) NULL DEFAULT NULL,
  `state` VARCHAR(155) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL
);


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 2
	                         AND delta_set = 'Main';
-- Fragment ends: 2 --
-- Fragment begins: 3 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (3, 'Main', strftime('%s','now'), 'dbdeploy', '3-create-employees.sql');
PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `employees` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` INT NULL DEFAULT NULL,
  `is_admin` BOOLEAN NULL DEFAULT 0,
  `is_locked` BOOLEAN NULL DEFAULT 0,
  `attempts` UNSIGNED TINYINT(1) NULL DEFAULT 0,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_users_company_idx` ON employees(`company_id` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `username_UNIQUE` ON employees(`username` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `email_UNIQUE` ON employees(`email` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `phone_UNIQUE` ON employees(`phone` ASC);

PRAGMA foreign_keys=ON;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 3
	                         AND delta_set = 'Main';
-- Fragment ends: 3 --
-- Fragment begins: 4 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (4, 'Main', strftime('%s','now'), 'dbdeploy', '4-create-groups.sql');
CREATE TABLE IF NOT EXISTS `groups` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255) NOT NULL
);


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 4
	                         AND delta_set = 'Main';
-- Fragment ends: 4 --
-- Fragment begins: 5 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (5, 'Main', strftime('%s','now'), 'dbdeploy', '5-create-customers.sql');
PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `customers` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `verified` UNSIGNED TINYINT(1) NULL DEFAULT 0
);


CREATE UNIQUE INDEX IF NOT EXISTS `customer_username_UNIQUE` ON `customers`(`username` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `customer_email_UNIQUE` ON `customers`(`email` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `address_UNIQUE` ON `customers`(`address` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `phone_UNIQUE` ON `customers` (`phone` ASC);
PRAGMA foreign_keys=ON;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 5
	                         AND delta_set = 'Main';
-- Fragment ends: 5 --
-- Fragment begins: 6 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (6, 'Main', strftime('%s','now'), 'dbdeploy', '6-create-orders.sql');
PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `fulfilled` UNSIGNED INT NULL DEFAULT 0,
  `unfulfilled` UNSIGNED INT NULL,
  `is_shipped` UNSIGNED TINYINT(1) NULL
);
PRAGMA foreign_keys=ON;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 6
	                         AND delta_set = 'Main';
-- Fragment ends: 6 --
-- Fragment begins: 7 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (7, 'Main', strftime('%s','now'), 'dbdeploy', '7-create-companyToGroups.sql');
PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `companyToGroups` (
  `groups_id` INT,
  `companies_id` INT,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_companyToGroups_groups1_idx` ON `companyToGroups`(`groups_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_companyToGroups_companies1_idx` ON `companyToGroups` (`companies_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueCompaniesToGroups` ON `companyToGroups`(`groups_id` ASC, `companies_id` ASC);
PRAGMA foreign_keys=ON;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 7
	                         AND delta_set = 'Main';
-- Fragment ends: 7 --
-- Fragment begins: 8 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (8, 'Main', strftime('%s','now'), 'dbdeploy', '8-create-customersToOrders.sql');
PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `customersToOrders` (
  `orders_id`  INT,
  `customers_id` INT,
   FOREIGN KEY (`orders_id`)
    REFERENCES `orders` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (`customers_id`)
    REFERENCES `customers` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_customersToOrders_orders1_idx` ON `customersToOrders` (`orders_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_customersToOrders_customers1_idx` ON `customersToOrders` (`customers_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueCustomerToOrder` ON `customersToOrders`(`orders_id` ASC, `customers_id` ASC);

PRAGMA foreign_keys=ON; 
  

UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 8
	                         AND delta_set = 'Main';
-- Fragment ends: 8 --
-- Fragment begins: 9 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (9, 'Main', strftime('%s','now'), 'dbdeploy', '9-create-groupsToOrders.sql');
PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `groupsToOrders` (
  `groups_id` INT,
  `orders_id` INT,
  FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (`orders_id`)
    REFERENCES `orders` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_groupsToOrders_groups1_idx` ON `groupsToOrders`(`groups_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_groupsToOrders_orders1_idx` ON `groupsToOrders`(`orders_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueGroupToOrder` ON `groupsToOrders`(`orders_id` ASC, `groups_id` ASC);

PRAGMA foreign_keys=OFF;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 9
	                         AND delta_set = 'Main';
-- Fragment ends: 9 --
-- Fragment begins: 10 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (10, 'Main', strftime('%s','now'), 'dbdeploy', '10-create-employeesToGroups.sql');
PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `employeesToGroups` (
  `groups_id` INT,
  `employees_id` INT,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
    
CREATE INDEX `fk_employeesToGroups_groups1_idx` ON `employeesToGroups` (`groups_id` ASC);
CREATE INDEX `fk_employeesToGroups_employees1_idx` ON `employeesToGroups` (`employees_id` ASC);
CREATE UNIQUE INDEX `uniqueEmployeesToGroups` ON `employeesToGroups` (`employees_id` ASC, `groups_id` ASC);
PRAGMA foreign_keys=ON;


UPDATE changelog
	                         SET complete_dt = strftime('%s','now')
	                         WHERE change_number = 10
	                         AND delta_set = 'Main';
-- Fragment ends: 10 --
