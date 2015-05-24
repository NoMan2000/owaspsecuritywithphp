PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `groupsToOrders` (
  `groups_id` UNSIGNED INT NOT NULL,
  `orders_id` UNSIGNED INT NOT NULL,
  FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`),
	FOREIGN KEY (`orders_id`)
    REFERENCES `orders` (`id`)
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
