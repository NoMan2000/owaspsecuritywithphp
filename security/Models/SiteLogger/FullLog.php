<?php
namespace security\Models\SiteLogger;

use \Exception;
use \Monolog\Logger;
use \Monolog\Handler\StreamHandler;
use \DateTime;
use \security\Interfaces\FullLogInterface;

// Extract to an interface.
class FullLog implements FullLogInterface
{
    private $path = "/home/ubuntu/workspace/logs/session.log";
    public $logger;
    
    public function __construct($name = null, $path = null, $logger = null, $default = false)
    {
        $this->path = isset($path) && !is_null($path) ? $path : $this->path;
        if (!file_exists($this->path)) {
            touch($this->path);
        }
        $date = new DateTime();
        $date = $date->format(DateTime::RFC850);
        $this->name = "Activities at $date";
        if (!is_null($name)) {
            $this->name = $name;
        }
        if (!is_null($path)) {
            $this->path = $path;
        }
        $this->logger = isset($logger) && is_object($logger) && $logger instanceof FullLogInterface ? 
            $this->setLogger($logger) : $this->setDefaultLogger();
        if ($default) {
            $this->serverData();
        }
    }
    public function setLogger(FullLogInterface $logger) 
    {
        return $logger;
    }
    public function getLogger()
    {
        return $this->logger;
    }
    public function setDefaultLogger()
    {
        $log = new Logger($this->name);
        $log->pushHandler(new StreamHandler($this->path, Logger::INFO));
        return $log;
    }
    public function serverData()
    {
        $logger = $this->logger;
        $request = '';
        
        foreach(getallheaders() as $key => $value) {
            $request .= "[$key:$value], " . PHP_EOL;
        }
        $request .= "[{$_SERVER['SCRIPT_FILENAME']}], " . PHP_EOL;
        $request .= "[{$_SERVER['REQUEST_METHOD']}], " . PHP_EOL;
        $request .= "[{$_SERVER['QUERY_STRING']}], " . PHP_EOL;
        $request .= "[{$_SERVER['REQUEST_URI']}], " . PHP_EOL;
        $logger->addInfo($request);
    }
    public function addDebug($data)
    {
        $this->logger->addDebug($data);
    }
    public function addInfo($data) 
    {
        $this->logger->addInfo($data);
    }
    public function addNotice($data)
    {
        $this->logger->addNotice($data);
    }
    public function addWarning($data)
    {
        $this->logger->addWarning($data);
    }
    public function addError($data)
    {
        $this->logger->addError($data);
    }
    public function addCritical($data)
    {
        $this->logger->addCritical($data);
    }
    public function addAlert($data)
    {
        $this->logger->addAlert($data);
    }
    public function addEmergency($data)
    {
        $this->logger->addEmergency($data);
    }
}
   