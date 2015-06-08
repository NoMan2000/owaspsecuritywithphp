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
/*global $, jQuery, alert, Spinner, qbaka */
(function indexCallBack(global, $) {
    'use strict';
    var submitForm = function(e) {
        e.preventDefault();
        hideErrorMessage();
        hideSuccessMessage();
        var userName = $("#inputUserName").val(),
            csrf = $("#csrf").val(),
            honeypot = $("#email").val(),
            password = $("#password").val();

        if (honeypot) {
            return false;
        }

        $.ajax({
            url: CookieFunctions.reroutePath,
            type: "POST",
            data: {
                "to": "Controllers/Login/CustomerLoginController.php",
                "isAjax": true,
                "userName": userName,
                csrf: csrf,
                "submit":true,
                "password": password
            }
        }).done(function(data, textStatus, jqXHR) {
            var testJSON = isValidJSON(data);
            if (testJSON) {
                window.location.href = CookieFunctions.rootPath + "goodsite/customers/vieworders.php";
            }
            setSuccessMessage("You have successfully logged in!");

        }).fail(function(jqXHR, textStatus, errorThrown) {
            var errorMessage = $.trim(jqXHR.responseText);
            setErrorMessage(errorMessage);
        });

    };
    $("#indexForm").on('submit', submitForm);

}(window, jQuery));
