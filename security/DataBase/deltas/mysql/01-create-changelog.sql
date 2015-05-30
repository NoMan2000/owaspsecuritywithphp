CREATE TABLE IF NOT EXISTS `widgets`.`changelog` (
  `change_number` BIGINT(20) UNSIGNED NOT NULL,
  `delta_set` VARCHAR(10) NOT NULL,
  `start_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complete_dt` TIMESTAMP NULL DEFAULT NULL,
  `applied_by` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`change_number`, `delta_set`))
ENGINE = InnoDB
COLLATE = utf8mb4_bin;
