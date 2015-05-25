PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `groupsToOrders` (
  `groups_id` INT,
  `orders_id` INT,
  FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (`orders_id`)
    REFERENCES `orders` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_groupsToOrders_groups1_idx` ON `groupsToOrders`(`groups_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_groupsToOrders_orders1_idx` ON `groupsToOrders`(`orders_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueGroupToOrder` ON `groupsToOrders`(`orders_id` ASC, `groups_id` ASC);

PRAGMA foreign_keys=OFF;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `groupsToOrders`;
PRAGMA foreign_keys=ON;
--//
