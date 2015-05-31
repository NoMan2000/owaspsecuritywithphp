<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \PDO;
use \stdClass;
use \security\Models\Customers\BaseCustomer;

class AddNewOrder extends BaseCustomer
{
    private $customerID;

    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
    public function addOrder($customerID, $totalOrdered)
    {
        $errors = [];
        $pdo = $this->pdo;
        $transaction = $pdo->beginTransaction();
        $query = "INSERT INTO orders
                  SET unfulfilled = :totalOrdered,
                  is_shipped = 0";
        $stmt = $pdo->prepare($query);
        if (!$stmt) {
            $errors[] = "Unable to create a new record.";
        }
        $stmt->bindParam(':totalOrdered', $totalOrdered, PDO::PARAM_INT);
        $success = $stmt->execute();
        $orderID = $pdo->lastInsertId();
        if (!$success || !$orderID) {
            $errors[] = "Unable to add orders.";
            $pdo->rollback();
            $this->errorRunner->runErrors($errors);
        }
        $this->addOrdersToCustomers($customerID, $orderID);
        $this->addOrdersToGroups($customerID, $orderID);
        if ($success) {
            $pdo->commit();
            $this->data['success'] = [
                "numberAdded"=>"We have added your orders.  A group will be assigned to handle them.",
                "id"=>$orderID,
                "fulfilled"=>0,
                "unfulfilled"=>$totalOrdered
            ];
            return $this->data;
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
    protected function addOrdersToCustomers($customerID, $orderID)
    {
        $pdo = $this->pdo;
        $errors = [];
        $query = "INSERT INTO customersToOrders
                  SET customers_id = :customerid,
                  orders_id = {$orderID}";
        $stmt = $pdo->prepare($query);
        if (!$stmt) {
            $errors[] = "Unable to create a new record.";
        }
        $stmt->bindParam(':customerid', $customerID, PDO::PARAM_INT);
        $success = $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
            $this->logger->addCritical("Unable to add new order because {$errorInfo[2]}");
        }
        if ($errors) {
            $pdo->rollback();
            $this->errorRunner->runErrors($errors);
        }
    }
    protected function addOrdersToGroups($customerID, $orderID)
    {
        $pdo = $this->pdo;
        $errors = [];
        $group = mt_rand(1, 40);
        // In a real application, we would probably use the customers
        // zip code as a lookup for the closest company, and then
        // assign a group with the lowest outstanding orders.
        $query = "INSERT INTO groupsToOrders
                  SET groups_id = $group,
                  orders_id = $orderID";
        $stmt = $pdo->prepare($query);
        $success = $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
            $this->logger->addCritical("Unable to add new order because {$errorInfo[2]}");
        }
        if ($errors) {
            $pdo->rollback();
            $this->errorRunner->runErrors($errors);
        }
    }
}
