<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;
use \PDO;
use \Redis;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\AddNewCustomer;
use \security\Models\ErrorRunner;
use \security\Models\Login\PasswordVulnerable;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \security\Traits\IsDevelopment;
use \stdClass;

abstract class BaseCustomerController implements JsonSerializable
{
    use IsDevelopment;
    public function __construct(stdClass $models)
    {
        $this->models = $models;
    }
    protected function constructObjects()
    {
        isset($this->models->pdo) && $this->models->pdo instanceof PDO ?
            $this->setPDO($this->models->pdo) : $this->setDefaultPDO();
        isset($this->models->errorRunner) && $this->models->errorRunner instanceof ErrorRunner ?
            $this->setErrorRunner($this->models->errorRunner) : $this->setDefaultErrorRunner();
        isset($this->models->redis) && $this->models->redis instanceof Redis ?
            $this->setRedis($this->models->redis) : $this->setDefaultRedis();
        isset($this->models->blackList) && $this->models->blackList instanceof BlackLister ?
            $this->setBlackLister($this->models->blackList) : $this->setDefaultBlackLister();
        isset($this->models->logger) && $this->models->logger instanceof FullLogInterface ?
            $this->setLogger($this->models->logger) : $this->setDefaultLogger();
    }
    protected function setDefaultPDO()
    {
        $this->pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
    }
    protected function setDefaultRedis()
    {
        $this->redis = new RedisSingleton();
    }
    protected function setDefaultBlackLister()
    {
        $this->blackList = new BlackLister();
    }
    protected function setDefaultErrorRunner()
    {
        $this->errorRunner = new ErrorRunner();
    }
    protected function setDefaultLogger()
    {
        $this->logger = new FullLog();
    }
    public function setPDO(PDO $pdo)
    {
        $this->pdo = $pdo;
    }
    public function setRedis(Redis $redis)
    {
        $this->redis = $redis;
    }
    public function setBlackLister(BlackLister $blackList)
    {
        $this->blackList = $blackList;
    }
    public function setErrorRunner(ErrorRunner $errorRunner)
    {
        $this->errorRunner = $errorRunner;
    }
    public function setLogger(FullLogInterface $logger)
    {
        $this->logger = $logger;
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}
