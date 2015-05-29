<?php

namespace security\Models\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \stdClass;

class InitCustomer
{
    private $session;
    
    public function __construct(stdClass $models, array $session)
    {
        $this->pdo = $models->pdo;
        $this->session = $session;
    }
    public function setCustomerValues()
    {
        $errors = [];
        $pdo = $this->pdo;
        $session = $this->session;
        $query = "SELECT username, email, address, phone, instructions
                  FROM customers WHERE id={$session['customerid']}";
        $result = $pdo->query($query);
        
        if ($result) {
            foreach ($result as $row) {
                $this->data = [
                    'username' => $row['username'],
                    'email' => $row['email'],
                    'address' => $row['address'],
                    'phone' => $row['phone'],
                    'instructions' => $row['instructions']
                ];
            }
        }
        if (!$result) {
            $errors[] = "Unable to retrieve customer information.";
            $this->errorRunner->runErrors($errors);
        }
    }
    public function getCustomerValues()
    {
        return $this->data;
    }
}
