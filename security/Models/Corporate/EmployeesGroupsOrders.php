<?php
namespace security\Models\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \stdClass;

class EmployeesGroupsOrders
{
    private $session;

    public function __construct(stdClass $models, array $session)
    {
        $this->pdo = $models->pdo;
        $this->session = $session;
    }
    public function setOrders()
    {
        $errors = [];
        $pdo = $this->pdo;
        $id = intval($this->session['groupid']);
        $this->data = [];
        $query = "SELECT orders.id, fulfilled, unfulfilled, is_shipped
                  FROM orders
                  JOIN (groupsToOrders, groups)
                  ON (groupsToOrders.groups_id, groupsToOrders.orders_id) =
                  (groups.id, orders.id)
                  WHERE groups.id ={$id}";

        foreach ($pdo->query($query) as $row) {
            $this->data[] = [
                'id' => $row['id'],
                'fulfilled' => $row['fulfilled'],
                'unfulfilled' => $row['unfulfilled'],
                'is_shipped' => $row['is_shipped'],
            ];
        }
    }
    public function setCustomerList()
    {
        $errors = [];
        $this->data = [];
        $pdo = $this->pdo;
        $groupID = intval($this->session['groupid']);
        $query = "SELECT DISTINCT c.id, c.username FROM customers AS c
                    JOIN (groups AS g, orders AS o, customersToOrders AS cTo,
                          groupsToOrders AS gTo)
                    ON (gTo.orders_id = o.id
                        AND gTo.groups_id = g.id
                        AND cTo.customers_id = c.id
                        AND cTo.orders_id = gTo.orders_id
                        AND g.id = $groupID)";
        foreach ($pdo->query($query) as $row) {
            $this->data[] = [
                'id' => $row['id'],
                'username' => $row['username'],
            ];
        }
    }
    public function getOrders()
    {
        return $this->data;
    }
    public function getCustomerList()
    {
        return $this->data;
    }
}
