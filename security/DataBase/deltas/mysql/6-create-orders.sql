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

--//@UNDO
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'127.0.0.1';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'127.0.0.1';


DROP TABLE IF EXISTS `widgets`.`orders`;
--//