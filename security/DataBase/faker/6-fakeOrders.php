<?php

$values = [];

$fakeOrders = 1000;

for ($i = 1; $i <= $fakeOrders; $i++) {

    $numberOrdered = mt_rand(1, 500);
    $fulfilled = mt_rand(0, $numberOrdered);
    $unfulfilled = $numberOrdered - $fulfilled;
    $isShipped = 0;

    if (!$unfulfilled) {
        $isShipped = 1;
    }

    $q = "INSERT INTO orders(id, unfulfilled, fulfilled, is_shipped)
        VALUES (null, $unfulfilled, $fulfilled, $isShipped)";

    $values[] = $q;
}

// Begin MySQL SQL statements.

$valueString = implode(";".PHP_EOL,$values);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE orders;
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/16-orderSeeds.sql";
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
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/16-orderSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
