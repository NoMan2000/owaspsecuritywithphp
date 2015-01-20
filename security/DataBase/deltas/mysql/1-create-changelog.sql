CREATE TABLE IF NOT EXISTS `widgets`.`changelog` (
 `change_number` bigint(20) NOT NULL,
 `delta_set` varchar(10) NOT NULL,
 `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `complete_dt` timestamp NULL DEFAULT NULL,
 `applied_by` varchar(100) NOT NULL,
 `description` varchar(500) NOT NULL,
 PRIMARY KEY (`change_number`,`delta_set`)
) ENGINE=InnoDB COLLATE utf8mb4_bin;

--//@UNDO

DROP TABLE `widgets`.`changelog`;

--//