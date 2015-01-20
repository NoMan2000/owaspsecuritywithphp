CREATE TABLE IF NOT EXISTS `widgets`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL,
  `address` VARCHAR(155) NULL,
  `city` VARCHAR(155) NULL,
  `state` VARCHAR(155) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB COLLATE utf8mb4_bin;

--//@UNDO

DROP TABLE `widgets`.`companies`;

--//