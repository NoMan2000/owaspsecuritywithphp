<?php
$paths = require_once __DIR__.'/../bootstrap/paths.php';
require_once($paths['vendor'].DIRECTORY_SEPARATOR.'autoload.php');

use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$errors = [];

$isAjax = ($auth->isAjax() && $auth->filledAndSet(@$_POST['isAjax'])) ? true : false;
$to = $auth->filledAndSet(@$_POST['to']) ? $_POST['to'] : null;

if (is_null($isAjax) || is_null($to)) {
    $isAjax || $errors[] = "This is only meant to be used by Ajax calls.";
    $to || $errors[] = "This needs a mapper to go to.";
}

if (empty($errors)) {
    // You can change this to route anywhere you want, but from an Ajax call, only the non-accessible areas 
    // are difficult to manage.
    $security = $paths['security'];
    $requested = $security.DIRECTORY_SEPARATOR.$to;
    if (!file_exists($requested)) {
        $errors[] = "The file requested could not be found.";
    }
    if (file_exists($requested)) {
        require_once($requested);
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}


