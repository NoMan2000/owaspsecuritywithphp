CREATE TABLE IF NOT EXISTS `users` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` VARCHAR(45) NULL,
  `is_locked` BINARY DEFAULT 0,
  `attempts` INT DEFAULT 0,
  `password` TEXT NOT NULL,
  `group_id` TEXT NULL,
  `plainpassword` TEXT NOT NULL,
  `is_admin` BINARY NULL DEFAULT 0,
    FOREIGN KEY (`company_id`)
    REFERENCES `companies` (`id`)
);
CREATE INDEX 'fk_users_companies_idx' ON "users" ("company_id" ASC);
CREATE UNIQUE INDEX 'username_UNIQUE' ON "users" ("username" ASC);
CREATE UNIQUE INDEX 'email_UNIQUE' ON "users" ("email" ASC);
CREATE UNIQUE INDEX 'phone_UNIQUE' ON "users" ("phone" ASC);

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE `users`;
PRAGMA foreign_keys=ON;
--//