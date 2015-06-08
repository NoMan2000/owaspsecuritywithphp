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
(function corporatelogin(global, $) {
    $("#indexForm").on('submit', function(e){
        e.preventDefault();
        hideErrorMessage();
        hideSuccessMessage();
        var userName = $("#inputUserName").val(),
            password = $("#password").val(),
            redirectPath = $("#redirectPath").val();
        $.ajax({
             url: CookieFunctions.reroutePath,
             type: "POST",
             data: {
                 "to": "Controllers/Login/BadCorporateLoginController.php",
                 "action": "verifyLogin",
                 "isAjax": true,
                 "userName": userName,
                 "password": password,
                 "submit": true
             }
        }).done(function (data, textStatus, jqXHR) {
            var data = JSON.parse(data),
                id;
            if (data) {
                id = data.id;
            }
            window.location.href = CookieFunctions.rootPath + redirectPath + id;
        }).fail(function (jqXHR, textStatus, errorThrown){
            var errorMessage = $.trim(jqXHR.responseText);
            setErrorMessage(errorMessage);

        });

    });

}(window, jQuery));
