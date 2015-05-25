CREATE TABLE IF NOT EXISTS `companies` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL DEFAULT NULL,
  `address` VARCHAR(155) NULL DEFAULT NULL,
  `city` VARCHAR(155) NULL DEFAULT NULL,
  `state` VARCHAR(155) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL
);

--//@UNDO
DROP TABLE IF EXISTS `companies`;
--//