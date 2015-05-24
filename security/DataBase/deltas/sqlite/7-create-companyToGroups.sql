PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `companyToGroups` (
  `groups_id` UNSIGNED INT NOT NULL,
  `companies_id` UNSIGNED INT NOT NULL,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`),
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies` (`id`)
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

