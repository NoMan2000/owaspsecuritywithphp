CREATE TABLE IF NOT EXISTS 'groups' (
'id' INTEGER PRIMARY KEY AUTOINCREMENT, 
'name' TEXT NOT NULL,
'companies_id' INTEGER NOT NULL, 
'users_id' TEXT NULL,
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies` (`id`)
);

CREATE INDEX `fk_groups_companies1_idx` ON "groups" (`companies_id` ASC);

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE `groups`;
PRAGMA foreign_keys=ON;
--//