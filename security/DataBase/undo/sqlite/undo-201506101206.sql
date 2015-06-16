-- Fragment begins: 20 --
PRAGMA foreign_keys=OFF;
delete from employeesToGroups;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 20
	                         AND delta_set = 'Main';
-- Fragment ends: 20 --
-- Fragment begins: 19 --
PRAGMA foreign_keys=OFF;
delete from groupsToOrdersSeeds;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 19
	                         AND delta_set = 'Main';
-- Fragment ends: 19 --
-- Fragment begins: 18 --
PRAGMA foreign_keys=OFF;
delete from customerToOrders;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 18
	                         AND delta_set = 'Main';
-- Fragment ends: 18 --
-- Fragment begins: 17 --
PRAGMA foreign_keys=OFF;
delete from companyToGroups;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 17
	                         AND delta_set = 'Main';
-- Fragment ends: 17 --
-- Fragment begins: 16 --
PRAGMA foreign_keys=OFF;
delete from orders;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 16
	                         AND delta_set = 'Main';
-- Fragment ends: 16 --
-- Fragment begins: 15 --
PRAGMA foreign_keys=OFF;
delete from customers;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 15
	                         AND delta_set = 'Main';
-- Fragment ends: 15 --
-- Fragment begins: 14 --

PRAGMA foreign_keys=OFF;
delete from groups;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 14
	                         AND delta_set = 'Main';
-- Fragment ends: 14 --
-- Fragment begins: 13 --
PRAGMA foreign_keys=OFF;
delete from employees;
PRAGMA foreign_keys=ON;

--//
DELETE FROM changelog
	                         WHERE change_number = 13
	                         AND delta_set = 'Main';
-- Fragment ends: 13 --
-- Fragment begins: 12 --
PRAGMA foreign_keys=OFF;
delete from companies;
PRAGMA foreign_keys=ON;
--//
DELETE FROM changelog
	                         WHERE change_number = 12
	                         AND delta_set = 'Main';
-- Fragment ends: 12 --
