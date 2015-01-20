<?php

namespace security\Models\DTClasses;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . "public/init.php");

use \security\Controllers\DTClasses\CustomersJson;

class CustomersJsonModel implements JsonSerializable
{
    public function __construct()
    {
        
    }
    public function getData()
    {
        $customersJson = new CustomersJsonController();
        $draw = intval($customersJson->getDraw());
        $recordsTotal = intval($customersJson->getRecordsTotal());
        $filteredTotal = intval($customersJson->getFilteredTotal());
        $form_labels = $customersJson->getFormLabels();
        $errors = $customersJson->errors;
        $output = [
            "draw" => $draw,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $filteredTotal,
            "data" => []
        ];
        if ($recordsTotal !== 0) {
            $this->createTableStructure();
        }
        if ($recordsTotal === 0) {
            
        }
    }
    public function createTableStructure()
    {
    if (empty($errors)) {
        $stmt = $groups_json->getStmt();
        $isObject = is_object($stmt);
        unset($groups_json);
        $row_data = [];
        while ($isObject && $aRow = $stmt->fetch_assoc()) {
            // Adding in site id from the missing columns.
            $site_id = $aRow['id'];
            $name = $aRow["name"];
            $address = $aRow["address"];
            $city = $aRow["city"];
            $state = $aRow["state"];
            $zip = $aRow["zip"];
            $type = $aRow["type"];
            if ($type == 1) {
                $site_type = 'P';
            } else {
                $site_type = 'S';
            }
            // Actions based on permissions...
            // We don't have any permissions check on this particular file at least.
            // And why are we putting this in an array?  There's no reason for it.
            $actions = "<div class='btn-group'>
            <a class='btn btn-default btn-xs dropdown-toggle' data-toggle='dropdown'
            href='javascript:void(0);''>Actions
            <span class='caret'></span>
            </a>
            <ul class='dropdown-menu pull-right'>
            <li class='textLabels' data-headername='Edit Group'>
                <a href='ajax/site-wizard/?id={$site_id}' data-siteid='{$site_id}' data-name='{$name}'
                class='editnode activateModal modalpop'>
                <img src='{$jsDir}images/tabedit.png' class='tabicons' title='edit Icons'/>
                Edit Group
            </a>
            </li>
            </ul>
            </div>";
            $row_data[] = [
                'name' => "<span data-id='$site_id' data-change='name' data-original='$name'>$name</span>",
                'address' => "<span data-id='$site_id' data-change='address' data-original='$address'>$address</span>",
                'city' => "<span data-id='$site_id' data-original='$city' data-change='city'>$city</span>",
                'state' => "<span data-id='$site_id' data-original='$state' data-change='state'>$state</span>",
                'zip' => "<span data-id='$site_id' data-original='$zip' data-change='zip'>$zip</span>",
                'type' => $site_type,
                'actions' => $actions
            ];
        }
    }
    if (empty($errors)) {
        $output['data'] = $row_data;
    }
    if (!empty($errors)) {
        $output['error'] = $errors;
    }
    $json_output = json_encode($output);
    echo $json_output;
    }