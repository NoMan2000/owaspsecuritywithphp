
PRAGMA foreign_keys=OFF;
delete from changelog;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS companyToGroups;
DROP TABLE IF EXISTS customersToOrders;
DROP TABLE IF EXISTS groupsToOrders;
DROP TABLE IF EXISTS employeesToGroups;
PRAGMA foreign_keys=ON;
