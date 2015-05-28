-- Fragment begins: 1 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (1, 'Main', NOW(), 'dbdeploy', '1-create-changelog.sql');
CREATE TABLE IF NOT EXISTS `widgets`.`changelog` (
  `change_number` BIGINT(20) UNSIGNED NOT NULL,
  `delta_set` VARCHAR(10) NOT NULL,
  `start_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complete_dt` TIMESTAMP NULL DEFAULT NULL,
  `applied_by` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`change_number`, `delta_set`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 1
	                         AND delta_set = 'Main';
-- Fragment ends: 1 --
-- Fragment begins: 2 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (2, 'Main', NOW(), 'dbdeploy', '2-create-companies.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`companies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL DEFAULT NULL,
  `address` VARCHAR(155) NULL DEFAULT NULL,
  `city` VARCHAR(155) NULL DEFAULT NULL,
  `state` VARCHAR(155) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 2
	                         AND delta_set = 'Main';
-- Fragment ends: 2 --
-- Fragment begins: 3 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (3, 'Main', NOW(), 'dbdeploy', '3-create-employees.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`employees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` INT UNSIGNED NULL DEFAULT NULL,
  `is_admin` BOOLEAN NULL DEFAULT 0,
  `is_locked` BOOLEAN NULL DEFAULT 0,
  `attempts` TINYINT(1) UNSIGNED NULL DEFAULT 0,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_company_idx` (`company_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  CONSTRAINT `fk_users_companies`
    FOREIGN KEY (`company_id`)
    REFERENCES `widgets`.`companies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 3
	                         AND delta_set = 'Main';
-- Fragment ends: 3 --
-- Fragment begins: 4 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (4, 'Main', NOW(), 'dbdeploy', '4-create-groups.sql');
CREATE TABLE IF NOT EXISTS `widgets`.`groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword'; 


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 4
	                         AND delta_set = 'Main';
-- Fragment ends: 4 --
-- Fragment begins: 5 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (5, 'Main', NOW(), 'dbdeploy', '5-create-customers.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`customers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(155) NOT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `verified` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `customer_username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `customer_email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'127.0.0.1' IDENTIFIED BY 'somepassword';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 5
	                         AND delta_set = 'Main';
-- Fragment ends: 5 --
-- Fragment begins: 6 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (6, 'Main', NOW(), 'dbdeploy', '6-create-orders.sql');
CREATE TABLE IF NOT EXISTS `widgets`.`orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fulfilled` INT UNSIGNED NULL DEFAULT 0,
  `unfulfilled` INT UNSIGNED NULL,
  `is_shipped` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'127.0.0.1' IDENTIFIED BY 'somepassword';


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 6
	                         AND delta_set = 'Main';
-- Fragment ends: 6 --
-- Fragment begins: 7 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (7, 'Main', NOW(), 'dbdeploy', '7-create-companyToGroups.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE TABLE IF NOT EXISTS `widgets`.`companyToGroups` (
  `groups_id` INT UNSIGNED NOT NULL,
  `companies_id` INT UNSIGNED NOT NULL,
  INDEX `fk_companyToGroups_groups1_idx` (`groups_id` ASC),
  INDEX `fk_companyToGroups_companies1_idx` (`companies_id` ASC),
  UNIQUE INDEX `uniqueCompaniesToGroups` (`groups_id` ASC, `companies_id` ASC),
  CONSTRAINT `fk_companyToGroups_groups1`
    FOREIGN KEY (`groups_id`)
    REFERENCES `widgets`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_companyToGroups_companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `widgets`.`companies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 7
	                         AND delta_set = 'Main';
-- Fragment ends: 7 --
-- Fragment begins: 8 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (8, 'Main', NOW(), 'dbdeploy', '8-create-customersToOrders.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`customersToOrders` (
  `orders_id` INT UNSIGNED NOT NULL,
  `customers_id` INT UNSIGNED NOT NULL,
  INDEX `fk_customersToOrders_orders1_idx` (`orders_id` ASC),
  INDEX `fk_customersToOrders_customers1_idx` (`customers_id` ASC),
  UNIQUE INDEX `uniqueCustomerToOrder` (`orders_id` ASC, `customers_id` ASC),
  CONSTRAINT `fk_customersToOrders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `widgets`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customersToOrders_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `widgets`.`customers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 8
	                         AND delta_set = 'Main';
-- Fragment ends: 8 --
-- Fragment begins: 9 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (9, 'Main', NOW(), 'dbdeploy', '9-create-groupsToOrders.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`groupsToOrders` (
  `groups_id` INT UNSIGNED NOT NULL,
  `orders_id` INT UNSIGNED NOT NULL,
  INDEX `fk_groupsToOrders_groups1_idx` (`groups_id` ASC),
  INDEX `fk_groupsToOrders_orders1_idx` (`orders_id` ASC),
  UNIQUE INDEX `uniqueGroupToOrder` (`orders_id` ASC, `groups_id` ASC),
  CONSTRAINT `fk_groupsToOrders_groups1`
    FOREIGN KEY (`groups_id`)
    REFERENCES `widgets`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_groupsToOrders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `widgets`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 9
	                         AND delta_set = 'Main';
-- Fragment ends: 9 --
-- Fragment begins: 10 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (10, 'Main', NOW(), 'dbdeploy', '10-create-employeesToGroups.sql');
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`employeesToGroups` (
  `groups_id` INT UNSIGNED NOT NULL,
  `employees_id` INT UNSIGNED NOT NULL,
  INDEX `fk_employeesToGroups_groups1_idx` (`groups_id` ASC),
  INDEX `fk_employeesToGroups_employees1_idx` (`employees_id` ASC),
  UNIQUE INDEX `uniqueEmployeesToGroups` (`employees_id` ASC, `groups_id` ASC),
  CONSTRAINT `fk_employeesToGroups_groups1`
    FOREIGN KEY (`groups_id`)
    REFERENCES `widgets`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employeesToGroups_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `widgets`.`employees` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 10
	                         AND delta_set = 'Main';
-- Fragment ends: 10 --
