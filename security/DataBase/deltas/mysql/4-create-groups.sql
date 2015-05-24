CREATE TABLE IF NOT EXISTS `widgets`.`groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 

--//@UNDO
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'widgetCorporate'@'%';
DROP TABLE IF EXISTS `widgets`.`groups`;
--//