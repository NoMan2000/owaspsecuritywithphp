<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \PDO;
use \security\Models\ErrorRunner;
use \security\Interfaces\FullLogInterface;
use \security\Traits\IsDevelopment;
use \security\Models\Customers\BaseCustomer;

class AddNewOrder extends BaseCustomer
{
    use IsDevelopment;
    private $errors = [];
    private $customerID;
    private $pdo;
    private $errorRunner;
    private $data;

    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
    public function addOrder($customerID, $totalOrdered)
    {
        $errors = $this->errors;
        $pdo = $this->pdo;
        $query = "INSERT INTO orders
                  SET unfulfilled = :totalOrdered,
                  groups_id = 1,
                  groups_users_companies_id = 9,
                  customers_id = :customerid";
        $stmt = $pdo->prepare($query);
        if (!$stmt) {
            $errors[] = "Unable to delete this record.";
        }
        $stmt->bindParam(':totalOrdered', $totalOrdered, PDO::PARAM_INT);
        $stmt->bindParam(':customerid', $customerID, PDO::PARAM_INT);
        $success = $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
            $this->logger->addCritical("Unable to update because {$errorInfo[2]}");
        }

        if (!$success) {
            $errors[] = "Unable to add orders.";
        }
        if ($success) {
            $numberAdded = $stmt->rowCount();
            if (!$numberAdded) {
                $errors[] = "No rows were updated.";
            }
            if ($numberAdded) {
                $id = $pdo->lastInsertId();
                $query = "SELECT id, fulfilled, unfulfilled FROM orders WHERE id = $id";
                foreach ($pdo->query($query) as $row) {
                    $this->data['success'] = [
                        "numberAdded"=>"We have added your orders.  A group will be assigned to handle them.",
                        "id"=>$row['id'],
                        "fulfilled"=>$row['fulfilled'],
                        "unfulfilled"=>$row['unfulfilled']
                    ];
                    return $this->data;
                }
            }
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
}
