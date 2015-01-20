CREATE TABLE 'changelog' (
    `change_number` bigint(20) NOT NULL AUTOINCREMENT,
    'delta_set' TEXT NOT NULL, 
    `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'applied_by' TEXT NOT NULL,
    'description' TEXT NOT NULL, 
    'complete_dt' DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (`change_number`,`delta_set`) 
);

--//@UNDO

DROP TABLE `changelog`;

--//