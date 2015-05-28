
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
