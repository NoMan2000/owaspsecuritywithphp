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

(function customerViewOrders(){
    'use strict';
    var hasConfirm = function hasConfirm(e, obj) {
        hideErrorMessage();
        hideSuccessMessage();
        obj = obj || {}; 
        var $el = $(this),
            message = $el.attr('data-confirm'),
            dataId = $el.attr('data-id'),
            dataUnfulfilled = $el.attr('data-unfulfilled'),
            csrf = $('#csrf').val(),
            confirmButtonClass = 'btn-danger';
        
        obj.message = message;
        obj.text = "You will delete order number " + dataId + " which has " + dataUnfulfilled + " items in it.";
        obj.confirmButtonClass = confirmButtonClass;
        obj.successCallback = function () {
            $.ajax({
               url: CookieFunctions.reroutePath,
               type: "POST",
               data: {
                   to: "Controllers/Customers/RemoveOrderController.php",
                   isAjax: true,
                   action: "removeOrder",
                   csrf: csrf,
                   id: dataId
               }
            }).done(function (data){
                var jsonResponse = isValidJSON(data);
                if (jsonResponse) {
                    JSON.parse(data, function (k, v){
                        switch(k) {
                            case 'numberRemoved':
                                setSuccessMessage(v);
                                break;
                            case 'id':
                                var $removeID = $("#"+v);
                                $($removeID).fadeOut(2000, function() {
                                    ($removeID).remove();
                                });
                                break;
                        }
                    });
                }
                console.log(data);
            }).fail(function (data){
                setErrorMessage(data.responseText);
            }).always(function(a,b,c){
                
            });  
        };
        e.preventDefault();
        BeginSweetAlert.genericConfirm(obj);
        },
        clickAddNewOrder = function clickAddNewOrder(e){
            e.preventDefault();
            $("#showOrder").show();
            $("#createNewOrder").fadeOut('slow');
        },
        addNewOrder = function addNewOrder(e) {
            hideErrorMessage();
            e.preventDefault();
            var totalOrdered = $("#newOrder").val(),
                csrf = $('#csrf').val();
            if (!totalOrdered || totalOrdered < 0) {
                setErrorMessage("Must have a value greater than 0.");
                return false;
            }
            $.ajax({
               type: "POST",
               url: CookieFunctions.reroutePath,
               data : {
                   to: "Controllers/Customers/AddNewOrderController.php",
                   isAjax: true,
                   action: "addOrder",
                   csrf: csrf,
                   totalOrdered: totalOrdered
               }
            }).done(function (data, textStatus, jqXHR){
                var jsonResponse = isValidJSON(data),
                        section, fulfilled, unfulfilled, button, dataID, dataFulfilled, dataUnfulfilled, full;
                console.log(jqXHR);
                if (jsonResponse) {
                    JSON.parse(data, function (k, v) {
                        switch(k) {
                            case 'numberAdded':
                                setSuccessMessage(v);
                                break;
                            case 'id':
                                dataID = v;
                                section = "<section id='"+ v + "' style='display:none;' class='animateHidden'>" + 
                                "<div class='col-sm-3'>" + v + "</div>";
                                break;
                            case 'fulfilled':
                                dataFulfilled = v;
                                fulfilled = "<div class='col-sm-3'>" + v +
                                "</div>";
                                break;
                            case 'unfulfilled':
                                dataUnfulfilled = v;
                                unfulfilled = "<div class='col-sm-3'>" + v + 
                                "</div>";
                                break;
                        }
                    });
                    button = '<div class="col-sm-3">' +
                    '<button type="button" class="btn btn-danger" data-confirm="Delete the order?" data-id="'+ dataID + 
                    '" data-unfulfilled="' + dataUnfulfilled + '">Delete Order</button></div></section>';
                    full = section + fulfilled + unfulfilled + button;
                }
                if (full) {
                    $("#customerBody").prepend(full);
                    $('.animateHidden').fadeIn(1500);
                }
                console.log(data);
                console.log(textStatus);
                console.log(jqXHR);
            }).fail(function (data){
                console.log(data);
                setErrorMessage(data.responseText);
            });
            
        },
        logout = function logout(e) {
            var csrf = $('#csrf').val();
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: CookieFunctions.reroutePath,
                data : {
                   to: "Controllers/Customers/DestroySessionController.php",
                   isAjax: true,
                   csrf: csrf,
                   action: "destroySession"
               }
            }).done(function (data, textStatus, jqXHR){
                var jsonResponse = isValidJSON(data);
                if (jsonResponse) {
                    JSON.parse(data, function (k, v) {
                        switch(k) {
                            case 'loggedout':
                                setSuccessMessage("You have logged out the system");
                                break;
                        }
                    });
                    setTimeout(function() {
                        window.location.href = CookieFunctions.rootPath + 'public/goodsite/index.php';
                    }, 1500);
                }
                console.log(data);
                console.log(textStatus);
                console.log(jqXHR);
            }).fail(function (data){
                console.log(data);
                setErrorMessage(data.responseText);
            });  
        };
    
    $('#content').off('click.hasConfirm').on('click.hasConfirm', '[data-confirm]', hasConfirm)
                 .on('click.addNewOrder', '#createNewOrder', clickAddNewOrder)
                 .on('submit.addNewOrder', 'form#addNewOrder', addNewOrder);
    $("#sessionLogout").on('click.sessionLogout', logout);
}());