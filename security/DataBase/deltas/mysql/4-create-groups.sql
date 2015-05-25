CREATE TABLE IF NOT EXISTS `widgets`.`groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword'; 

--//@UNDO

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`groups`;
--//