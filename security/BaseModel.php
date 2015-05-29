<?php

namespace security;

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \stdClass;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \security\Traits\IsDevelopment;
use \JsonSerializable;

abstract class BaseModel implements JsonSerializable
{
    use IsDevelopment;
    protected $redis;
    protected $pdo;
    protected $blackList;
    protected $errorRunner;
    protected $logger;
    protected $data;

    public function __construct(stdClass $models)
    {
        $this->setObjects($models);
    }
    protected function setObjects($models)
    {
        isset($models->pdo) && $models->pdo instanceof PDO ?
            $this->setPDO($models->pdo) :
            $this->setDefaultPDO();
        isset($models->redis) && $models->redis instanceof Redis ?
            $this->setRedis($models->redis) :
            $this->setDefaultRedis();
        isset($models->blackList) && $models->blackList instanceof BlackLister ?
            $this->setBlackLister($models->blackList) :
            $this->setDefaultBlackLister();
        isset($models->errorRunner) && $models->errorRunner instanceof ErrorRunner ?
            $this->setErrorRunner($models->errorRunner) :
            $this->setDefaultErrorRunner();
        isset($models->logger) && $models->logger instanceof FullLogInterface ?
            $this->setLogger($models->logger) :
            $this->setDefaultLogger();
    }

    protected function setDefaultPDO()
    {
        $this->pdo = new PDOSingleton();
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
        $this->logger = new FullLog(__FILE__);
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