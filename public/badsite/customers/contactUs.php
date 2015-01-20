<?php

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/header.php");

use \security\Models\Authenticator\CheckAuth;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \Monolog\Logger;
use \Monolog\Handler\StreamHandler;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\PDOSingleton;
use \security\Models\MySQLISingleton;
use \security\Controllers\Customers\InitCustomerController;
use \PDO;
use \RecursiveArrayIterator;
use \RecursiveIteratorIterator;
use \security\Models\FileUploader\FileUploader;
use \security\Exceptions\FolderException;
use \Swift_MailTransport;
use \Swift_Mailer;
use \Swift_Message;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new Monolog\Logger('Customer Create Form');
$pdo = new PDOSingleton();
$mysqli = new MySQLISingleton();

$_SESSION['maxfiles'] = ini_get('max_file_uploads');
$_SESSION['postmax'] = FileUploader::convertToBytes(ini_get('post_max_size'));
$_SESSION['displaymax'] = FileUploader::convertFromBytes($_SESSION['postmax']);

$max = 200 * 1024;
$errors = $usersExist = [];
if (isset($_POST['submit'])) {
    $usersExist['users'] = [];
    
    $username = isset($_POST['inputUsername']) ? $_POST['inputUsername'] : null;
    $email = isset($_POST['inputEmail']) ? $_POST['inputEmail'] : null;
    $name = isset($_POST['inputName']) ? $_POST['inputName'] : null;
    $subject = isset($_POST['inputSubject']) ? $_POST['inputSubject'] : null;
    $message = isset($_POST['inputMessage']) ? $_POST['inputMessage'] : null;
    
    $usersSearch = isset($_POST['usersSearch']) ? $_POST['usersSearch'] : null;
    
    if ($email && $subject && $message && $name) {
        $to = ini_get('sendmail_from') ? ini_get('sendmail_from') : "admin@example.com";
        // $to = ['admin@example.com' => 'Main Admin'];
        // $transport = Swift_MailTransport::newInstance();
        // $mailer = Swift_Mailer::newInstance($transport);
        // $message = Swift_Message::newInstance()
        //     ->setSubject($subject)
        //     ->setFrom(array($email => $name))
        //     ->setTo($to)
        //     ->setBody($message)
        //     ->setReturnPath($fromEmail);
        $headers = "From: $email";
        $send = mail($to, $subject, $message, $headers);
        
        if (!$send) {
            $errors[] = "Unable to send message because: $send";
        }
    } 
    
    
    if ($usersSearch) {
        $query = "SELECT username FROM customers WHERE username = '$usersSearch'";
        $result = $mysqli->query($query) 
            or $errors[] = $mysqli->error . ' on ' . __LINE__;
        $isObj = is_object($result);
        while ($isObj && $row = $result->fetch_assoc()) {
            $usersExist['users'][] = $row;
        }
    } 
    
    if (isset($_FILES) && !empty($_FILES['filename'])) {
        $destination = '/home/ubuntu/workspace/public/uploads/';
        try {
        	$upload = new FileUploader($destination);
        	$upload->setMaxSize($max);
        	$upload->allowAllTypes();
        	$upload->setNotTrusted();
        	$upload->upload();
        	$results = $upload->getMessages();
        } catch (FolderException $e) {
        	$errors[] = $e->getMessage();
        }
    }
    $fileError = error_get_last();
    if (!empty($fileError)) {
        $errors[] = $error['message'];
    }
}

?>


