/*jslint
browser: true,
couch: false,
devel: false,
node: false,
rhino: false,
passfail: false,
ass: false,
bitwise: false,
closure: true,
continue: false,
debug: true,
eqeq: false,
evil: false,
forin: false,
newcap: false,
nomen: false,
plusplus: false,
regexp: false,
unparam: false,
sloppy: false,
stupid: false,
sub: false,
todo: true,
vars: true,
white: false
*/
/*global $, jQuery, alert, Spinner, swal, CookieFunctions, isValidJSON, 
setErrorMessage, setSuccessMessage, hideErrorMessage, hideSuccessMessage
confirm */

(function customerEdit(){
    $("#customerEditForm").on("submit", function submitEditForm(e){
        $(".has-error").removeClass("has-error");
       var username = $("#inputUserName").val(),
           csrf = $("#csrf").val(),
           usernameOriginal = $("#inputUserName").attr("data-original"),
           password = $("#originalPassword").val(),
           newpassword = $("#newPassword").val(),
           newpasswordConfirm = $("#newPasswordConfirm").val(),
           email = $("#inputEmail").val(),
           originalEmail = $("#inputEmail").attr('data-original'),
           address = $("#inputAddress").val(),
           originalAddress = $("#inputAddress").attr('data-original'),
           phone = $("#inputPhone").val(),
           originalPhone = $("#inputPhone").attr("data-original"),
           instructions = $("#inputInstructions").val(),
           originalInstructions = $("#inputInstructions").attr("data-original"),
           errors = [],
           error = '',
           i,
           action = $("[data-action]").attr("data-action"),
           errorLength;
        e.preventDefault();
        hideErrorMessage();
        
        // The unused variables are a toin-coss.  You can check whether or not any variables have 
        // been changed and only submit if there has been a change.  
        
        if (username.length === 0) {
            errors.push("No username was supplied.");
            $("#inputUserName").parents('.form-group').addClass('has-error');
        }
        if (email.length === 0) {
            errors.push("No email was supplied.");
            $("#inputEmail").parents('.form-group').addClass('has-error');
        }
        if (address.length === 0) {
            errors.push("No address was supplied.");
            $("#inputAddress").parents('.form-group').addClass('has-error');
        }
        if (phone.length === 0) {
            errors.push("No phone was supplied.");
            $("#inputPhone").parents('.form-group').addClass('has-error');
        }
        if (newpassword !== newpasswordConfirm) {
            errors.push("The new password and the old password must match.");
            $("#newPassword, #newPasswordConfirm").parents('.form-group').addClass('has-error');
        }
        if (newpassword.length > 0 && newpassword.length < 8) {
            errors.push("The new password must be at least 8 characters long.");
            $("#newPassword, #newPasswordConfirm").parents('.form-group').addClass('has-error');
        }
        if (newpassword.length > 0 && password.length === 0) {
            errors.push("You must fill in the old password to update the new one!");
            $("#newPassword, #newPasswordConfirm, #originalPassword").parents('.form-group').addClass('has-error');
        }
        if (!CookieFunctions.passwordStrength(newpassword)) {
            errors.push(CookieFunctions.passwordExpression);
            $("#newPassword, #newPasswordConfirm, #originalPassword").parents('.form-group').addClass('has-error');
        }
        if (csrf.length === 0) {
            errors.push("No token sent on request.");
        }
        errorLength = errors.length;
        if (errorLength > 0) {
            for (i =0; i < errorLength; i += 1) {
                error += errors[i] + "<br/>";
            }
            setErrorMessage(error);
        }
        if (errorLength === 0) {
            $.ajax({
               type: "POST",
               url: CookieFunctions.reroutePath,
               data: {
                   to: "Controllers/Customers/EditCustomerController.php",
                   isAjax: true,
                   action: "UpdateCustomer",
                   username: username,
                   password: password,
                   newpasswordConfirm: newpasswordConfirm,
                   newpassword: newpassword,
                   email: email,
                   address: address,
                   phone: phone,
                   instructions: instructions
               }
            }).done(function (data){
                var jsonResponse = isValidJSON(data);
                if (jsonResponse) {
                    JSON.parse(data, function (k, v){
                        switch(k) {
                            case 'success':
                                setSuccessMessage(v);
                                break;
                        }
                    });
                }
                console.log(data);
            }).fail(function (data){
                setErrorMessage(data.responseText);
            });
        }
    });
    $('[data-toggle="tooltip"]').tooltip({container: 'body'});
}());