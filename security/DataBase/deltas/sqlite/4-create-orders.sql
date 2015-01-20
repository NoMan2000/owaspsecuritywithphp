CREATE TABLE IF NOT EXISTS `orders` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `fulfilled` INTEGER NULL DEFAULT 0,
  `unfulfilled` VARCHAR(45) NULL,
  `groups_id` INTEGER NOT NULL,
  `customers_id` INTEGER NULL,
  `groups_users_companies_id` INTEGER NULL,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`)
);

CREATE INDEX `fk_orders_groups1_idx` ON "orders" (`groups_id` ASC, `groups_users_companies_id` ASC);

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE `orders`;
PRAGMA foreign_keys=ON;
--//