CREATE TABLE IF NOT EXISTS `widgets`.`groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `companies_id` INT NOT NULL,
  `users_id` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_groups_companies1_idx` (`companies_id` ASC)
)ENGINE = InnoDB COLLATE utf8mb4_bin;

--//@UNDO
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `widgets`.`groups`;
SET FOREIGN_KEY_CHECKS = 1;
--//