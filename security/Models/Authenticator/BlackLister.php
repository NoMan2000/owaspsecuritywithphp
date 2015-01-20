<?php

namespace security\Models\Authenticator;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

use \security\Interfaces\Seconds;
use \Redis;
use \security\Models\RedisSingleton;
use \security\Traits\IsDevelopment;

class BlackLister implements Seconds
{
    use IsDevelopment;
    public $IP = [];
    private $banCount = 20;
    private $redis;

    public function __construct($redisInstance = null)
    {
        $redis = isset($redisInstance) && is_object($redisInstance) && $redisInstance instanceof Redis ?
            $redisInstance : $this->setDefaultRedis();
        $this->setRedis($redis);
    }
    protected function setDefaultRedis()
    {
        return (new RedisSingleton());
    }
    protected function setRedis(Redis $redis)
    {
        $this->redis = $redis;
    }
    public function getIpAddress()
    {
        // $ipOne is easy to spoof.
        $ipOne   = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : null;
        // $ipTwo is also spoofable.
        $ipTwo   = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : null;
        // $ipThree is also spoofable in theory, but not easy to do.
        $ipThree = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : null;
        if (!is_null($ipOne) && $ipOne !== $ipThree) {
            $this->IP[] = $ipOne;
        }
        if (!is_null($ipTwo) && $ipOne !== $ipTwo) {
            $this->IP[] = $ipTwo;
        }
        if (!is_null($ipThree) && $ipThree !== $ipOne && $ipThree !== $ipTwo) {
            $this->IP[] = $ipThree;
        }
        return $this;
    }
    public function blackList()
    {
        $redis = $this->redis;
        $this->getIpAddress();
        $ipNumber = 0;
        foreach($this->IP as $ipBan) {
            $redis->incrBy("BANIP:{$ipBan}", 1);
            $redis->expire("BANIP:{$ipBan}", Seconds::DAY);
            $ipNumber = $ipNumber > $redis->get("BANIP:{$ipBan}") ? $ipNumber : $redis->get("BANIP:{$ipBan}");
        }
        if ($ipNumber > 25) {
            $ipNumber = 25;
        }
        if ($this->isDev()) {
            echo "We are sleeping for $ipNumber seconds.";
        }
        sleep($ipNumber);
        return $this;
    }
    public function setSleeper($key, $value = null)
    {
        $value = $value || 1;
        $sleep = $this->redis->incrBy($key, $value);
        if ($sleep > 25) {
            $sleep = 25;
        }
        sleep($sleep);
        return $sleep;
    }
    public function getSleeper($key)
    {
        return $this->redis->get($key);
    }
    public function removeSleeper($key)
    {
        $this->redis->del($key);
    }

    public function removeBlackList()
    {
        $redis = $this->redis;
        $this->getIpAddress();
        foreach($this->IP as $ipBan) {
            $redis->set("BANIP:{$ipBan}", 0);
        }
        return $this;
    }
    public function isBlackListed()
    {
        // This is not the best way to deal with the problem.  Hackers use Botnets or change Tor Exit Nodes 
        // to mask their activity.  Banning an IP only works on the most basic of attacks.
        $this->getIpAddress();
        $redis = $this->redis;
        foreach($this->IP as $ip) {
            $ban = $redis->get("BANIP:{$ip}");
            if ($ban > $this->banCount) {
                return true;
            }
        }
        return false;
    }
}