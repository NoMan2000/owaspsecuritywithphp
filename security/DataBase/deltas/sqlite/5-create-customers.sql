PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `customers` (
  `id` UNSIGNED INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `verified` UNSIGNED TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);


CREATE UNIQUE INDEX IF NOT EXISTS `customer_username_UNIQUE` ON `customers`(`username` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `customer_email_UNIQUE` ON `customers`(`email` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `address_UNIQUE` ON `customers`(`address` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `phone_UNIQUE` ON `customers` (`phone` ASC);
PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `customers`;
PRAGMA foreign_keys=ON;
--//    
    