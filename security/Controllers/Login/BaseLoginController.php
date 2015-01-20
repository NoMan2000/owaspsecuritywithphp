<?php

namespace security\Controllers\Login;

include_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\Login\CustomerLogin;
use \security\Models\RedisSingleton;
use \security\Models\Authenticator\BlackLister;
use \PDO;
use \JsonSerializable;
use \Redis;
use \SplObjectStorage;
use \StdClass;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;

abstract class BaseLoginController implements JsonSerializable
{
    protected $redis;
    protected $pdo;
    protected $blackList;
    protected $errorRunner;
    protected $logger;

    public function __construct(SplObjectStorage $storage)
    {
        $this->switchObject($storage);
    }
    public function switchObject(SplObjectStorage $storage)
    {
        $storage->rewind();
        while($storage->valid()) {
            $object = $storage->current(); 
            $data = $storage->getInfo();
            $this->storageInitializers($object, $data);
            $storage->next();
        }
    }
    protected function storageInitializers($object, $objectName)
    {
        switch($objectName) {
            case 'modelObjects':
                $pdo = (isset($object->pdo) && is_object($object->pdo) && $object->pdo instanceof PDO) ? 
                    $object->pdo : $this->setDefaultPDO();
                $errorRunner = (isset($object->errorRunner) && is_object($object->errorRunner) && $object->errorRunner instanceof ErrorRunner) ?
                    $object->errorRunner : $this->setDefaultErrorRunner();
                $redis = (isset($object->redis) && is_object($object->redis) && $object->redis instanceof Redis) ? 
                    $object->redis : $this->setDefaultRedis();
                $blackList = (isset($object->blackList) && is_object($object->blackList) && $object->blackList instanceof BlackLister) ? 
                    $object->blackList : $this->setDefaultBlackLister();
                $logger = (isset($object->logger) && is_object($object->logger) && $object->logger instanceof FullLogInterface) ? 
                    $object->logger : $this->setDefaultLogger();
                $this->setPDO($pdo)
                     ->setErrorRunner($errorRunner)
                     ->setRedis($redis)
                     ->setBlackLister($blackList)
                     ->setLogger($logger);
                break;
        }
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