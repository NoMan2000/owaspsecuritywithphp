<?php
include_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php';

use \security\Models\Generator\RandomGenerator;
use \security\Models\Generator\CountryList;
use \security\Models\MySQLISingleton;


$rand = new RandomGenerator();

$mysqli = new MySQLISingleton();

$faker = Faker\Factory::create();
$fakeCustomers = 20;

$countryCodeKeys  = array_keys($countries);
$countryCodeKeysLen = count($countryCodeKeys);

$mysqlValues = $sqliteValues = [];

/**
 * Note:  addslashes is a bad idea because it only adds slashes as an escape sequence.
 * Depending upon the database, most notably SQLite, it follows the SQL standard of a
 * backslash followed by a single quote as the proper escape sequence,
 * while MySQL just uses the backslash as an escape sequence.  Prepared statements are better than
 * relying upon these sorts of escape quote functions.
 *
 * Even within escaped characters recognized by addslashes, it does not recognize the correct encoding.
 * There are a certain class of injection attacks that take advantage of this to insert malicious data.
 */

// Create a default set of admin users so that each company will have at least one admin.

// INSERT INTO `customers`(`id`, `username`, `password`, `plainpassword`, `email`, `address`, `instructions`,
//`phone`, `numberordered`, `order_id`)
//VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9])

for ($i = 1; $i <= $fakeCustomers; $i++) {
    $username = $faker->userName;
    $mysqlUsername = $mysqli->real_escape_string($username);
    $sqliteUsername = SQLite3::escapeString($username);

    $plainpassword = $faker->password;
    $mysqlPlainpassword = $mysqli->real_escape_string($plainpassword);
    $sqlitePlainpassword = SQLite3::escapeString($plainpassword);

    $mysqlPassword = password_hash($plainpassword, PASSWORD_DEFAULT);
    $sqlitePassword = password_hash($plainpassword, PASSWORD_DEFAULT);

    $email = $faker->safeEmail;
    $mysqlEmail = $mysqli->real_escape_string($email);
    $sqliteEmail = SQLite3::escapeString($email);

    $address = $faker->address;
    $mysqlAddress = $mysqli->real_escape_string($address);
    $sqliteAddress = SQLite3::escapeString($address);

    $city = $faker->city;
    $mysqlCity = $mysqli->real_escape_string($city);
    $sqliteCity = SQLite3::escapeString($city);

    $state = $faker->state;
    $mysqlState = $mysqli->real_escape_string($state);
    $sqliteState = SQLite3::escapeString($state);

    $phone = $faker->unique()->numerify('##########');
    $countryCode = $countryCodeKeys[mt_rand(0, $countryCodeKeysLen)];
    $phone = $faker->unique()->numerify('##########');
    $zip = $faker->zip('#####');

    $sentences = mt_rand(1, 4);
    $instructions = $faker->optional()->paragraph($sentences);
    $mysqlInstructions = $mysqli->real_escape_string($instructions);
    $sqliteInstructions = SQLite3::escapeString($instructions);

    $mysqlQuery = "INSERT INTO `customers`(`username`, `password`,
                  `plainpassword`, `email`,
                  `address`, `instructions`, `phone`, `verified`,
                  `city`, `state`, `zip`, `countrycode`) VALUES
              ('$mysqlUsername', '$mysqlPassword', '$mysqlPlainpassword', '$mysqlEmail',
              '$mysqlAddress', '$mysqlInstructions', $phone, 1,
              '$mysqlCity', '$mysqlState', '$zip', '$countryCode'
              )";

    $sqliteQuery = "INSERT INTO `customers`(`username`, `password`, `plainpassword`, `email`,
                  `address`, `instructions`, `phone`, `verified`,
                  `city`, `state`, `zip`, `countrycode`) VALUES
                  ('$sqliteUsername', '$sqlitePassword', '$sqlitePlainpassword', '$sqliteEmail',
                   '$sqliteAddress', '$sqliteInstructions', $phone, 1,
                   '$sqliteCity', '$sqliteState', '$zip', '$countryCode')";

    $mysqlValues[] = $mysqlQuery;
    $sqliteValues[] = $sqliteQuery;
}

// Begin MySQL SQL statements.

$valueString = implode(";" . PHP_EOL, $mysqlValues);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE customers;
SET FOREIGN_KEY_CHECKS = 1;" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/mysql/15-customerSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);

/**
 * Begin SQLite Preparations
 */

$valueString = implode(";" . PHP_EOL, $sqliteValues);
$valueString .= ";";
$valueString .= PHP_EOL . "--//@UNDO" . PHP_EOL . "PRAGMA foreign_keys=OFF;
delete from customers;
PRAGMA foreign_keys=ON;
" . PHP_EOL . "--//";
$seedsFile = dirname(__DIR__) . "/deltas/seeds/sqlite/15-customerSeeds.sql";
if (!file_exists($seedsFile)) {
    touch($seedsFile);
}
file_put_contents($seedsFile, $valueString);
