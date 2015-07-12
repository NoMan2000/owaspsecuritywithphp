<?php

namespace security\Traits;

trait AbsolutePaths
{
    public $rootPath;

    public function isServerSecure()
    {
        // Some of these settings are Apache 2.4 specific.
        // Checks for https on the server and aginst the load
        // balancer.
        $httpsPort = intval(getservbyname('https', 'tcp'));
        $requestSchemeHttps = isset($_SERVER['REQUEST_SCHEME']) ?
        $_SERVER['REQUEST_SCHEME'] === "https" : null;
        $serverHttps = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off');
        $serverPortSecure = isset($_SERVER['SERVER_PORT']) ?
        $httpsPort === $_SERVER['SERVER_PORT'] : null;
        $forwardHttps = isset($_SERVER['HTTP_X_FORWARDED_PORT']) ?
        $_SERVER['HTTP_X_FORWARDED_PORT'] === 'https' : null;
        $forwardProtocolHttps = isset($_SERVER['HTTP_X_FORWARDED_PROTO']) ?
        $_SERVER['HTTP_X_FORWARDED_PROTO'] === "https" : null;
        if (
            $requestSchemeHttps ||
            $serverHttps ||
            $serverPortSecure ||
            $forwardHttps ||
            $forwardProtocolHttps
        ) {
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
    public function getRootPath()
    {
        return $this->rootPath;
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
