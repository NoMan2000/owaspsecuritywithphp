<?php

$values = $sqliteValues = [];

$groups = 40;
$employees = 150;
$valueString = '';
for ($i = 1; $i <= $employees; $i++) {

    $q = "INSERT INTO employeesToGroups (groups_id, employees_id)
    (SELECT FLOOR(
        RAND() *
            ($groups -1 + 1)
        )
        + 1,
        $i
    )";

    $values[] = $q;

    $q = "INSERT INTO employeesToGroups (groups_id, employees_id)
    SELECT ABS(RANDOM() % $groups)+1,
        $i
    ";

    $sqliteValues[] = $q;
}

// Begin MySQL SQL statements.
$valueString .= "SET FOREIGN_KEY_CHECKS = 0;";
$valueString .= implode(";" . PHP_EOL, $values);
$valueString .= ";";
$valueString .= "SET FOREIGN_KEY_CHECKS = 1;";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE employeesToGroups;
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/20-employeesToGroupsSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = "PRAGMA foreign_keys = OFF;";
$valueString .= implode(";" . PHP_EOL, $sqliteValues);
$valueString .= ";";
$valueString .= "PRAGMA foreign_keys=ON;";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "PRAGMA foreign_keys=OFF;
delete from employeesToGroups;
PRAGMA foreign_keys=ON;
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/20-employeesToGroupsSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
