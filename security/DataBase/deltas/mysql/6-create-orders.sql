CREATE TABLE IF NOT EXISTS `widgets`.`orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fulfilled` INT UNSIGNED NULL DEFAULT 0,
  `unfulfilled` INT UNSIGNED NULL,
  `is_shipped` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';

--//@UNDO
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%';
DROP TABLE IF EXISTS `widgets`.`orders`;
--//