<?php

namespace security\Models;

include_once(dirname(dirname(__DIR__)) . '/vendor/autoload.php');

use \Exception;
use \PDOException;
use \PDO;
use \security\Interfaces\DBPrivileges;
use \security\Traits\IsDevelopment;

class PDOSingleton extends PDO implements DBPrivileges
{
    use IsDevelopment;
    private $engine;
    private $host;
    private $database;
    private $user;
    private $pass;
    private $socket;
    private $charset;

    public function __construct($privileges = DBPrivileges::GLOBALUSER)
    {
        $this->engine = 'mysql';
        $this->host = 'localhost';
        $this->database = 'widgets';
        $this->privileges = $privileges;
        $this->switchPrivileges();
        $this->charset = 'utf8mb4';
        $this->socket = ini_get('mysqli.default_socket') ? ini_get('mysqli.default_socket') : null;
        if (PHP_OS === "LINUX") {
            $this->socket = '/home/ubuntu/lib/mysql/socket/mysql.sock';
        }
        $dns = "{$this->engine}:unix_socket={$this->socket};
                dbname={$this->database};host={$this->host};charset={$this->charset}";

        try {
            parent::__construct($dns, $this->user, $this->pass);
            // Set to a strict error mode.  This can reveal very sensitive information on a
            // production database.
            if ($this->isDev()) {
                $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }
        } catch (PDOException $e) {
            echo "Unable to connect: " . $e->getMessage() ."<p>";
        }
    }
    protected function switchPrivileges()
    {
        switch($this->privileges) {
            case DBPrivileges::GLOBALUSER:
                $this->user = 'widgetMain';
                $this->pass = 'abc123';
                break;
            case DBPrivileges::ADMINUSER:
                $this->user = "widgetAdmin";
                $this->pass = "somepassword";
                break;
            case DBPrivileges::CORPORATEUSER:
                $this->user = "widgetCorporate";
                $this->pass = "somepassword";
                break;
            case DBPrivileges::CUSTOMERUSER:
                $this->user = "widgetCustomer";
                $this->pass = "somepassword";
                break;
        }
    }
}