<section class="container-fluid row">
    
    <div id='content' class='clearfix col-xs-12 
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'>
                
            </div>
        </div>
        <?php 
            if (!empty($results)) {
                $resultsIterator = new RecursiveArrayIterator($results);
                foreach (new RecursiveIteratorIterator($resultsIterator) as $result) {
        ?>
            <div class="alert alert-success" role="alert">
                    <?= $result; ?>
            </div> 
            <?php    }
            }
        ?>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <?php if (!empty($errors)) {
            foreach($errors as $error) {
        ?>
            <div class="alert alert-danger" role="alert">
            <div><?= $error;?></div>
            </div>
        <?php }} ?>
   
      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST' 
        action='<?= $_SERVER['PHP_SELF'];?>' novalidate='novalidate' 
        enctype="multipart/form-data">
        <input type='hidden' id='csrf' value='<?= $_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Contact Widget Corp Form</h1>
        <h4 class='textContent'>Contact Us:</h4>
        
        <div class="form-group">
            <label for="usersSearch" class="col-sm-2 control-label">Search Existing Users:</label>
            <div class='col-sm-10'>
                <input type="text" name='usersSearch' id="usersSearch" class="form-control" 
                placeholder="Search to see if your desired name is taken" required="" autofocus="" autocomplete="off" 
                data-original=''
                value=''>
            </div>
        </div>
        <?php if (isset($usersExist['users']) && !empty($usersExist['users'])) {
            $usersIterator = new RecursiveArrayIterator($usersExist['users']);
            foreach (new RecursiveIteratorIterator($usersIterator) as $users) {
        ?>
        <div class="alert alert-danger" role="alert">
            <div><?= $users;?> is already taken.</div>
            </div>
        <?php }} ?>
        <?php if (isset($usersSearch) && !empty($usersSearch) && empty($usersExist['users'])){?>
            <div class="alert alert-success" role="alert">
                    No users matching that username
            </div>   
        <?php    }
        ?>
        
        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">Email:</label>
            <div class='col-sm-10'>
                <input type="email" name='inputEmail' id="inputEmail" class="form-control" 
                placeholder="Your Email address" required="" autocomplete="off" 
                data-original=''
                value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">Your name:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputName' id="inputName" class="form-control" 
                placeholder="Your Name" required="" autocomplete="off" 
                data-original=''
                value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputSubject" class="col-sm-2 control-label">Subject:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputSubject' id="inputSubject" class="form-control" 
                placeholder="Your subject" required="" autocomplete="off" 
                data-original=''
                value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputMessage" class="col-sm-2 control-label">Message to us:</label>
            <div class='col-sm-10'>
                <textarea name="inputMessage" id='inputMessage' class='form-control' 
                data-original=''
                style='resize:vertical;'/></textarea>
            </div>
        </div>
             
        <input type="hidden" id='MAX_FILE_SIZE' name="MAX_FILE_SIZE" value="<?php echo $max;?>">
        <div class='col-sm-10 col-sm-offset-2 bg-info' id='fileUploadMessages'>
        <h3>Special Upload Instructions:</h3>
        <p>If you have a long list of instructions you need to upload, you can do so here.</p>
        <p>Up to <?php echo $_SESSION['maxfiles'];?> files can be uploaded simultaneously.</p>
        <p>Each file should be no more than <?php echo FileUploader::convertFromBytes($max);?>.</p>
        <p>Combined total should not exceed <?php echo $_SESSION['displaymax'];?>.</p>
        <p>&nbsp;</p>
        </div>
        <div class="form-group">
            <label for="filename" class="col-sm-2 control-label">Select Files:</label>
            <span class='col-sm-3 file-input btn btn-default btn-file' style='margin-top:1rem;margin-left:1rem;'>
            <input type="file" class='' name="filename[]" id="filename" multiple
            data-maxfiles="<?php echo $_SESSION['maxfiles'];?>"
            data-postmax="<?php echo $_SESSION['postmax'];?>"
            data-displaymax="<?php echo $_SESSION['displaymax'];?>">
            Choose Files for Upload.
            </span>
            <div class='col-sm-7'></div>
        </div>
        <button class="btn btn-lg btn-primary center-block" id='submit' name='submit' type="submit">Create new Customer</button>
        <p>&nbsp;</p>
        
      </form>
        

    </div><!-- End content -->
</section>
<?php 
    require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
<script type="text/javascript" src="<?=$jsPath;?>badContactDemo.js"></script>
<!--<script type="text/javascript" src="<?=$jsPath;?>customerCreate.js"></script>-->
</body>
</html>