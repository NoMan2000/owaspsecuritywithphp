<?php
$mysqlQuery = "
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE `widgets`.`changelog`;
DROP TABLE IF EXISTS `widgets`.`companies`;
DROP TABLE IF EXISTS `widgets`.`groups`;
DROP TABLE IF EXISTS `widgets`.`customers`;
DROP TABLE IF EXISTS `widgets`.`orders`;
DROP TABLE IF EXISTS `widgets`.`employees`;
DROP TABLE IF EXISTS `widgets`.`companyToGroups`;
DROP TABLE IF EXISTS `widgets`.`customersToOrders`;
DROP TABLE IF EXISTS `widgets`.`groupsToOrders`;
DROP TABLE IF EXISTS `widgets`.`employeesToGroups`;

GRANT USAGE ON widgets.* TO 'widgetMain'@'%' IDENTIFIED BY 'abc123';
GRANT USAGE ON widgets.* TO 'widgetMain'@'localhost' IDENTIFIED BY 'abc123';
GRANT USAGE ON widgets.* TO 'widgetMain'@'127.0.0.1' IDENTIFIED BY 'abc123';

GRANT USAGE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetSuper'@'localhost' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetSuper'@'127.0.0.1' IDENTIFIED BY 'somepassword';

GRANT USAGE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetAdmin'@'localhost' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetAdmin'@'127.0.0.1' IDENTIFIED BY 'somepassword';

GRANT USAGE ON widgets.* TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCorporate'@'localhost' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCorporate'@'127.0.0.1' IDENTIFIED BY 'somepassword';

GRANT USAGE ON widgets.* TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCustomer'@'localhost' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCustomer'@'127.0.0.1' IDENTIFIED BY 'somepassword';

DROP USER 'widgetSuper'@'%';
DROP USER 'widgetAdmin'@'%';
DROP USER 'widgetCorporate'@'%';
DROP USER 'widgetCustomer'@'%';
SET FOREIGN_KEY_CHECKS = 1;
";

$seedsFile = __DIR__ . "/reversion/revertMySQL.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $mysqlQuery);

$sqliteQuery = "
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
";

$seedsFile = __DIR__ . "/reversion/revertSQLite.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $sqliteQuery);

