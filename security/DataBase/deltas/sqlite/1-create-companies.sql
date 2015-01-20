CREATE TABLE IF NOT EXISTS `companies` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL,
  `address` VARCHAR(155) NULL,
  `city` VARCHAR(155) NULL,
  `state` VARCHAR(155) NULL,
  `phone` VARCHAR(45) NULL
);

--//@UNDO

DROP TABLE `companies`;

--//