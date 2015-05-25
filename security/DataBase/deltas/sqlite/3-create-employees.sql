PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS `employees` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` INT NULL DEFAULT NULL,
  `is_admin` BOOLEAN NULL DEFAULT 0,
  `is_locked` BOOLEAN NULL DEFAULT 0,
  `attempts` UNSIGNED TINYINT(1) NULL DEFAULT 0,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS `fk_users_company_idx` ON employees(`company_id` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `username_UNIQUE` ON employees(`username` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `email_UNIQUE` ON employees(`email` ASC);
CREATE  UNIQUE INDEX IF NOT EXISTS `phone_UNIQUE` ON employees(`phone` ASC);

PRAGMA foreign_keys=ON;

--//@UNDO
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS `employees`;
PRAGMA foreign_keys=ON;
--//