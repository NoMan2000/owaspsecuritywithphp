PRAGMA foreign_keys=OFF;
CREATE TABLE IF NOT EXISTS `employeesToGroups` (
  `groups_id` INT,
  `employees_id` INT,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
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