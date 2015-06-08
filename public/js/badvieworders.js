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
/*global $, jQuery, alert, Spinner, swal, confirm, hideErrorMessage, hideSuccessMessage, CookieFunctions, setSuccessMessage,
setErrorMessage, BeginSweetAlert, isValidJSON*/

(function customerViewOrders() {
    'use strict';
    var hasConfirm = function hasConfirm(e, obj) {
            hideErrorMessage();
            hideSuccessMessage();
            e.preventDefault();
            obj = obj || {};
            var $el = $(this),
                message = $el.attr('data-confirm'),
                dataId = $el.attr('data-id'),
                dataUnfulfilled = $el.attr('data-unfulfilled'),
                customerID = $el.attr('data-customer'),
                confirmButtonClass = 'btn-danger';

            obj.message = message;
            obj.text = "You will delete order number " + dataId + " which has " + dataUnfulfilled + " items in it.";
            obj.confirmButtonClass = confirmButtonClass;
            obj.successCallback = function() {
                $.ajax({
                    url: CookieFunctions.reroutePath,
                    type: "POST",
                    data: {
                        to: "Controllers/Customers/BadRemoveOrderController.php",
                        isAjax: true,
                        action: "removeOrder",
                        id: dataId,
                        customerID: customerID,
                        submit: true
                    }
                }).done(function(data) {
                    var jsonResponse = isValidJSON(data);
                    if (jsonResponse) {
                        JSON.parse(data, function(k, v) {
                            switch (k) {
                            case 'numberRemoved':
                                setSuccessMessage(v);
                                break;
                            case 'id':
                                var $removeID = $("#" + v);
                                $($removeID).fadeOut(2000, function() {
                                    ($removeID).remove();
                                });
                                break;
                            }
                        });
                    }
                }).fail(function(jqXHR) {
                    setErrorMessage(jqXHR.responseText);
                });
            };
            e.preventDefault();
            BeginSweetAlert.genericConfirm(obj);
        },
        preventForm = function preventForm(e) {
            e.preventDefault();
        },
        clickAddNewOrder = function clickAddNewOrder(e) {
            e.preventDefault();
            $("#showOrder").show();
            $("#createNewOrder").fadeOut('slow');
        },
        addNewOrder = function addNewOrder(e) {
            hideErrorMessage();
            e.preventDefault();
            var totalOrdered = $("#newOrder").val(),
                csrf = $('#csrf').val(),
                customerID = $("#customerList option:selected").val() || null;
            if (!totalOrdered || totalOrdered < 0) {
                setErrorMessage("Must have a value greater than 0.");
                return false;
            }
            $.ajax({
                type: "POST",
                url: CookieFunctions.reroutePath,
                data: {
                    to: "Controllers/Customers/AddNewOrderController.php",
                    isAjax: true,
                    action: "addOrder",
                    csrf: csrf,
                    totalOrdered: totalOrdered,
                    customerID: customerID,
                    submit: true
                }
            }).done(function(data, textStatus, jqXHR) {
                var jsonResponse = isValidJSON(data),
                    html;
                if (jsonResponse) {
                    JSON.parse(data, function(k, v) {
                        switch (k) {
                            case 'numberAdded':
                                setSuccessMessage(v);
                                break;
                            case 'html':
                                html = v;
                                break;
                        }
                    });

                }
                if (html) {
                    $("#customerBody").prepend(html);
                    $('.animateHidden').fadeIn(1500);
                }

            }).fail(function(data) {
                setErrorMessage(data.responseText);
            });

        },
        logout = function logout(e) {
            var csrf = $('#csrf').val();
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: CookieFunctions.reroutePath,
                data: {
                    to: "Controllers/Customers/DestroySessionController.php",
                    isAjax: true,
                    csrf: csrf,
                    action: "destroySession",
                    submit: true
                }
            }).done(function(data, textStatus, jqXHR) {
                var jsonResponse = isValidJSON(data);
                if (jsonResponse) {
                    JSON.parse(data, function(k, v) {
                        switch (k) {
                            case 'loggedout':
                                setSuccessMessage("You have logged out the system");
                                break;
                        }
                    });
                    setTimeout(function() {
                        window.location.href = CookieFunctions.rootPath + 'goodsite/index.php';
                    }, 1500);
                }
                console.log(data);
                console.log(textStatus);
                console.log(jqXHR);
            }).fail(function(data) {
                console.log(data);
                setErrorMessage(data.responseText);
            });
        };

    $('#content').off('click.hasConfirm').on('click.hasConfirm', '[data-confirm]', hasConfirm)
        .on('click.addNewOrder', '#createNewOrder', clickAddNewOrder)
        .on('submit.addNewOrder', 'form#addNewOrder', addNewOrder)
        .on('submit.removeOrder', 'form#removeOrder', preventForm);
    $("#sessionLogout").on('click.sessionLogout', logout);
}());
