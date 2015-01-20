CREATE TABLE IF NOT EXISTS `widgets`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `instructions` TEXT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `verified` TINYINT DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `customer_username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `customer_email_UNIQUE` (`email` ASC)
) ENGINE = InnoDB COLLATE utf8mb4_bin;

--//@UNDO
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `widgets`.`customers`;
SET FOREIGN_KEY_CHECKS = 1;
--//    
    