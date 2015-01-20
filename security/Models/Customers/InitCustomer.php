<?php

namespace security\Models\Customers;

use \PDO;
use \security\Models\ErrorRunner;

class InitCustomer {
    private $pdo;
    private $session;
    private $data = [];
    public function __construct(PDO $pdo, $session)
    {
        $this->pdo = $pdo;
        $this->session = $session;
        $this->setCustomerValues();
    }
    protected function setCustomerValues()
    {
        $pdo = $this->pdo;
        $session = $this->session;
        $query = "SELECT username, email, address, phone, instructions  
                  FROM customers WHERE id={$session['customerid']}";
        $result = $pdo->query($query);
        $this->data = [
                'error'=>'no user found',
                'username' => null,
                'email' => null,
                'address' => null,
                'phone' => null,
                'instructions' => null
            ];
        if ($result) {
            foreach($result as $row) {
                $row = filter_var_array($row, FILTER_SANITIZE_STRING);
                $username = $row['username'];
                $email = $row['email'];
                $address = $row['address'];
                $phone = $row['phone'];
                $instructions = $row['instructions'];
            }
            
            $this->data = [
                'username' => $username,
                'email' => $email,
                'address' => $address,
                'phone' => $phone,
                'instructions' => $instructions
            ];
        }
    }
    public function getCustomerValues()
    {
        return $this->data;
    }
    
}