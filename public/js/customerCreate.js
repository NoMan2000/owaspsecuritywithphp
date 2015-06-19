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
/*global $, jQuery, window, document, alert, Spinner, localStorage, FormData, swal, CookieFunctions, isValidJSON,
setErrorMessage, setSuccessMessage, hideErrorMessage, hideSuccessMessage
confirm */

(function customerCreate(global, doc, $) {
    "use strict";
    // File Input niceness taken from http://www.abeautifulsite.net/whipping-file-inputs-into-shape-with-bootstrap-3/
    // Modified for multiple file uploads, and AJAX uploads
    var formData = new FormData(),
        fileSelectEvent = function fileSelectEvent(event, numFiles, labels) {
            var i = 0,
                errorExists,
                labelName = "";
            for (i; i < numFiles; i += 1) {
                labelName += labels[i] + "<br/>";
            }
            errorExists = $(".bg-danger").length > 0 ? true : false;
            $("#fileUploadNames").remove();
            if (!errorExists) {
                formData.append("numFiles", numFiles);
                $("#fileUploadMessages").append("<p id='fileUploadNames'><b>The following files will be uploaded:</b> <br/>" + labelName + "</p>");
            }
            if (errorExists) {
                $("#fileUploadMessages").append("<p id='fileUploadNames'><b class='badName'>No files will be uploaded until the error is fixed:</b> <br/>" +
                    labelName + "</p>");
                $(".badName").addClass("text-danger");
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
            errorHolder = false;
            labels = fileHolder = [];
            size, difference, i = 0;
            numFiles = $input.get(0).files ? $input.get(0).files.length : 1;

            for (i; i < numFiles; i += 1) {
                name = $input.get(0).files[i].name;
                size = $input.get(0).files[i].size;
                if (size > maxSize) {
                    difference = size - maxSize;
                    labels.push("<span class='badName'>" + name + " is at size " + size + " which is greater than " + maxSize +
                        " by " + difference + " bytes.</span>");
                    $(".bg-info").removeClass("bg-info").addClass("bg-danger");
                    errorHolder = true;
                    break;
                }
                if (size <= maxSize) {
                    labels.push(name);
                    fileHolder["file" + i] = input.files[i];
                }
            }

            if (errorHolder === false) {
                for (i = 0; i < fileHolder.length; i += 1) {
                    formData.append("file" + i, fileHolder["file" + i]);
                }
                $(".badName").remove();
                $(".bg-danger").removeClass("bg-danger").addClass("bg-info");
            }
            if (labels.length > 0) {
                $input.trigger("fileselect", [labels.length, labels]);
            }
        },
        testRepeatClicks = function testRepeatClicks() {
            var d = new Date(),
                lastVisited = localStorage.getItem("lastVisited"),
                potentialAbuse = localStorage.getItem("potentialAbuse"),
                now = d.getTime(),
                twoMinutes = 120000,
                previousVisit;
            if (!lastVisited) {
                localStorage.setItem("lastVisited", now);
            } else {
                previousVisit = now - lastVisited;
                if (previousVisit < twoMinutes) {
                    if (!potentialAbuse) {
                        potentialAbuse = 0;
                    }
                    potentialAbuse += 1;
                    localStorage.setItem("potentialAbuse", potentialAbuse);
                }
            }
            if (potentialAbuse > 10) {
                setErrorMessage("You have hit this submit form too many times.");
                return true;
            }
            return false;
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
                city = $("#inputCity").val(),
                state = $("#inputState").val(),
                countryCode = $("#inputCountryCode option:selected").val(),
                zip = $("#inputZip").val(),
                instructions = $("#inputInstructions").val(),
                stop = $("#inputStop").val(),
                errors = [],
                potentialAbuse = localStorage.getItem("potentialAbuse"),
                error = "",
                i,
                regex = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/,
                goodRegEx,
                emailRegex = /^[a-zA-Z0-9&#39;._%+\-]+@[a-zA-Z0-9\-][a-zA-Z0-9.\-]*\.[a-zA-Z]{2,63}$/,
                MAX_FILE_SIZE = $("#MAX_FILE_SIZE").val(),
                hasFiles = $("#filename").get(0).files.length,
                errorLength,
                repeateClicker = testRepeatClicks();
            // Find out what dataID is and add instructions to the list.
            e.preventDefault();

            if (stop || repeateClicker) {
                return false;
            }

            if (username.length === 0) {
                errors.push("No username was supplied.");
                $("#inputUserName").parents(".form-group").addClass("has-error");
            }
            if (email.length === 0) {
                errors.push("No email was supplied.");
                $("#inputEmail").parents(".form-group").addClass("has-error");
            }
            if (address.length === 0) {
                errors.push("No address was supplied.");
                $("#inputAddress").parents(".form-group").addClass("has-error");
            }
            if (phone.length === 0) {
                errors.push("No phone was supplied.");
                $("#inputPhone").parents(".form-group").addClass("has-error");
            }
            if (newpassword !== newpasswordConfirm) {
                errors.push("The new password and the old password must match.");
                $("#newPassword, #newPasswordConfirm").parents(".form-group").addClass("has-error");
            }
            if (newpassword.length > 0 && newpassword.length < 8) {
                goodRegEx = regex.test(newpassword);
                if (!goodRegEx) {
                    errors.push("You must include two uppercase and two lowercase letters.  You must have two digits or special characters as well");
                }
                errors.push("The new password must be at least 8 characters long.");
                $("#newPassword, #newPasswordConfirm").parents(".form-group").addClass("has-error");
            }
            if (email) {
                goodRegEx = emailRegex.test(email);
                if (!goodRegEx) {
                    errors.push("You need to enter a valid email address.");
                }
            }
            if (hasFiles) {
                formData.append("upload", true);
                formData.append("MAX_FILE_SIZE", MAX_FILE_SIZE);
            }

            errorLength = errors.length;
            if (errorLength > 0) {
                for (i = 0; i < errorLength; i += 1) {
                    error += errors[i] + "<br/>";
                }
                setErrorMessage(error);
            }
            if (errorLength === 0) {
                formData.append("username", username);
                formData.append("password", newpassword);
                formData.append("email", email);
                formData.append("address", address);
                formData.append("email", email);
                formData.append("address", address);
                formData.append("phone", phone);
                formData.append("instructions", instructions);
                formData.append("to", "Controllers/Customers/AddNewCustomerController.php");
                formData.append("isAjax", true);
                formData.append("potentialAbuse", potentialAbuse);
                formData.append("action", "addNewCustomer");
                formData.append("city", city);
                formData.append("state", state);
                formData.append("countryCode", countryCode);
                formData.append("zip", zip);
                formData.append("submit", true);

                $.ajax({
                    url: CookieFunctions.reroutePath,
                    type: "POST",
                    data: formData,
                    processData: false, // tell jQuery not to process the data
                    contentType: false // tell jQuery not to set contentType
                }).done(function(data, textStatus, jqXHR) {
                    var jsonResponse = isValidJSON(data),
                        message = "";
                    if (jsonResponse) {
                        JSON.parse(data, function(k, v) {
                            switch (k) {
                                case "success":
                                    message += v + "<br/>";
                                    break;
                                case "uploadResults":
                                    message += v + "<br/>";
                                    break;
                                case "info":
                                    message += v + "<br/>";
                                    break;
                            }
                        });
                        setSuccessMessage(message);
                    }
                    if (!jsonResponse) {
                        message = JSON.stringify(data);
                        setErrorMessage(message);
                    }
                }).fail(function(jqXHR) {
                    setErrorMessage(jqXHR.responseText);
                });
            }
        };

    $("#customerEditForm").on("submit", submitEditForm);
    $(document).on("change", ".btn-file :file", setFilesSelector);
    $(".btn-file :file").on("fileselect", fileSelectEvent);
    $("[data-toggle='tooltip']").tooltip({
        container: "body"
    });
}(window, document, jQuery));
