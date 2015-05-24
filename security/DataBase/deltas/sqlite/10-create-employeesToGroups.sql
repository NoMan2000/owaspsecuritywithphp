PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `employeesToGroups` (
  `groups_id` UNSIGNED INT NOT NULL,
  `employees_id` UNSIGNED INT NOT NULL,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`),
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees` (`id`)
);
    
CREATE INDEX `fk_employeesToGroups_groups1_idx` ON `employeesToGroups` (`groups_id` ASC);
CREATE INDEX `fk_employeesToGroups_employees1_idx` ON `employeesToGroups` (`employees_id` ASC);
CREATE UNIQUE INDEX `uniqueEmployeesToGroups` ON `employeesToGroups` (`employees_id` ASC, `groups_id` ASC);
PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `employeesToGroups`;
PRAGMA foreign_keys=ON;
--//