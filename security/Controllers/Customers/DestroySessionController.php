<?php

namespace security\Controllers\Customers;

// This needs to be rewritten, it seems to be poorly implemented.

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\DestroySession;
use \security\Models\ErrorRunner;
use \security\Models\SessionInitializers;
use \security\Models\SiteLogger\FullLog;
use \security\Controllers\Customers\BaseCustomerController;
use \SplObjectStorage;
use \StdClass;

class DestroySessionController extends BaseCustomerController
{
    private $action;
    private $data;

    public function __construct(stdClass $models, stdClass $customerData)
    {
        parent::__construct($models);
        $this->customerData;
        $this->setObjects();
        $this->switchAction();
    }
    protected function constructObjects()
    {

        $this->action = $this->customerData->action;
        isset($this->models->init) && $this->models->init instanceof SessionInitializers ?
            $this->setInit($this->models->init) : $this->setDefaultInit();
    }
    public function setInit(SessionInitializers $init)
    {
        $this->init = $init;
    }
    protected function setDefaultInit()
    {
        $this->init = new SessionInitializers();
    }
    public function setAction($action)
    {
        $this->action = $action;
        return $this;
    }
    protected function switchAction()
    {
        $action = $this->action;
        switch ($action) {
            case 'destroySession':
                $destroy = new DestroySession($this->init);
                $destroy->sessionDestroy();
                $this->data['loggedout'] = $destroy;
                break;
        }
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Logging out');
$checkAuth = new CheckAuth($logger);
$init = new SessionInitializers();
$errors = [];

$action = !empty($_POST['action']) ? $_POST['action'] : null;
$isCustomer = $checkAuth->isCustomer();
$csrf = !empty($_POST['csrf']) ? $_POST['csrf'] : null;
$session = isset($_SESSION) ? $_SESSION : null;
$csrf || $errors[] = "There is no token for this account.  You have most likely timed out.";
$isCustomer || $errors[] = "You are not authenticated as a customer.";
$session || $errors[] = "You do not have a session identifier.";
if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf) {
    $errors[] = "You do not have permission to perform that action.";
}

if (empty($errors)) {
    $customerData = new StdClass;
    $customerData->action = $action;
    $customerData->session = $session;

    $modelObjects = new StdClass;
    $modelObjects->init = $init;

    $controller = new DestroySessionController($modelObjects,$customerData);
    if ($isAjax) {
        echo json_encode($controller);
    }
}
