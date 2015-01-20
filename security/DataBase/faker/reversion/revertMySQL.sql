
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
