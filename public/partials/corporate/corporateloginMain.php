<header>
    <img src='../../images/widgetCorp.png' alt='Widget Corp' id='headerImage'/>
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
        <?=$errorList;?>

      <form class="form-signin form-horizontal" id='indexForm'
        role="form" method='POST'
        action='#' novalidate='novalidate'>
        <input type='hidden' id='csrf' name='csrf' value='<?=$_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Welcome to Widget Corp!</h1>
        <p class='contentText'><?=$shakespeare->ipsum;?></p>
        <h4 class='contentText'>Please sign in if you have a Corporate account. Customers sign in through the
        <a href='../index.php'>customer account</a>.</h4>
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
                placeholder="Password" required="" autocomplete="off" value='<?=$password;?>'>
            </div>
        </div>
        <input type='text' id='honeypot' style='display:none;' />
        <button class="btn btn-lg btn-primary center-block" type="submit">Sign in</button>
      </form>

        <div id='noAccount' class=''>
            <br style='margin-top:15px;' />
            <div class="list-group lighten">
                <a href='../index.php' class="list-group-item text-center text-uppercase text-info">
                    Existing Customers
                </a>
                <a href='../customers/createNewCustomer.php' class="list-group-item text-center text-uppercase text-info">
                    New Customer sign-up form
                </a>
                <a href='newsignup.php' class="list-group-item text-center text-uppercase text-info">
                    New Corporate sign-up form
                </a>

            </div><!-- End list Group -->
        </div> <!-- end noAccount -->
    </div><!-- End content -->
</section>
