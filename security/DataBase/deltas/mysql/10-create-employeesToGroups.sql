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

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--//@UNDO
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employeesToGroups TO 'widgetCorporate'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`employeesToGroups`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    
