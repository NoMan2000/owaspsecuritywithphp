SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `widgets`.`customersToOrders` (
  `orders_id` INT UNSIGNED NOT NULL,
  `customers_id` INT UNSIGNED NOT NULL,
  INDEX `fk_customersToOrders_orders1_idx` (`orders_id` ASC),
  INDEX `fk_customersToOrders_customers1_idx` (`customers_id` ASC),
  UNIQUE INDEX `uniqueCustomerToOrder` (`orders_id` ASC, `customers_id` ASC),
  CONSTRAINT `fk_customersToOrders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `widgets`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customersToOrders_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `widgets`.`customers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COLLATE = utf8mb4_bin;

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'127.0.0.1' IDENTIFIED BY 'somepassword';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--//@UNDO
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON widgets.customersToOrders TO 'widgetCustomer'@'127.0.0.1';

DROP TABLE IF EXISTS `widgets`.`customersToOrders`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--//    
