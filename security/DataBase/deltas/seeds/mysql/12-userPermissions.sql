
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
