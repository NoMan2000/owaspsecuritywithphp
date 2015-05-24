PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `customersToOrders` (
  `orders_id` UNSIGNED INT NOT NULL,
  `customers_id` UNSIGNED INT NOT NULL,
   FOREIGN KEY (`orders_id`)
    REFERENCES `orders` (`id`),
   FOREIGN KEY (`customers_id`)
    REFERENCES `customers` (`id`)
);

CREATE INDEX IF NOT EXISTS `fk_customersToOrders_orders1_idx` ON `customersToOrders` (`orders_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_customersToOrders_customers1_idx` ON `customersToOrders` (`customers_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueCustomerToOrder` ON `customersToOrders`(`orders_id` ASC, `customers_id` ASC);

PRAGMA foreign_keys=ON; 
  
--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `customersToOrders`;
PRAGMA foreign_keys=ON;
--//
