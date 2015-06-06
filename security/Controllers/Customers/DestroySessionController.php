<?php

namespace security\Controllers\Customers;

// This needs to be rewritten, it seems to be poorly implemented.

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\DestroySession;
use \security\Models\ErrorRunner;
use \security\Models\SessionInitializers;
use \security\Models\SiteLogger\FullLog;
use \StdClass;

class DestroySessionController extends BaseCustomerController
{
    public function __construct(stdClass $models, stdClass $userData)
    {
        isset($models->init) && $models->init instanceof SessionInitializers ?
        $this->setInit($models->init) : $this->setDefaultInit();
        $this->destroy = new DestroySession($this->init);
    }
    public function setInit(SessionInitializers $init)
    {
        $this->init = $init;
    }
    protected function setDefaultInit()
    {
        $this->init = new SessionInitializers();
    }
    public function destroySession()
    {
        $this->data['loggedout'] = $this->destroy->destroySession();
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

if (isset($_POST['submit']) || isset($_GET)) {
    extract($_POST);
    extract($_GET);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('User Logging out');
    $checkAuth = new CheckAuth($logger);
    $init = new SessionInitializers();
    $errors = [];

    $isCustomer = $checkAuth->isCustomer();
    $isCorporate = $checkAuth->isCorporate();
    $csrf = !empty($csrf) ? $csrf : null;
    $session = isset($_SESSION) ? $_SESSION : null;

    $csrf || $errors[] = "There is no token for this account.  You have most likely timed out.";
    ($isCustomer || $isCorporate) || $errors[] = "You are not authenticated as a customer.";
    $session || $errors[] = "You do not have a session identifier.";

    if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf) {
        $errors[] = "You do not have permission to perform that action.";
    }
    $userData = new StdClass;
    $userData->session = $session;

    $modelObjects = new StdClass;
    $modelObjects->init = $init;
    if (empty($errors)) {
        $controller = new DestroySessionController($modelObjects, $userData);
        $controller->destroySession();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do something else
        }
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
