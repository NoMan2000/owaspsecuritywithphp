<?php

namespace security\Models;

require_once dirname(dirname(__DIR__)) . '/public/init.php';

use \Redis;
use \RedisException;

class RedisSingleton extends Redis
{
    private $host = '127.0.0.1';
    private $timeout = 2.5;
    private $auth = 'wcNq4vwD-4Wz';
    private $port = 6379;

    public function __construct()
    {
        try {
            parent::__construct();
            parent::pconnect($this->host, $this->port, $this->timeout);
            parent::auth($this->auth);
        } catch (RedisException $e) {
            echo "Unable to connect: " . $e->getMessage() . "<p>";
        }
    }
}
