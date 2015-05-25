PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `fulfilled` UNSIGNED INT NULL DEFAULT 0,
  `unfulfilled` UNSIGNED INT NULL,
  `is_shipped` UNSIGNED TINYINT(1) NULL
);
PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `orders`;
PRAGMA foreign_keys=ON;
--//