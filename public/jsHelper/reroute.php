<?php
$paths = require_once __DIR__ . '/../bootstrap/paths.php';
require_once $paths['vendor'] . DIRECTORY_SEPARATOR . 'autoload.php';

use \security\Models\ErrorRunner;

$whiteList = [
    'Controllers/',
];

$errorRunner = new ErrorRunner();
$errors = [];

$to = null;
if (!empty($_POST['to'])) {
    $to = $_POST['to'];
}
if (!empty($_GET['to'])) {
    $to = $_GET['to'];
}
$to || $errors[] = "We need a mapper to go to.";

$checkSafeTo = preg_split("/(?<=[\/\\\])(?![\/\\\])/", $to);
if (!in_array($checkSafeTo[0], $whiteList)) {
    $errors[] = "Not a whitelisted area.";
}
if (empty($errors)) {

    // You can change this to route anywhere you want,
    // but from an Ajax call, only the non-accessible areas
    // are difficult to manage.
    //
    // Limit 3 attacks:  Unauthorized areas with the whitelist, Null-byte with the
    // realpath, and traversal with the realpath
    $security = $paths['security'];
    $requested = realpath($security . DIRECTORY_SEPARATOR . $to);
    echo $requested;
    if (!file_exists($requested)) {
        $errors[] = "The file requested could not be found.";
    }
    if (file_exists($requested)) {
        require_once $requested;
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
