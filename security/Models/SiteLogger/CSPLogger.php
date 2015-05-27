<?php

namespace security\Models\SiteLogger;

// Modified from Source code nelmio:
// https://github.com/nelmio/NelmioSecurityBundle/blob/master/Controller/ContentSecurityPolicyController.php

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Interfaces\FullLogInterface;
use \security\Models\SiteLogger\FullLog;

class CSPLogger
{
    protected $logger;
    private $path;
    private $data = [];
    public function __construct($json, $logger = null, $path = null)
    {
        $this->path = dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . "logs/csp.log";
        if ($path) {
            $this->path = $path;
        }
        if (!file_exists($this->path)) {
            touch($this->path);
            chmod($this->path, 0660);
        }
        $logger = isset($logger) && is_object($logger) && $logger instanceof FullLogInterface ?
            $logger : $this->setDefaultLogger();
        $this->logger = $logger;
        $this->setReport($json);
    }

    protected function setDefaultLogger()
    {
        return (new FullLog("CSP Report:", $this->path));
    }

    public function setReport($json)
    {
        if (empty($json)) {
            $this->logger->addNotice('Content-Security-Policy called without data');
            return $this->data[] = [
                'statusCode'=>411,
                'message'=>'No report data sent?'
            ];
        }
        $csp = json_decode($json, true);
        if ($csp === null) {
            $this->logger->addNotice('Content-Security-Policy Endpoint called with invalid JSON data');
            return $this->data[] = [
                'statusCode'=>400,
                'message'=>'Invalid JSON data supplied?'
            ];
        }
        $csp = json_encode($csp, JSON_UNESCAPED_UNICODE);
        $this->logger->addNotice("Content-Security-Policy Violation Reported:$csp");
        return $this->data[] = [
            'statusCode'=>204,
            'message'=>'Violation Successfully logged.'
        ];
    }
}
