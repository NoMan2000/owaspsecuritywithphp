PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `companyToGroups` (
  `groups_id` INT,
  `companies_id` INT,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_companyToGroups_groups1_idx` ON `companyToGroups`(`groups_id` ASC);
CREATE INDEX IF NOT EXISTS `fk_companyToGroups_companies1_idx` ON `companyToGroups` (`companies_id` ASC);
CREATE UNIQUE INDEX IF NOT EXISTS `uniqueCompaniesToGroups` ON `companyToGroups`(`groups_id` ASC, `companies_id` ASC);
PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `companyToGroups`;
PRAGMA foreign_keys=ON;
--//

