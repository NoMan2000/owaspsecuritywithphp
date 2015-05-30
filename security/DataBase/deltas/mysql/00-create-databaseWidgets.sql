CREATE DATABASE IF NOT EXISTS widgets COLLATE utf8mb4_bin;
USE `widgets` ;

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

GRANT ALL ON *.* TO 'widgetMain'@'%' IDENTIFIED BY 'abc123' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'widgetMain'@'localhost' IDENTIFIED BY 'abc123' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'widgetMain'@'127.0.0.1' IDENTIFIED BY 'abc123' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'127.0.0.1' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'127.0.0.1' IDENTIFIED BY 'somepassword';

FLUSH PRIVILEGES;
