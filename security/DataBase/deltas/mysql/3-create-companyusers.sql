CREATE TABLE IF NOT EXISTS `widgets`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` INT NULL,
  `group_id` TEXT NULL,
  `is_admin` BINARY NULL DEFAULT 0,
  `is_locked` BINARY NULL DEFAULT 0,
  `attempts` INT DEFAULT 0,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_company_idx` (`company_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  CONSTRAINT `fk_users_companies`
    FOREIGN KEY (`company_id`)
    REFERENCES `widgets`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = InnoDB COLLATE utf8mb4_bin;

--//@UNDO
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `widgets`.`users`;
SET FOREIGN_KEY_CHECKS = 1;
--//