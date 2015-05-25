<?php
$mysqlQuery = "
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE widgets.changelog;
DROP TABLE `widgets`.`companies`;
DROP TABLE `widgets`.`users`;
DROP TABLE `widgets`.`groups`;
DROP TABLE `widgets`.`customers`;
DROP TABLE `widgets`.`orders`;

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
DROP TABLE companies;
DROP TABLE users;
DROP TABLE groups;
DROP TABLE orders;
DROP TABLE customers;
PRAGMA foreign_keys=ON;
";

$seedsFile = __DIR__ . "/reversion/revertSQLite.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $sqliteQuery);

