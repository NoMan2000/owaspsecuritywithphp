<?php

namespace security\Controllers\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \stdClass;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;

abstract class BaseLogin
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
}
