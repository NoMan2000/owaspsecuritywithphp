<?php

$values = $sqliteValues = [];

$companies = 10;
$groups = 40;
$valueString = '';
for ($i = 1; $i <= $groups; $i++) {
    
    
    $q = "INSERT INTO companyToGroups (companies_id, groups_id) 
	(SELECT FLOOR(
		RAND() * 
			($companies -1 + 1)
		) 
        + 1,
        $i
	)";
    
    $values[] = $q;
    
    $q = "INSERT INTO companyToGroups (companies_id, groups_id) 
	SELECT ABS(RANDOM() % $companies)+1,
        $i
	";
    
    $sqliteValues[] = $q;
}

// Begin MySQL SQL statements.
$valueString .= "SET FOREIGN_KEY_CHECKS = 0;";
$valueString .= implode(";".PHP_EOL,$values);
$valueString .= ";";
$valueString .= "SET FOREIGN_KEY_CHECKS = 1;";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE companyToGroups; 
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/17-companyToGroupsSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = "PRAGMA foreign_keys = OFF;";
$valueString .= implode(";".PHP_EOL, $sqliteValues);
$valueString .= ";";
$valueString .= "PRAGMA foreign_keys=ON;";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "PRAGMA foreign_keys=OFF;
delete from companyToGroups;
PRAGMA foreign_keys=ON; 
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/17-companyToGroupsSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

