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

(function customerCreate() {
    'use strict';
    // File Input niceness taken from http://www.abeautifulsite.net/whipping-file-inputs-into-shape-with-bootstrap-3/
    // Modified for multiple file uploads, and AJAX uploads
    var formData = new FormData(),
        fileSelectEvent = function fileSelectEvent(event, numFiles, labels) {
            var i = 0,
                errorExists,
                labelName = '';
            for (i; i < numFiles; i += 1) {
                labelName += labels[i] + "<br/>";
            }
            errorExists = $(".bg-danger").length > 0 ? true : false;
            console.log(errorExists);
            console.log(labelName);
            $("#fileUploadNames").remove();
            if (!errorExists) {
                formData.append('numFiles', numFiles);
                $("#fileUploadMessages").append("<p id='fileUploadNames'><b>The following files will be uploaded:</b> <br/>"+labelName+"</p>");
            }
            if (errorExists) {
                $("#fileUploadMessages").append("<p id='fileUploadNames'><b class='badName'>No files will be uploaded until the error is fixed:</b> <br/>"+
                labelName+"</p>");
                $(".badName").addClass('text-danger');
            }
        },
        setFilesSelector = function setFilesSelector() {
            var $input = $(this),
                input = this,
                numFiles,
                labels,
                fileHolder,
                size,
                name,
                difference,
                errorHolder,
                maxSize = $("[name='MAX_FILE_SIZE']").val(),
                i;
            console.dir(input);
            errorHolder = false;
            labels = fileHolder = [];
            size, difference, i = 0;
            numFiles = $input.get(0).files ? $input.get(0).files.length : 1;
            console.log(errorHolder);
            console.log(numFiles);
            for (i; i < numFiles; i += 1) {
                name = $input.get(0).files[i].name;
                size = $input.get(0).files[i].size;
                if (size > maxSize) {
                    difference = size - maxSize;
                    labels.push("<span class='badName'>" + name + " is at size " + size + " which is greater than " + maxSize + 
                    " by " + difference + " bytes.</span>");
                    $(".bg-info").removeClass("bg-info").addClass('bg-danger');
                    errorHolder = true;
                    break;
                }
                if (size <= maxSize) {
                    labels.push(name);
                    fileHolder['file'+i] = input.files[i];
                }
            }
            console.log(errorHolder);
            console.log(formData);
            if (errorHolder === false) {
                formData = new FormData();
                for (i = 0; i < fileHolder.length; i += 1) {
                    formData.append('file'+i, fileHolder['file'+i]);
                }
                $(".badName").remove();
                $(".bg-danger").removeClass("bg-danger").addClass('bg-info');
            }
            if (labels.length > 0) {
                $input.trigger('fileselect', [labels.length, labels]);
            }
        },
        testRepeatClicks = function testRepeatClicks() {
            var d = new Date(),
                lastVisited = localStorage.getItem('lastVisited'),
                potentialAbuse = localStorage.getItem('potentialAbuse'),
                now = d.getTime(),
                twoMinutes = 120000,
                previousVisit;
            if (!lastVisited) {
                localStorage.setItem('lastVisited', now);
            } else {
                previousVisit = now - lastVisited;
                if (previousVisit < twoMinutes) {
                    if (!potentialAbuse) {
                        potentialAbuse = 0;
                    }
                    potentialAbuse += 1;
                    localStorage.setItem('potentialAbuse', potentialAbuse);
                }
            }
            if (potentialAbuse > 10) {
                throw new Error("You have hit this submit form too many times.");
            }
        },
        submitEditForm = function submitEditForm(e) {
           $(".has-error").removeClass("has-error");
           hideErrorMessage();
           hideSuccessMessage();
           var username = $("#inputUserName").val(),
               newpassword = $("#newPassword").val(),
               newpasswordConfirm = $("#newPasswordConfirm").val(),
               email = $("#inputEmail").val(),
               address = $("#inputAddress").val(),
               phone = $("#inputPhone").val(),
               instructions = $("#inputInstructions").val(),
               stop = $("#inputStop").val(),
               errors = [],
               potentialAbuse = localStorage.getItem('potentialAbuse'),
               error = '',
               i,
               regex = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/,
               goodRegEx,
               MAX_FILE_SIZE = $("#MAX_FILE_SIZE").val(),
               hasFiles = $("#filename").get(0).files.length,
               errorLength;
            // Find out what dataID is and add instructions to the list.
            e.preventDefault();
            testRepeatClicks();
            if (stop) {
                return false;
            }
            
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
                goodRegEx = regex.test(newpassword);
                if (!goodRegEx) {
                    errors.push("You must include two uppercase and two lowercase letters.  You must have two digits or special characters as well");
                }
                errors.push("The new password must be at least 8 characters long.");
                $("#newPassword, #newPasswordConfirm").parents('.form-group').addClass('has-error');
            }
            if (hasFiles > 0) {
                formData.append('upload', true);
                formData.append('MAX_FILE_SIZE', MAX_FILE_SIZE);
            }
    
            errorLength = errors.length;
            if (errorLength > 0) {
                for (i =0; i < errorLength; i += 1) {
                    error += errors[i] + "<br/>";
                }
                setErrorMessage(error);
            }
            if (errorLength === 0) {
                formData.append('username', username);
                formData.append('password', newpassword);
                formData.append('email', email);
                formData.append('address', address);
                formData.append('email', email);
                formData.append('address', address);
                formData.append('phone', phone);
                formData.append('instructions', instructions);
                formData.append('to', "Controllers/Customers/AddNewCustomerController.php");
                formData.append('isAjax', true);
                formData.append('potentialAbuse', potentialAbuse);
                formData.append('action', "addNewCustomer");
                console.log(formData);
                $.ajax({
                   url: CookieFunctions.reroutePath,
                   type: "POST",
                   data: formData,
                   processData: false,  // tell jQuery not to process the data
                   contentType: false   // tell jQuery not to set contentType
                }).done(function (data, textStatus, jqXHR){
                    var jsonResponse = isValidJSON(data),
                        message = '';
                    console.log(jqXHR);
                    if (jsonResponse) {
                        JSON.parse(data, function (k, v){
                            switch(k) {
                                case 'success':
                                    message += v + "<br/>";
                                    break;
                                case 'uploadResults':
                                    message += v + "<br/>";
                                    break;
                            }
                        });
                        setSuccessMessage(message);
                        console.log(data);
                    }
                    if (!jsonResponse) {
                        console.log(data);
                        console.log("That didn't work.");
                    }
                    
                }).fail(function (data){
                    setErrorMessage(data.responseText);
                }); 
            }
        }; 

    $("#customerEditForm").on("submit", submitEditForm);
    $(document).on('change', '.btn-file :file', setFilesSelector);
    $('.btn-file :file').on('fileselect', fileSelectEvent);
    $('[data-toggle="tooltip"]').tooltip({container: 'body'});
}());

