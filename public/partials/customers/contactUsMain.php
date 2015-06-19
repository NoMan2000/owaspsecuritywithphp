<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";
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
        <?=$resultList;?>
        <?=$userList;?>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <?=$errorList;?>
        <h1 class="form-signin-heading text-center">Contact Widget Corp Form</h1>
        <form class="form-signin form-horizontal" id='checkUsersForm'
            name='checkUsersForm'
            role="form" method='POST'
            action='<?=$self;?>' novalidate='novalidate'>
            <fieldset style='margin-top:1.5rem;margin-bottom:1.5rem;'>
                <legend>Check Users</legend>
                <div class="form-group">
                    <label for="usersSearch" class="col-sm-2 control-label">Search Existing Users:</label>
                    <div class='col-sm-10'>
                        <input type="text" name='usersSearch' id="usersSearch" class="form-control"
                        placeholder="Search to see if your desired name is taken" required="" autofocus="" autocomplete="off"
                        data-original=''
                        value=''>
                    </div>
                </div>
                <div class='col-sm-offset-2'>
                    <button type='submit' name='submitUsers' id='submitUsers' class='btn btn-primary'>
                    Check User List
                    </button>
                </div>

            </fieldset>
        </form>
        <form class="form-signin form-horizontal" id='contactUsForm'
            name='contactUsForm'
            role="form" method='POST'
            action='<?=$self;?>' novalidate='novalidate'
            enctype="multipart/form-data">
            <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
            <fieldset>
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
                <input type="hidden" id='MAX_FILE_SIZE' name="MAX_FILE_SIZE" value="<?=$max;?>">
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
                <button class="btn btn-lg btn-primary center-block"
                id='submit' name='submit' type="submit">Contact Us</button>
                <p>&nbsp;</p>
            </fieldset>
        </form>
    </div><!-- End content -->
</section>
