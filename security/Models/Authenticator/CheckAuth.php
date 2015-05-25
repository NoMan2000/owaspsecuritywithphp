<?php

namespace security\Models\Authenticator;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;
use \Redis;
use \security\Interfaces\CustomerType;

class CheckAuth implements CustomerType
{
    protected $errors = [];
    public function __construct($logger = null, $blacklist = null, $errorRunner = null)
    {
        $logger = isset($logger) && is_object($logger) && $logger instanceof FullLogInterface ?
            $logger : $this->setDefaultLogger();
        $blacklist = isset($blacklist) && is_object($blacklist) && $blacklist instanceof BlackLister ?
            $blacklist : $this->setDefaultBlackList();
        $errorRunner = isset($errorRunner) && is_object($errorRunner) && $errorRunner instanceof ErrorRunner ? 
            $errorRunner : $this->setDefaultErrorRunner();
        $this->setBlackList($blacklist);
        $this->setErrorRunner($errorRunner);
        $this->setLogger($logger);
    }
    protected function setDefaultLogger()
    {
        return (new FullLog());
    }
    public function setLogger(FullLogInterface $logger)
    {
        $this->logger = $logger;
    }
    protected function setDefaultBlackList()
    {
        return (new BlackLister());
    }
    public function setBlackList(BlackLister $blacklist)
    {
        $this->blacklist = $blacklist;
    }
    protected function setDefaultErrorRunner()
    {
        return (new ErrorRunner());
    }
    protected function setErrorRunner(ErrorRunner $errorRunner)
    {
        $this->errorRunner = $errorRunner;
    }
    
    public function isAuth()
    {
        if (!isset($_SESSION['isauthenticated']) or !$_SESSION['isauthenticated']) {
            return false;
        }
        return true;
    }
    public function isCustomer()
    {
        $isAuth = $this->isAuth();
        $customerID = isset($_SESSION['customerType']) ? $_SESSION['customerType'] : null;
        if (!$isAuth || $customerID !== CustomerType::CUSTOMER) {
            $this->logger->addWarning("This customer was not authenticated.");
            return false;
        }
        return true;
    }
    public function isCorporate()
    {
        $isAuth = $this->isAuth();
        $customerID = isset($_SESSION['customerType']) ? $_SESSION['customerType'] : null;
        if (!$isAuth || $customerID !== CustomerType::CORPORATE) {
            $this->logger->addWarning("This corporate user was not authenticated.");
            return false;
        }
        return true;
    }
    public function isGroup()
    {
        $isAuth = $this->isAuth();
        $customerID = isset($_SESSION['customerType']) ? $_SESSION['customerType'] : null;
        if (!$isAuth || $customerID !== CustomerType::GROUP) {
            $this->logger->addWarning("This corporate user was not authenticated.");
            return false;
        }
        return true;
    }
}