-- Fragment begins: 12 --
DROP USER 'widgetSuper'@'%';
DROP USER 'widgetAdmin'@'%';
DROP USER 'widgetCorporate'@'%';
DROP USER 'widgetCustomer'@'%';
--//

DELETE FROM changelog
	                         WHERE change_number = 12
	                         AND delta_set = 'Main';
-- Fragment ends: 12 --
-- Fragment begins: 11 --
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE orders; 
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 11
	                         AND delta_set = 'Main';
-- Fragment ends: 11 --
