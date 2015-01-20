CREATE TABLE IF NOT EXISTS `widgets`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fulfilled` INT NULL DEFAULT 0,
  `unfulfilled` VARCHAR(45) NULL,
  `groups_id` INT NOT NULL,
  `groups_users_companies_id` INT NOT NULL,
  `customers_id` INT NULL,
  PRIMARY KEY (`id`, `groups_id`, `groups_users_companies_id`),
  INDEX `fk_orders_groups1_idx` (`groups_id` ASC, `groups_users_companies_id` ASC),
  CONSTRAINT `fk_orders_groups1`
    FOREIGN KEY (`groups_id`)
    REFERENCES `widgets`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COLLATE utf8mb4_bin;

--//@UNDO
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `widgets`.`orders`;
SET FOREIGN_KEY_CHECKS = 1;
--//