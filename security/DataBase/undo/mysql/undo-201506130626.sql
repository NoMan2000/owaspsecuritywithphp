-- Fragment begins: 20 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE employeesToGroups;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 20
	                         AND delta_set = 'Main';
-- Fragment ends: 20 --
-- Fragment begins: 19 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE groupsToOrders;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 19
	                         AND delta_set = 'Main';
-- Fragment ends: 19 --
-- Fragment begins: 18 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE customerToOrders;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 18
	                         AND delta_set = 'Main';
-- Fragment ends: 18 --
-- Fragment begins: 17 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE companyToGroups;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 17
	                         AND delta_set = 'Main';
-- Fragment ends: 17 --
-- Fragment begins: 16 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE orders;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 16
	                         AND delta_set = 'Main';
-- Fragment ends: 16 --
-- Fragment begins: 15 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE customers;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 15
	                         AND delta_set = 'Main';
-- Fragment ends: 15 --
-- Fragment begins: 14 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE groups;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 14
	                         AND delta_set = 'Main';
-- Fragment ends: 14 --
-- Fragment begins: 13 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE employees;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 13
	                         AND delta_set = 'Main';
-- Fragment ends: 13 --
-- Fragment begins: 12 --
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE companies;
SET FOREIGN_KEY_CHECKS = 1;
--//
DELETE FROM changelog
	                         WHERE change_number = 12
	                         AND delta_set = 'Main';
-- Fragment ends: 12 --
