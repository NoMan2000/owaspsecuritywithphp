CREATE TABLE IF NOT EXISTS `customers` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL, 
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `instructions` TEXT NULL,
  `phone` TEXT NOT NULL,
  `verified` INTEGER DEFAULT 0
);

CREATE UNIQUE INDEX `customer_username_UNIQUE` ON `customers` (`username` ASC);
CREATE UNIQUE INDEX `customer_email_UNIQUE` ON `customers` (`email` ASC);

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE `customers`;
PRAGMA foreign_keys=ON;
--//    
    