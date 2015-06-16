<?php

namespace security\Models;

require_once dirname(dirname(__DIR__)) . '/public/init.php';

use \mysqli;

class MySQLISingleton extends mysqli
{
    private $host;
    private $database;
    private $user;
    private $pass;
    private $charset;
    private $port;
    private $socket;

    public function __construct()
    {
        $this->host = 'localhost';
        $this->database = 'widgets';
        $this->user = 'root';
        $this->pass = 'admin';
        $this->charset = "utf8mb4";
        $this->port = ini_get("mysqli.default_port");
        $this->socket = ini_get("mysql.default_socket");

        if (PHP_OS === "LINUX") {
            $this->socket = '/home/ubuntu/lib/mysql/socket/mysql.sock';
        }

        $this->connect(
            $this->host,
            $this->user,
            $this->pass,
            $this->database,
            $this->port,
            $this->socket
        );
        $this->set_charset($this->charset);

        if ($this->connect_error) {
            die("Connect Error ({$this->connect_error}) of type: {$this->connect_errno})");
        }
    }
}
