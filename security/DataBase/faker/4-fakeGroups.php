<?php

include_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php';

use \security\Models\MySQLISingleton;

$mysqli = new MySQLISingleton();

$faker = Faker\Factory::create();

$mysqlValues = $sqliteValues = [];

$fakeGroups = 40;

for ($i = 1; $i <= $fakeGroups; $i++) {
    $groupName = $faker->catchPhrase;
    $mysqlGroupname = $mysqli->real_escape_string($groupName);
    $sqliteGroupname = SQLite3::escapeString($groupName);

    $mysqlQuery = "INSERT INTO groups (id, `name`)
            VALUES(null, '$mysqlGroupname')";

    $sqliteQuery = "INSERT INTO groups (id, `name`)
            VALUES(null, '$sqliteGroupname')";

    $mysqlValues[] = $mysqlQuery;
    $sqliteValues[] = $sqliteQuery;
}

// Begin MySQL SQL statements.

$valueString = "SET FOREIGN_KEY_CHECKS = 0;" . PHP_EOL;
$valueString .= implode(";" . PHP_EOL, $mysqlValues);
$valueString .= ";SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL;
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE groups;
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/14-groupSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = "PRAGMA foreign_keys=OFF;" . PHP_EOL;
$valueString .= implode(";" . PHP_EOL, $sqliteValues);
$valueString .= ";PRAGMA foreign_keys=ON;" . PHP_EOL;
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "
PRAGMA foreign_keys=OFF;
delete from groups;
PRAGMA foreign_keys=ON;
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/14-groupSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
