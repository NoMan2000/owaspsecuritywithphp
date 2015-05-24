CREATE DATABASE IF NOT EXISTS widgets COLLATE utf8mb4_bin;
USE `widgets` ;

GRANT USAGE ON widgets.* TO 'widgetMain'@'%' IDENTIFIED BY 'abc123';
GRANT USAGE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT USAGE ON widgets.* TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';

GRANT ALL ON widgets.* TO 'widgetMain'@'%' IDENTIFIED BY 'abc123' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';


--//@UNDO
DROP USER 'widgetMain'@'%';
DROP USER 'widgetSuper'@'%';
DROP USER 'widgetAdmin'@'%';
DROP USER 'widgetCorporate'@'%';
DROP USER 'widgetCustomer'@'%';

DROP DATABASE IF EXISTS widgets;

--//