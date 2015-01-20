<?php
require_once(dirname(__DIR__) . '/vendor/autoload.php');

use \security\Models\PDOSingleton;
use \security\Models\Inits;
use \security\Models\ErrorRunner;
use \security\Models\SiteLogger\FullLog;
use \Monolog\Logger;
use \security\Models\RedisSingleton;
use \security\Models\RedisSessionHandler;
use \security\Models\SessionInitializers;

$db = new PDOSingleton();
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog();
$sessHandler = new RedisSessionHandler($redis);

session_set_save_handler($sessHandler);
(new SessionInitializers);
(new Inits($errorRunner, $logger));