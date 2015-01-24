(function indexCallBack(global, $) {
    $("#indexForm").on('submit', function(e){
        e.preventDefault();
        hideErrorMessage();
        hideSuccessMessage();
        var userName = $("#inputUserName").val(),
            password = $("#password").val();
        $.ajax({
             url: CookieFunctions.reroutePath,
             type: "POST",
             data: {
                 "to": "Controllers/Login/CustomerLoginController.php",
                 "action": "verifyLogin",
                 "isAjax": true,
                 "userName": userName,
                 "password": password
             }
        }).done(function (data, textStatus, jqXHR){
            var testJSON = isValidJSON(data);
            if (testJSON) {
                window.location.href= CookieFunctions.rootPath + "badsite/customers/vieworders.php";
            }
            setSuccessMessage("You have successfully logged in!");
            
        }).fail(function (jqXHR, textStatus, errorThrown){
            var errorMessage = $.trim(jqXHR.responseText);
            setErrorMessage(errorMessage);
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        });
        
    });
    
}(window, jQuery));