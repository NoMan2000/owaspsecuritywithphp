<?php

$values = [];

$fakeOrders = 1000;

for ($i = 1; $i <= $fakeOrders; $i++) {
    
    $custRand = mt_rand(1, 20);
    $groupRand = mt_rand(1, 40);
    $numberOrdered = mt_rand(1, 500);
    $fulfilled = mt_rand(0, $numberOrdered);

    $q = "INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT $numberOrdered, $fulfilled, groups.id, groups.companies_id, $custRand
        FROM groups
        WHERE groups.id =$groupRand";
    
    $values[] = $q;
}

// Begin MySQL SQL statements.

$valueString = implode(";".PHP_EOL,$values);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE orders; 
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/11-companyOrderSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = implode(";".PHP_EOL,$values);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "PRAGMA foreign_keys=OFF;
delete from orders;
PRAGMA foreign_keys=ON; 
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/10-companyOrderSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
