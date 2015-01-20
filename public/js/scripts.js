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
/*global $, jQuery, alert, Spinner, swal, confirm */

(function securityMain() {
    'use strict';
    var isOverflowed = function isOverflowed(element) {
        if (element.length <= 0) {
            // console.warn("No element exists here.");
        }
        return element.scrollHeight > element.clientHeight || element.scrollWidth > element.clientWidth;
    };
    window.isOverflowed = window.isOverflowed || isOverflowed;
    var spinner = window.spinner || {},
        Spinner = window.Spinner || {},
        startSpinner = function () {
            spinner = new Spinner({
                lines: 12, // The number of lines to draw
                length: 7, // The length of each line
                width: 5, // The line thickness
                radius: 10, // The radius of the inner circle
                color: '#000', // #rbg or #rrggbb
                speed: 1, // Rounds per second
                trail: 100, // Afterglow percentage
                shadow: true // Whether to render a shadow
            }).spin(document.getElementById("ajaxContentHolder"));
        $('#ajaxContentHolder').show();
    },
    stopSpinner = function () {
        spinner.stop();
        $('#ajaxContentHolder').hide();
    },
    isValidJSON = function isValidJSON(data) {
        if (String(data).length === 0) {
            return false;
        }
        try {
            var o = JSON.parse(data);     
            // if o checks for null, empty, or undefined.
            // typeof object and not instanceof array makes sure it's an object and not an array.
            // the error checker does the rest.
            if (o && typeof o === "object" && !(o instanceof Array)) {
                return true;
            }
        } catch (e) {
          return false;
        }
        return false;
    },
    BeginSweetAlert = {
        genericConfirm : function (args) {
            args = args || {};
            this.title = args.title || "Are you sure?";
            this.text = args.text || "This is a destructive modification!";
            this.type = args.type || "warning";
            this.showCancel = args.showCancel !== undefined ? args.showCancel : true;
            this.closeOnConfirm = args.closeOnConfirm !== undefined ? args.closeOnConfirm : true;
            this.closeOnCancel = args.closeOnCancel !== undefined ? args.closeOnCancel : true;
            this.confirmButtonClass = args.confirmButtonClass !== undefined ? args.confirmButtonClass : "btn-danger";
            this.message = args.message !== undefined ? args.message : "Are you sure?";
            this.allowOutsideClick = args.allowOutsideClick !== undefined ? args.allowOutsideClick : true;
            this.cancel = args.cancel !== undefined ? args.cancel : "Cancel!";
            this.isConfirmed = undefined;
            this.callback = args.callback !== undefined ? args.callback : null;
            this.successCallback = args.successCallback !== undefined ? args.successCallback : null;
            this.failCallback = args.failCallback !== undefined ? args.failCallback : null;
            // Setting up three potential callbacks, an always called 'callback', 
            // a success callback, and a failed callback.
            var that = this;
            swal({
                title: that.title,
                text: that.text,
                type: that.type,
                showCancelButton: that.showCancel,
                confirmButtonClass: that.confirmButtonClass,
                confirmButtonText: that.message,
                cancelButtonText: that.cancel,
                closeOnConfirm: that.closeOnConfirm,
                closeOnCancel: that.closeOnCancel,
                allowOutsideClick: that.allowOutsideClick
            },
                function (isConfirm) {
                    if (isConfirm) {
                        if (that.successCallback && typeof(that.successCallback) === "function") {
                            that.successCallback();
                        }
                    } else{
                        if (that.failCallback && typeof(that.failCallback) === 'function') {
                            that.failCallback();
                        }
                    }
                    if (that.callback && typeof(that.callback) === 'function') {
                        that.callback();
                    }
                    return isConfirm;
                });
        }
    },    // End BeginSweetAlert
        setErrorMessage = function (errorMessage) {
            $('#errorHolder').show();
            $('#errorContent').html(errorMessage).addClass('state-error');
        },
        hideErrorMessage = function () {
            $('.state-error').removeClass('state-error');
            $('#errorContent').text('');
            $('#errorHolder').hide();
        },
        setSuccessMessage = function (successMessage) {
            $('#successHolder').show();
            $('#successContent').html(successMessage).addClass('state-success');
        },
        hideSuccessMessage = function () {
            $('#successHolder').hide();
            $('#successContent').html('');
            $('.state-success').removeClass('state-success');
        };
    window.BeginSweetAlert = BeginSweetAlert;
    window.isValidJSON = isValidJSON;
    window.setErrorMessage = setErrorMessage;
    window.hideErrorMessage = hideErrorMessage;
    window.setSuccessMessage = setSuccessMessage;
    window.hideSuccessMessage = hideSuccessMessage;

   $(document).on('ajaxStart', startSpinner).on('ajaxStop', stopSpinner);

}());
