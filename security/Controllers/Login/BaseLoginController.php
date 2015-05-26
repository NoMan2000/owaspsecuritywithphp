<?php

namespace security\Controllers\Login;

include_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php';

use \JsonSerializable;
use \PDO;
use \Redis;
use \stdClass;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;

abstract class BaseLoginController implements JsonSerializable
{
    protected $redis;
    protected $pdo;
    protected $blackList;
    protected $errorRunner;
    protected $logger;

    public function __construct(stdClass $models)
    {
        $this->setObjects($models);
    }
    protected function setObjects($models)
    {
        isset()
        isset($models->redis) && $models->redis instanceof Redis ?
            $models->setRedis($models->redis) :
            $this->setDefaultRedis();
    }

    protected function setDefaultPDO()
    {
        return (new PDOSingleton());
    }
    protected function setDefaultRedis()
    {
        return (new RedisSingleton());
    }
    protected function setDefaultBlackLister()
    {
        return (new BlackLister());
    }
    protected function setDefaultErrorRunner()
    {
        return (new ErrorRunner());
    }
    protected function setDefaultLogger()
    {
        return (new FullLog(__FILE__));
    }
    public function setPDO(PDO $pdo)
    {
        $this->pdo = $pdo;
        return $this;
    }
    public function setRedis(Redis $redis)
    {
        $this->redis = $redis;
        return $this;
    }
    public function setBlackLister(BlackLister $blackList)
    {
        $this->blackList = $blackList;
        return $this;
    }
    public function setErrorRunner(ErrorRunner $errorRunner)
    {
        $this->errorRunner = $errorRunner;
        return $this;
    }
    public function setLogger(FullLogInterface $logger)
    {
        $this->logger = $logger;
        return $this;
    }

    public function setAction($action)
    {
        $this->action = $action;
        return $this;
    }
    /**
     * Declaring a particular function abstract means that the child/subclass must override the parent class.
     * It also cannot contain a body for implementation.
     */
    abstract public function executeAction();

    public function jsonSerialize()
    {
        return $this->jsonObject;
    }
}
