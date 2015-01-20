<?php

namespace security\Models\Login;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \PDO;
use \Redis;
use \security\Interfaces\CustomerType;
use \security\Traits\IsDevelopment;

class CustomerLogin implements CustomerType
{
    use IsDevelopment;
    private $username;
    private $password;
    private $errorRunner;
    private $pdo;
    private $data = [];

    public function checkUser(PDO $pdo, ErrorRunner $errorRunner, Redis $redis, BlackLister $blackList, $username, $password)
    {
        $dev = $this->isDev();
        $this->errorRunner = $errorRunner;
        $sql = 'SELECT id, username, password FROM customers WHERE username = :username';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $dev) {
            $this->errors[] = $errorInfo[2];
        }
        // Mysql returns the number of results fetched as an integer, but SQLite does not.
        // This check makes the code more portable.
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            $blackList->blackList();
            $this->errors[] = "Could not access account.  Try again.";
        }
        if ($row) {
            $resultPassword = $row['password'];
            $isCorrectPassword = password_verify($password, $resultPassword);
            if ($isCorrectPassword) {
                $blackList->removeBlackList();
                $blackList->removeSleeper("$username:{$row['username']}");
                // Careful when using session_regenerate_id true.  This calls session_destroy.
                session_regenerate_id(true);
                $userid = $row['id'];
                $_SESSION['customerid'] = $row['id'];
                $_SESSION['isauthenticated'] = true;
                $_SESSION['customerType'] = CustomerType::CUSTOMER;
                $this->data['userid'] = $userid;
                return $this->data;
            }
            if (!$isCorrectPassword) {
                $sleep = $blackList->setSleeper("$username:{$row['username']}");
                if ($dev) {
                    $this->errors[] = "Sleeping for $sleep.";
                }
                $this->errors[] = "Could not access account.  Try again.";
            }
        }
        $this->checkErrors();
    }
    protected function checkErrors()
    {
        if (!empty($this->errors)) {
            $this->errorRunner->runErrors($this->errors);
        }
    }
    
}
