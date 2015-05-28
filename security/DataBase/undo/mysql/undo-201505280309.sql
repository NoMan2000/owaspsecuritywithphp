-- Fragment begins: 10 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS `widgets`.`employeesToGroups`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    

DELETE FROM changelog
	                         WHERE change_number = 10
	                         AND delta_set = 'Main';
-- Fragment ends: 10 --
-- Fragment begins: 9 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS `widgets`.`groupsToOrders`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    

DELETE FROM changelog
	                         WHERE change_number = 9
	                         AND delta_set = 'Main';
-- Fragment ends: 9 --
-- Fragment begins: 8 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS `widgets`.`customersToOrders`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    

DELETE FROM changelog
	                         WHERE change_number = 8
	                         AND delta_set = 'Main';
-- Fragment ends: 8 --
-- Fragment begins: 7 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS `widgets`.`companyToGroups`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    

DELETE FROM changelog
	                         WHERE change_number = 7
	                         AND delta_set = 'Main';
-- Fragment ends: 7 --
-- Fragment begins: 6 --
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'127.0.0.1';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'127.0.0.1';


DROP TABLE IF EXISTS `widgets`.`orders`;
--//
DELETE FROM changelog
	                         WHERE change_number = 6
	                         AND delta_set = 'Main';
-- Fragment ends: 6 --
-- Fragment begins: 5 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`customers`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    
    
DELETE FROM changelog
	                         WHERE change_number = 5
	                         AND delta_set = 'Main';
-- Fragment ends: 5 --
-- Fragment begins: 4 --

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`groups`;
--//
DELETE FROM changelog
	                         WHERE change_number = 4
	                         AND delta_set = 'Main';
-- Fragment ends: 4 --
-- Fragment begins: 3 --


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.employees TO 'widgetCorporate'@'127.0.0.1';


DROP TABLE IF EXISTS `widgets`.`employees`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//
DELETE FROM changelog
	                         WHERE change_number = 3
	                         AND delta_set = 'Main';
-- Fragment ends: 3 --
-- Fragment begins: 2 --
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS `widgets`.`companies`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//
DELETE FROM changelog
	                         WHERE change_number = 2
	                         AND delta_set = 'Main';
-- Fragment ends: 2 --
-- Fragment begins: 1 --

DROP TABLE IF EXISTS `widgets`.`changelog`;

--//
DELETE FROM changelog
	                         WHERE change_number = 1
	                         AND delta_set = 'Main';
-- Fragment ends: 1 --
