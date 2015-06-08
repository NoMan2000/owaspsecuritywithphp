<?php
$paths = require_once __DIR__ . '/../bootstrap/paths.php';
require_once $paths['vendor'] . DIRECTORY_SEPARATOR . 'autoload.php';

use \security\Models\ErrorRunner;

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

if (empty($errors)) {

    // There is no whitelisted area and no path mapping.
    $security = $paths['security'];
    $requested = $security . DIRECTORY_SEPARATOR . $to;
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
