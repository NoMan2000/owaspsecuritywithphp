<?php

namespace security\Traits;

trait AbsolutePaths
{
    public $rootPath;

    public function isServerSecure()
    {
        $https = getservbyname('https', 'tcp');
        if ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') || $_SERVER['SERVER_PORT'] == $https) {
            return true;
        }
        return false;
    }
    public function fullPath()
    {
        if ($this->isServerSecure()) {
            $http_protocol = 'https://';
        } else {
            $http_protocol = 'http://';
        }
        if (stristr($_SERVER['SERVER_SOFTWARE'], 'Apache') !== false) {
            $request_url = apache_getenv("HTTP_HOST");
            $this->setRootPath($http_protocol . $request_url . DIRECTORY_SEPARATOR);
        } else {
            $this->longCreationFromServer();
        }

    }
    protected function setRootPath($path)
    {
        $this->rootPath = $path;
    }
    protected function longCreationFromServer()
    {
        $http_serverName = $_SERVER['SERVER_NAME'];
        $httpFull = $http_protocol . $http_serverName;
        $serverPort = $_SERVER['SERVER_PORT'];
        $http_serverName .= ":$serverPort";
        $httpFull = $http_protocol . $http_serverName . '/';
        // Note that if you are using certain balancers or forwardings, this may not work.
        // In that case, use $_SERVER['HTTP_X_FORWARDED_HOST']
        $this->setRootPath($httpFull);
    }

}
