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
vars: false,
white: false
*/
/*global $, window, document, jQuery, alert, Spinner, swal, confirm, hideErrorMessage, hideSuccessMessage, CookieFunctions, setSuccessMessage,
setErrorMessage, BeginSweetAlert, isValidJSON*/

(function customerViewOrders(global, doc, $) {
    "use strict";
    doc.gID = doc.getElementById.bind(doc);
    doc.gClass = doc.getElementsByClassName.bind(doc);
    doc.QSA = doc.querySelectorAll.bind(doc);
    doc.QS = doc.querySelector.bind(doc);
    var Order = Object.create(null, {
        "id": {
            get: function () {
                return Number(doc.gID("inputOrderID").value);
            }
        },
        "csrf": {
            get: function () {
                return doc.gID("csrf").value;
            }
        },
        "fulfilled": {
            get: function () {
                return Number(doc.gID("inputFulfilled").value);
            }
        },
        "unfulfilled": {
            get: function () {
                return Number(doc.gID("inputUnfulfilled").value);
            }
        },
        "isShipped": {
            get: function () {
                return doc.gID("inputIsShipped").checked ? 1 : 0;
            }
        }
    }),
        submitEdits = function submitEdits(e) {
            e.preventDefault();
            $.ajax({
                url: CookieFunctions.reroutePath,
                type: "POST",
                data: {
                    "to": "Controllers/Corporate/CorporateEditOrderController.php",
                    "isAjax": true,
                    "id": Order.id,
                    "csrf": Order.csrf,
                    "fulfilled": Order.fulfilled,
                    "unfulfilled": Order.unfulfilled,
                    "isShipped": Order.isShipped
                }
            }).done(function (data) {

            }).fail(function (jqXHR) {

            });
        };
    $("#updateOrderForm").off("submit.updateOrderForm")
                         .on("submit.updateOrderForm", submitEdits);

}(window, document, jQuery));
