(function indexCallBack(global, $) {
    $("#indexForm").on('submit', function(e) {
        e.preventDefault();
        hideErrorMessage();
        hideSuccessMessage();
        var userName = $("#inputUserName").val(),
            csrf = $("#csrf").val(),
            honeypot = $("#email").val(),
            password = $("#password").val();

        if (honeypot.length > 0) {
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
                "password": password
            }
        }).done(function(data, textStatus, jqXHR) {
            debugger;
            var testJSON = isValidJSON(data);
            if (testJSON) {
                window.location.href = CookieFunctions.rootPath + "goodsite/customers/vieworders.php";
            }
            setSuccessMessage("You have successfully logged in!");

        }).fail(function(jqXHR, textStatus, errorThrown) {
            var errorMessage = $.trim(jqXHR.responseText);
            setErrorMessage(errorMessage);
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        });

    });

}(window, jQuery));
