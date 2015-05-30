-- Fragment begins: 10 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `employeesToGroups`;
PRAGMA foreign_keys=ON;
--//
DELETE FROM changelog
	                         WHERE change_number = 10
	                         AND delta_set = 'Main';
-- Fragment ends: 10 --
-- Fragment begins: 9 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `groupsToOrders`;
PRAGMA foreign_keys=ON;
--//

DELETE FROM changelog
	                         WHERE change_number = 9
	                         AND delta_set = 'Main';
-- Fragment ends: 9 --
-- Fragment begins: 8 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `customersToOrders`;
PRAGMA foreign_keys=ON;
--//

DELETE FROM changelog
	                         WHERE change_number = 8
	                         AND delta_set = 'Main';
-- Fragment ends: 8 --
-- Fragment begins: 7 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `companyToGroups`;
PRAGMA foreign_keys=ON;
--//


DELETE FROM changelog
	                         WHERE change_number = 7
	                         AND delta_set = 'Main';
-- Fragment ends: 7 --
-- Fragment begins: 6 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `orders`;
PRAGMA foreign_keys=ON;
--//
DELETE FROM changelog
	                         WHERE change_number = 6
	                         AND delta_set = 'Main';
-- Fragment ends: 6 --
-- Fragment begins: 5 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `customers`;
PRAGMA foreign_keys=ON;
--//


DELETE FROM changelog
	                         WHERE change_number = 5
	                         AND delta_set = 'Main';
-- Fragment ends: 5 --
-- Fragment begins: 4 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `groups`;
PRAGMA foreign_keys=ON;
--//
DELETE FROM changelog
	                         WHERE change_number = 4
	                         AND delta_set = 'Main';
-- Fragment ends: 4 --
-- Fragment begins: 3 --
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `employees`;
PRAGMA foreign_keys=ON;
--//
DELETE FROM changelog
	                         WHERE change_number = 3
	                         AND delta_set = 'Main';
-- Fragment ends: 3 --
-- Fragment begins: 2 --
DROP TABLE IF EXISTS `companies`;
--//

DELETE FROM changelog
	                         WHERE change_number = 2
	                         AND delta_set = 'Main';
-- Fragment ends: 2 --
-- Fragment begins: 1 --

DROP TABLE IF EXISTS `changelog`;

--//
DELETE FROM changelog
	                         WHERE change_number = 1
	                         AND delta_set = 'Main';
-- Fragment ends: 1 --
