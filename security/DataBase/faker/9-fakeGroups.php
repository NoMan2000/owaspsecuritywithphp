<?php

include_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

use \security\Models\Generator\RandomGenerator;
use \security\Models\MySQLISingleton;

$mysqli = new MySQLISingleton();

$faker = Faker\Factory::create();

$mysqlValues = $sqliteValues = [];


$fakeGroups = 40;

for ($i = 1; $i <= $fakeGroups; $i++) {
    $users = [];
    $groupName = $faker->catchPhrase;
    $mysqlGroupname = $mysqli->real_escape_string($groupName);
    $sqliteGroupname = SQLite3::escapeString($groupName);
    $company_id = mt_rand(1, 10); 
    $query = "SELECT users.group_id
              FROM users
              WHERE users.company_id = $company_id";
    $result = $mysqli->query($query);
    while ($row = $result->fetch_assoc()) {
        $users[] = $row['group_id'];
    }
    $usersString = implode(',', $users);

    $mysqlQuery = "INSERT INTO groups (id, `name`, `companies_id`, users_id ) 
            VALUES($i, '$mysqlGroupname', $company_id, '$usersString')";    

    $sqliteQuery = "INSERT INTO groups (id, `name`, `companies_id`, users_id) 
            VALUES($i, '$mysqlGroupname', $company_id, '$usersString')";    
    
    $mysqlValues[] = $mysqlQuery;
    $sqliteValues[] = $sqliteQuery;
}

// Begin MySQL SQL statements.

$valueString = implode(";".PHP_EOL,$mysqlValues);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE groups; 
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/9-companyGroupSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = implode(";".PHP_EOL,$sqliteValues);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "
PRAGMA foreign_keys=OFF;
delete from groups;
PRAGMA foreign_keys=ON;
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/8-companyGroupSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);