<?php
namespace security\Models\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \stdClass;

class CorporateEditOrder
{
    private $session;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->pdo = $models->pdo;
        $this->orderData = $orderData;
        $this->session = $orderData->session;
    }
    public function updateOrder()
    {
        $errors = [];
        $pdo = $this->pdo;
        $orderID = $this->orderData->orderID;
        $fulfilled = intval($this->orderData->fulfilled);
        $unfulfilled = intval($this->orderData->unfulfilled);
        $isShipped = intval($this->orderData->isShipped);
        $groupID = intval($this->session['groupid']);
        $query = "UPDATE orders AS o
                  SET o.fulfilled = :fulfilled,
                  o.unfulfilled = :unfulfilled,
                  o.is_shipped = :isShipped
                  WHERE o.id = :orderID";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':fulfilled', $fulfilled, PDO::PARAM_INT);
        $stmt->bindParam(':unfulfilled', $unfulfilled, PDO::PARAM_INT);
        $stmt->bindParam(':isShipped', $isShipped, PDO::PARAM_INT);
        $stmt->bindParam(':orderID', $orderID, PDO::PARAM_INT);

        $success = $stmt->execute();
        $query = "SELECT  o.id, o.fulfilled, o.unfulfilled,
                  o.is_shipped, c.username, c.email, c.address, c.phone,
                  c.instructions, c.city, c.state, c.countrycode, c.zip
                  FROM orders AS o
                  JOIN (groupsToOrders AS gTo, groups AS g, customersToOrders AS cTo, customers AS c)
                  ON (gTo.groups_id, gTo.orders_id, cTo.orders_id) =
                  (g.id, o.id, o.id)
                  WHERE (g.id, o.id, c.id) = ($groupID, $orderID, cTo.customers_id)";

        foreach ($pdo->query($query) as $row) {
            return [
                'id' => $row['id'],
                'fulfilled' => $row['fulfilled'],
                'unfulfilled' => $row['unfulfilled'],
                'is_shipped' => $row['is_shipped'],
                'username' => $row['username'],
                'email' => $row['email'],
                'address' => $row['address'],
                'phone' => $row['phone'],
                'instructions' => $row['instructions'],
                'city' => $row['city'],
                'state' => $row['state'],
                'countrycode' => $row['countrycode'],
                'zip' => $row['zip']
            ];
        }
        $errors[] = "No order could be found.";
        $this->models->errorRunner->runErrors($errors);
    }
}
