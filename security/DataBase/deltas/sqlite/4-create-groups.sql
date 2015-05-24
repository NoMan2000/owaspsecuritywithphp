CREATE TABLE IF NOT EXISTS `groups` (
  `id` UNSIGNED INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `groups`;
PRAGMA foreign_keys=ON;
--//