<?php
namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'public/init.php';

use \ErrorException;
use \security\Exceptions\CompileErrorException;
use \security\Exceptions\CompileWarningException;
use \security\Exceptions\CoreErrorException;
use \security\Exceptions\CoreWarningException;
use \security\Exceptions\DeprecatedException;
use \security\Exceptions\NoticeException;
use \security\Exceptions\ParseException;
use \security\Exceptions\RecoverableErrorException;
use \security\Exceptions\StrictException;
use \security\Exceptions\UserDeprecatedException;
use \security\Exceptions\UserErrorException;
use \security\Exceptions\UserNoticeException;
use \security\Exceptions\UserWarningException;
use \security\Exceptions\WarningException;
use \security\Interfaces\FullLogInterface;
use \security\Models\ErrorRunner;

class Inits
{
    protected $errors = [];
    public function __construct(ErrorRunner $errorRunner, FullLogInterface $logger)
    {
        // This is used to compress output, but it can cause errors during debugging
        // if output is sent before compression.
        // ini_set("zlib.output_compression", "On");
        ob_start();
        date_default_timezone_set('America/Chicago');
        mb_internal_encoding('UTF-8');
        mb_http_output('UTF-8');
        // These are better to set as defaults in php.ini, but here for inclusion.
        // They help make the session hash stronger and introduce more bits into data.
        ini_set('default_charset', 'utf-8');
        register_shutdown_function(array($this, 'shutdownNotify'));
        // Sending headers in the command line will cause problems.
        // This converts all errors to Exceptions automatically.
        set_error_handler([$this, 'errorHandler']);

        if (PHP_SAPI !== 'cli') {
            $this->sendHeaders();
        }
        $this->errorRunner = $errorRunner;
        $this->logger = $logger;
    }

    protected function sendHeaders()
    {
        // A nonce policy is a special policy that you can attach to an inline script to allow it to run.
        $nonce = "nonce-{$_SESSION['csrf_token']}";
        $childSrc = "'self' https:";
        $connectSrc = "'self' https:";
        $fontSrc = "'self' data: https:";
        $mediaSrc = "'self'";
        $objectSrc = '*';
        $imgSrc = "'self' data: https:";
        $styleSrc = "'self' 'unsafe-inline' https: data:";
        $scriptSrc = "'self' https:";
        $defaultSrc = "'self' https:";
        // $frameSrc is marked as deprecated.
        // $frameSrc = "'self' *.qbaka.net *.googleapis.com *.gstatic.com";
        $reportUri = "report-uri /logger/report.php";
        $serverName = isset($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'] : null;
        header("Access-Control-Allow-Origin: https://{$serverName}");

        header("Strict-Transport-Security: max-age=31536000; includeSubDomains; preload");

        // These four settings can open up your app to attacks.
        // header("Access-Control-Allow-Origin: *");
        // header("Access-Control-Allow-Credentials: true");
        // header("Access-Control-Allow-Methods: GET, POST");
        // header("Access-Control-Allow-Headers: Content-Type, *");
        header('X-XSS-Protection: 1');
        header('X-Content-Type-Options: nosniff');
        header("Content-Security-Policy: default-src $defaultSrc; img-src $imgSrc; script-src $scriptSrc; child-src $childSrc; style-src $styleSrc; font-src $fontSrc; connect-src $connectSrc; media-src $mediaSrc; $reportUri");
        header('Content-Type: text/html; charset=UTF-8');
    }

    protected function getEmailAddressForAdmins()
    {
        $emails = [
            'admin@example.com' => 'Main Admin',
            'backupadmin@example.com' => 'Backup Admin',
        ];
        return $emails;
    }
    public function shutdownNotify()
    {
        $error = error_get_last();
        $logger = $this->logger;
        if (!empty($error) && in_array($error['type'], array(E_ERROR, E_USER_ERROR))) {
            echo '<h1>Sorry, something went wrong. The team has been notified.</h1>';

            $errorPath = dirname(dirname(__DIR__)) . "Shutdownerrors.log";
            if (!file_exists($errorPath)) {
                touch($errorPath);
            }
            $fromEmail = ini_get('sendmail_from') ? ini_get('sendmail_from') : "admin@example.com";
            $fromName = "From: Example Webmaster";
            $to = "webmaster@example.com";
            $serverName = isset($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'] : null;
            $subject = "[{$serverName}] Fatal error in {$error['file']} on line {$error['line']}";
            $message = var_export($error, true) . PHP_EOL;
            $message .= var_export($_SERVER, true) . PHP_EOL;
            $logger->addWarning($message);

            // Extract this to a class and refactor to an interface.
            // $transport = Swift_MailTransport::newInstance();
            // $mailer = Swift_Mailer::newInstance($transport);
            // $message = Swift_Message::newInstance()
            //     ->setSubject($subject)
            //     ->setFrom(array($fromEmail => $fromName))
            //     ->setTo($to)
            //     ->setBody($message);
            //->setReturnPath($fromEmail);
            if (!mail($to, $subject, $message, $fromName)) {
                $this->errors[] = "Unable to send message";
                $this->errorRunner->runErrors($this->errors);
            }
        } // End not empty error
    }
    public function errorHandler($err_severity, $err_msg, $err_file, $err_line, array $err_context)
    {
        //See: http://php.net/manual/en/function.set-error-handler.php#112881

        // error was suppressed with the @-operator
        if (error_reporting() === 0) {
            return false;
        }
        // Returning false will resume normal operations, if you want to lessen the error level, return
        // false on an error instead of throwing an exception.
        switch ($err_severity) {
            case E_ERROR:
                throw new ErrorException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_WARNING:
                throw new WarningException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_PARSE:
                throw new ParseException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_NOTICE:
                throw new NoticeException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_CORE_ERROR:
                throw new CoreErrorException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_CORE_WARNING:
                throw new CoreWarningException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_COMPILE_ERROR:
                throw new CompileErrorException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_COMPILE_WARNING:
                throw new CompileWarningException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_USER_ERROR:
                throw new UserErrorException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_USER_WARNING:
                throw new UserWarningException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_USER_NOTICE:
                throw new UserNoticeException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_STRICT:
                throw new StrictException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_RECOVERABLE_ERROR:
                throw new RecoverableErrorException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_DEPRECATED:
                throw new DeprecatedException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
            case E_USER_DEPRECATED:
                throw new UserDeprecatedException($err_msg, 0, $err_severity, $err_file, $err_line);
                break;
        }
    }
}
