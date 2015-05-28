<?php
namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'public/init.php';

use \security\Interfaces\Seconds;
use \security\Traits\SessionState;

class SessionInitializers implements Seconds
{
    use SessionState;
    protected $RESTART_TIMER = Seconds::HOUR;

    public function __construct()
    {
        $this->params = session_get_cookie_params();
        $this->params["secure"] = true;
        $this->params['httponly'] = true;
        // session register shutdown will call session_write_close when a die or exit is called.
        session_register_shutdown();
        session_set_cookie_params(
            $this->RESTART_TIMER,
            $this->params["path"],
            $this->params["domain"],
            $this->params["secure"],
            $this->params["httponly"]
        );
        $this->constructDefaults($this->RESTART_TIMER);
        $this->sessionRegenerator();
        if (!isset($_SESSION['csrf_token'])) {
            $this->setCSRFToken();
        }
    }
    protected function constructDefaults($RESTART_TIMER)
    {
        $params = $this->params;
        if (!isset($_SESSION['CREATED'])) {
            $_SESSION['CREATED'] = time();
        } elseif (intval(time() - $_SESSION['CREATED']) > $RESTART_TIMER) {
            $this->destroySession();
        } elseif (intval(time() - $_SESSION['CREATED']) <= $RESTART_TIMER) {
            $_SESSION['CREATED'] = time();
            /* This recaches the time so that if someone is actively using the page, it does not log them out. */
            $params = $this->params;
            setcookie(
                session_name(),
                session_id(),
                intval(time() + $RESTART_TIMER),
                $params["path"],
                $params["domain"],
                $params["secure"],
                $params["httponly"]
            );
        }
    }
    public function destroySession()
    {
        $params = $this->params;
        session_destroy();
        $_SESSION = array();
        foreach ($_COOKIE as $key => $value) {
            unset($_COOKIE[$key]);
        }
        if (ini_get("session.use_cookies")) {
            setcookie(
                session_name(),
                session_id(),
                time() - 42000,
                $params["path"],
                $params["domain"],
                $params["secure"],
                $params["httponly"]
            );
        }
    }
    protected function sessionRegenerator()
    {
        if (!isset($_SESSION['regenerateID'])) {
            $_SESSION['regenerateID'] = 0;
        }
        $_SESSION['regenerateID']++;
        if ($_SESSION['regenerateID'] === 10) {
            session_regenerate_id(true);
            $_SESSION['regenerateID'] = 0;
        }
    }

    protected function setCSRFToken()
    {
        $_SESSION['csrf_token'] = password_hash(base64_encode(openssl_random_pseudo_bytes(32)), PASSWORD_BCRYPT);
    }
}
