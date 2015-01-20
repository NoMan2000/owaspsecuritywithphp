<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

class DestroySession 
{
    private $errors = [];
    public $success = [];
    private $init;
    public function __construct($init)
    {
        $this->init = $init;
        $this->destroySession();
    }
    protected function destroySession()
    {
        $this->init->destroySession();
        $this->success = ["loggedout"=>"Successfully ended user session."];
        return $this->success;
    }
}