<?php

namespace security\Models\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Models\Corporate\BaseCorporate;
use \stdClass;

class AddNewCorporateOrder extends BaseCorporate
{
    private $customerID;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->orderData = $orderData;
    }
    public function addOrder()
    {
        $customerID = $this->orderData->customerID;
        $totalOrdered = $this->orderData->totalOrdered;
        $groupID = $this->orderData->groupID;
        $isAdmin = $this->orderData->isAdmin;
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
        $this->addOrdersToGroups($customerID, $orderID, $groupID);
        $editOrder = $orderID;
        if ($isAdmin) {
            $editOrder = "<a href='editOrder.php?order={$orderID}'>
                {$orderID}</a>";
        }
        $html = "<section id='{$orderID}' class='animateHidden'>
                <div class='col-sm-3'>$editOrder</div><div class='col-sm-3'>0</div>
                <div class='col-sm-3'>{$totalOrdered}</div>
                <div class='col-sm-3'>
                <button type='button' class='btn btn-danger'
                data-confirm='Delete the order?' data-id='{$orderID}'
                data-unfulfilled='{$totalOrdered}'>Delete Order</button>
                </div></section>";

        if ($success) {
            $pdo->commit();
            $this->data['success'] = [
                "numberAdded" => "We have added your orders.  A group will be assigned to handle them.",
                "id" => $orderID,
                "fulfilled" => 0,
                "unfulfilled" => $totalOrdered,
                "html" => $html,
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
    protected function addOrdersToGroups($customerID, $orderID, $groupID)
    {
        $pdo = $this->pdo;
        $errors = [];
        // In a real application, we would probably use the customers
        // zip code as a lookup for the closest company, and then
        // assign a group with the lowest outstanding orders.
        $query = "INSERT INTO groupsToOrders
                  SET groups_id = $groupID,
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
