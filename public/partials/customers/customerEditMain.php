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

      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST'
        action='../../jsHelper/reroute.php' novalidate='novalidate'>
        <input type='hidden' id='csrf' name='csrf' value='<?=$_SESSION['csrf_token'];?>' />
        <input type='hidden' name='to' id='to' value='Controllers/Customers/EditCustomerController.php' />
        <h1 class="form-signin-heading text-center">Customer edit form</h1>
        <h4 class='textContent'><?=$username;?></h4>
        <input type='hidden' name='actionType' id='actionType' data-action='updateCustomer' />
        <?php require_once __DIR__ . DIRECTORY_SEPARATOR . 'customerEditInputs.php';?>
        <button class="btn btn-lg btn-primary center-block" type="submit">Change info</button>
        <p>&nbsp;</p>
      </form>
    </div><!-- End content -->
</section>
