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

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword'; 

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--//@UNDO
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.companyToGroups TO 'widgetCorporate'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`companyToGroups`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    
