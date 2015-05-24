PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` UNSIGNED INT NOT NULL,
  `fulfilled` UNSIGNED INT NULL DEFAULT 0,
  `unfulfilled` UNSIGNED INT NULL,
  `is_shipped` UNSIGNED TINYINT(1) NULL,
  PRIMARY KEY (`id`)
);
PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `orders`;
PRAGMA foreign_keys=ON;
--//