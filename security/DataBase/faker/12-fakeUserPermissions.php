<?php

// MySQL Only, create database permission for specific users.

$valueString = "
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.users TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';

--//@UNDO
DROP USER 'widgetSuper'@'%';
DROP USER 'widgetAdmin'@'%';
DROP USER 'widgetCorporate'@'%';
DROP USER 'widgetCustomer'@'%';
--//
";

$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/12-userPermissions.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
