<?php
use \security\Models\FileUploader\FileUploader;
?>
<section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'>

            </div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <?=$errorList;?>

      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST'
        action='<?=$_SERVER['PHP_SELF'];?>' novalidate='novalidate'
        enctype="multipart/form-data">
        <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Create Customer form</h1>
        <h4 class='textContent'>Create new customer:</h4>

        <?php require_once 'customerEditInputs.php';?>

        <input type="hidden" id='MAX_FILE_SIZE' name="MAX_FILE_SIZE" value="<?php echo $max;?>">
        <div class='col-sm-10 col-sm-offset-2 bg-info' id='fileUploadMessages'>
        <h3>Special Upload Instructions:</h3>
        <p>If you have a long list of instructions you need to upload, you can do so here.</p>
        <p>Up to <?=$_SESSION['maxfiles'];?> files can be uploaded simultaneously.</p>
        <p>Each file should be no more than <?=FileUploader::convertFromBytes($max);?>.</p>
        <p>Combined total should not exceed <?=$_SESSION['displaymax'];?>.</p>
        <p>&nbsp;</p>
        </div>
        <div class="form-group">
            <label for="filename" class="col-sm-2 control-label">Select Files:</label>
            <span class='file-input btn btn-default btn-file' style='margin-top:1rem;margin-left:1rem;'>
            <input type="file" class='' name="filename[]" id="filename" multiple
            data-maxfiles="<?=$_SESSION['maxfiles'];?>"
            data-postmax="<?=$_SESSION['postmax'];?>"
            data-displaymax="<?=$_SESSION['displaymax'];?>">
            Choose Files for Upload.
            </span>
            <div class='col-sm-7'></div>
        </div>
        <button class="btn btn-lg btn-primary center-block" type="submit">Create new Customer</button>
        <p>&nbsp;</p>

      </form>
    </div><!-- End content -->
</section>
