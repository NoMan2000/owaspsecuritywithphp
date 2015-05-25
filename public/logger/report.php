<?php

require_once(dirname(dirname(__DIR__)). DIRECTORY_SEPARATOR . 'vendor/autoload.php');

use \security\Models\SiteLogger\CSPLogger;

$json = file_get_contents('php://input');

(new CSPLogger($json));