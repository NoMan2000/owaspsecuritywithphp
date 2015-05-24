<?php

namespace security\Models;

include_once(dirname(dirname(__DIR__)) . '/vendor/autoload.php');

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
        $this->user = 'widgetMain'; 
        $this->pass = 'abc123';    
        $this->charset = "utf8mb4";
        $this->port = ini_get("mysqli.default_port");
        $this->socket = ini_get("mysql.default_socket");
        
        if (PHP_OS === "DARWIN") {
        	$this->socket = "/tmp/mysql.sock";
        }
        if (PHP_OS === "LINUX") {
        	$this->socket = '/home/ubuntu/lib/mysql/socket/mysql.sock';
        }
        if (PHP_OS === "WINNT") {
        	// Override here if needed
        }
        parent::__construct(
            $this->host,
            $this->user,
            $this->pass,
            $this->database,
            $this->port,
            $this->socket
        );
        parent::set_charset($this->charset);
        
        if (mysqli_connect_error()) {
            die('Connect Error (' . mysqli_connect_errno() . ') '
                    . mysqli_connect_error());
        }
    }
}