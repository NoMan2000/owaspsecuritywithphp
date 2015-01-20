<?php

require_once("../partials/header.php");

// Very bad.
// Never accept raw user input.
$userName = isset($_POST['inputUserName']) ? $_POST['inputUserName'] : null;
$password = isset($_POST['password']) ? $_POST['password'] : null;
$errors[] = isset($_GET['errors']) ? htmlentities($_GET['errors']) : null;

use \Redis;
use \security\Models\MySQLISingleton;
use \security\Interfaces\CustomerType;

$mysqli = new MySQLISingleton();
if (isset($_POST['submit'])) {
    $userExists = null;
    $sql = "SELECT id, username, password FROM customers WHERE username = '$userName'
            AND plainpassword = '$password'";
    $result = $mysqli->query($sql) 
        or $errors[] = $mysqli->error . ' on ' . __LINE__ . ' in ' . __FILE__;
    $isObj = is_object($result);
    while ($isObj && $result->fetch_assoc()) {
        $_SESSION['customerid'] = $row['id'];
        $_SESSION['isauthenticated'] = true;
        $_SESSION['customerType'] = CustomerType::CUSTOMER;
    }
    if (!$isObj || !$result) {
        $errors[] = "Invalid password";
        $sql = "SELECT id, username, password FROM customers WHERE username = '$userName'";
        $result = $mysqli->query($sql) 
            or $errors[] = $mysqli->error . ' on ' . __LINE__ . ' in ' . __FILE__;
        $isObj = is_object($result);
        while ($isObj && $result->fetch_assoc()) {
            $userExists = true;
        }
        if (!$userExists) {
            $errors[] = "No user with that name exists!";
        }
    }
}
if (isset($_SESSION['isauthenticated'])) {
    header("Location: customers/vieworders.php");
}
?>
<header>
    <img src='../images/widgetCorp.png' alt='Widget Corp' id='headerImage'/>
</header>
    <section class="container-fluid row">
    
    <div id='content' class='clearfix col-xs-12 
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <?php if (!empty($errors)) {?>
            <div id='errorHolder' class="alert alert-danger" role="alert">
            <div id='errorContent'>
                <?php foreach($errors as $error) {
                    echo $error . "<br/>";
                }?>
                </div>
            </div>
        <?php } ?>
        
      <form class="form-signin form-horizontal" id='indexForm'
        role="form" method='POST' 
        action='#' novalidate='novalidate'>
        <h1 class="form-signin-heading text-center">Welcome to Widget Corp!</h1>
        <?php include_once('../partials/widgetBlurb.php');?>
        <h4 class='contentText'>Please sign in if you have a customer account.  Corporate Customers sign in through the 
        <a href='corporate/corporatelogin.php'>corporate account</a>.</h4>
        <div class="form-group">
            <label for="inputUserName" class="col-sm-2 control-label">Username:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputUserName' id="inputUserName" class="form-control" 
                placeholder="Your username" required="" autofocus="" autocomplete="off" value='<?=$userName;?>'>
            </div>
        </div>
       
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='password' id="password" class="form-control" 
                placeholder="Password" required="" autocomplete="off" value='<?= $password;?>'>
            </div>
        </div>
        <button class="btn btn-lg btn-primary center-block" 
        name='submit'
        type="submit">Sign in</button>
      </form>
        
        <div id='noAccount' class=''>
            <br style='margin-top:15px;' />
            <div class="list-group lighten">
                <a href='corporate/corporatelogin.php' class="list-group-item text-center text-uppercase text-info">
                    Existing Corporate Users
                </a>
                <a href='customers/createNewCustomer.php' class="list-group-item text-center text-uppercase text-info">
                    New Customer sign-up form
                </a>
                <a href='corporate/newsignup.php' class="list-group-item text-center text-uppercase text-info">
                    New Corporate sign-up form
                </a>
                <a href='customers/contactUs.php' class="list-group-item text-center text-uppercase text-info">
                    Contact us
                </a>
                
            </div><!-- End list Group -->
        </div> <!-- end noAccount -->
    </div><!-- End content -->
</section>

<?php 
    require_once("../partials/footer.php"); 
?>

<!--<script type="text/javascript" src="js/index.js"></script>-->
</body>
</html>