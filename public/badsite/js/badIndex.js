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
(function indexCallBack(global, $) {
    'use strict';
    var submitForm = function submitForm (e){
        e.preventDefault();
        hideErrorMessage();
        hideSuccessMessage();
        var userName = $("#inputUserName").val(),
            password = $("#password").val();
        $.ajax({
             url: CookieFunctions.reroutePath,
             type: "GET",
             data: {
                 "to": "Controllers/Login/BadCustomerLoginController.php",
                 "action": "verifyLogin",
                 "isAjax": true,
                 "userName": userName,
                 "password": password,
                 "submit": true
             }
        }).done(function (data, textStatus, jqXHR){
            var testJSON = isValidJSON(data),
                userid;
            if (testJSON) {
                userid = data.userid;
                setSuccessMessage("You have successfully logged in!");
                window.setTimeout(function relocation(){
                    window.location.href = CookieFunctions.rootPath + "badsite/customers/badvieworders.php?id=" + userid;
                }, 750);
            }
            if (!testJSON) {
                setErrorMessage(data);
            }
        }).fail(function (jqXHR, textStatus, errorThrown){
            var errorMessage = $.trim(jqXHR.responseText);
            setErrorMessage(errorMessage);
        });
    };
    $("#indexForm").on('submit', submitForm);

}(window, jQuery));
