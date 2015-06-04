<div class="form-group">
            <label for="inputUserName" class="col-sm-2 control-label">Username:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputUserName' id="inputUserName" class="form-control"
                placeholder="Your new username" required="" autofocus="" autocomplete="off"
                value='<?=$username;?>'>
            </div>
        </div>
    <?php
        if ($hasPassword) {
    ?>
        <div class="form-group">
            <label for="originalPassword" class="col-sm-2 control-label">Original Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='originalPassword' id="originalPassword" class="form-control"
                placeholder="old Password" autocomplete="off" value=''>
            </div>
        </div>
    <?php } ?>

        <div class="form-group">
            <label for="newPassword" class="col-sm-2 control-label">New Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='newPassword' id="newPassword" class="form-control"
                placeholder="New Password" autocomplete="off" value=''
                data-toggle="tooltip" data-placement="right"
                title="Must be at least 8 characters, two uppercase, two lowercase, two special characters or numbers."
                >
            </div>
        </div>

        <div class="form-group">
            <label for="newPasswordConfirm" class="col-sm-2 control-label">Confirm New Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='newPasswordConfirm' id="newPasswordConfirm" class="form-control"
                placeholder="Confirm New Password" autocomplete="off" value=''>
            </div>
        </div>

        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">Email:</label>
            <div class='col-sm-10'>
                <input type="email" name='inputEmail' id="inputEmail" class="form-control"
                placeholder="Your Email address" required="" autocomplete="off"
                value='<?=$email;?>'>
            </div>
        </div>

        <div class="form-group">
            <label for="inputAddress" class="col-sm-2 control-label">Address:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputAddress' id="inputAddress" class="form-control"
                placeholder="Your Email address" required="" autocomplete="off"
                value='<?=$address;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPhone" class="col-sm-2 control-label">Phone:</label>
            <div class='col-sm-10'>
                <input type="tel" name='inputPhone' id="inputPhone" class="form-control"
                placeholder="Your Phone Number" required="" autocomplete="off"
                value='<?=$phone;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputCity" class="col-sm-2 control-label">City:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputCity' id="inputCity" class="form-control"
                placeholder="Your City" required="" autocomplete="off"
                value='<?=$city;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputState" class="col-sm-2 control-label">State:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputState' id="inputState" class="form-control"
                placeholder="Your State" required="" autocomplete="off"
                value='<?=$state;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputCountryCode" class="col-sm-2 control-label">CountryCode:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputCountryCode' id="inputCountryCode" class="form-control"
                placeholder="Your Country Code" required="" autocomplete="off"
                value='<?=$countrycode;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputZip" class="col-sm-2 control-label">Zip:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputZip' id="inputZip" class="form-control"
                placeholder="Your Zip" required="" autocomplete="off"
                value='<?=$zip;?>'>
            </div>
        </div>


        <div class="form-group">
            <label for="inputInstructions" class="col-sm-2 control-label">Instructions:</label>
            <div class='col-sm-10'>
                <textarea name="inputInstructions" id='inputInstructions' class='form-control'
                style='resize:vertical;'/><?=trim($instructions);?></textarea>
            </div>
            <!-- Whitespace in textarea is very common, so it has to be inlined. -->
        </div>
