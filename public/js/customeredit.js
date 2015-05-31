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
/*global $, jQuery, alert, Spinner, swal, CookieFunctions, isValidJSON,
setErrorMessage, setSuccessMessage, hideErrorMessage, hideSuccessMessage
confirm */

(function customerEdit(global, doc, $) {
    doc.gID = doc.getElementById.bind(doc);
    doc.gClass = doc.getElementsByClassName.bind(doc);
    doc.QSA = doc.querySelectorAll.bind(doc);
    doc.QS = doc.querySelector.bind(doc);
    var EditForm = {
        get username() {
            return doc.gID("inputUserName").value;
        },
        get defaultUsername() {
            return doc.gID("inputUserName").defaultValue;
        },
        get csrf() {
            return doc.gID("csrf").value;
        },
        get password() {
            return doc.gID("originalPassword").value;
        },
        get newpassword() {
            return doc.gID("newPassword").value;
        },
        get newpasswordConfirm() {
            return doc.gID("newPasswordConfirm").value;
        },
        get email() {
            return doc.gID("inputEmail").value;
        },
        get defaultEmail() {
            return doc.gID("inputEmail").defaultValue;
        },
        get address() {
            return doc.gID("inputAddress").value;
        },
        get defaultAddress() {
            return doc.gID("inputAddress").defaultValue;
        },
        get phone() {
            return doc.gID("inputPhone").value;
        },
        get defaultPhone() {
            return doc.gID("inputPhone").defaultValue;
        },
        get instructions() {
            return doc.gID("inputInstructions").value;
        },
        get defaultInstructions() {
            return doc.gID("inputInstructions").defaultValue;
        },
        get city() {
            return doc.gID("inputCity").value;
        },
        get defaultCity() {
            return doc.gID("inputCity").defaultValue;
        },
        get state() {
            return doc.gID("inputState").value;
        },
        get defaultState() {
            return doc.gID("inputState").defaultValue;
        },
        get countryCode() {
            return doc.gID("inputCountryCode").value;
        },
        get defaultCountryCode() {
            return doc.gID("inputCountryCode").defaultValue;
        },
        get zip() {
            return doc.gID("inputZip").value;
        },
        get defaultZip() {
            return doc.gID("inputZip").defaultValue;
        },
        hasChanged: function hasChanged() {
            if (this.username !== this.defaultUsername ||
                this.email !== this.defaultEmail ||
                this.address !== this.defaultAddress ||
                this.phone !== this.defaultPhone ||
                this.instructions !== this.defaultInstructions ||
                this.city !== this.defaultCity ||
                this.state !== this.defaultState ||
                this.countryCode !== this.defaultCountryCode ||
                this.zip !== this.defaultZip) {
                return true;
            }
            setErrorMessage("Nothing changed.");
            return false;
        },
        hasErrors: function hasErrors() {
            var errors = [],
                error = "",
                i,
                errorLength;
            if (!this.username) {
                errors.push("No username was supplied.");
                $("#inputUserName").parents(".form-group").addClass("has-error");
            }
            if (!this.email) {
                errors.push("No email was supplied.");
                $("#inputEmail").parents(".form-group").addClass("has-error");
            }
            if (!this.address) {
                errors.push("No address was supplied.");
                $("#inputAddress").parents(".form-group").addClass("has-error");
            }
            if (!this.phone) {
                errors.push("No phone was supplied.");
                $("#inputPhone").parents(".form-group").addClass("has-error");
            }
            if (this.newpassword !== this.newpasswordConfirm) {
                errors.push("The new password and the old password must match.");
                $("#newPassword, #newPasswordConfirm").parents(".form-group").addClass("has-error");
            }
            if (this.newpassword.length > 0 && this.newpassword.length < 8) {
                errors.push("The new password must be at least 8 characters long.");
                $("#newPassword, #newPasswordConfirm").parents(".form-group").addClass("has-error");
            }
            if (this.newpassword.length > 0 && !this.password) {
                errors.push("You must fill in the old password to update the new one!");
                $("#newPassword, #newPasswordConfirm, #originalPassword").parents(".form-group").addClass("has-error");
            }
            if (this.newpassword && !CookieFunctions.passwordStrength(this.newpassword)) {
                errors.push(CookieFunctions.passwordExpression);
                $("#newPassword, #newPasswordConfirm, #originalPassword").parents(".form-group").addClass("has-error");
            }
            if (!this.csrf) {
                errors.push("No token sent on request.");
            }
            if (!this.city) {
                $("#inputCity").parents(".form-group").addClass("has-error");
                errors.push("No city sent over.");
            }
            if (!this.state) {
                $("#inputState").parents(".form-group").addClass("has-error");
                errors.push("No state sent over.");
            }
            if (!this.countryCode) {
                $("#inputCountryCode").parents(".form-group").addClass("has-error");
                errors.push("No country code sent over.");
            }
            if (!this.zip) {
                $("#inputZip").parents(".form-group").addClass("has-error");
                errors.push("No zip sent over.");
            }
            errorLength = errors.length;
            if (errorLength > 0) {
                for (i = 0; i < errorLength; i += 1) {
                    error += errors[i] + "<br/>";
                }
                setErrorMessage(error);
                return true;
            }
            return false;
        }
    };

    $("#customerEditForm").on("submit", function submitEditForm(e) {
        $(".has-error").removeClass("has-error");
        e.preventDefault();
        hideErrorMessage();
        if (EditForm.hasChanged() && !EditForm.hasErrors()) {
            $.ajax({
                type: "POST",
                url: CookieFunctions.reroutePath,
                data: {
                    to: "Controllers/Customers/EditCustomerController.php",
                    isAjax: true,
                    action: "UpdateCustomer",
                    username: EditForm.username,
                    password: EditForm.password,
                    newpasswordConfirm: EditForm.newpasswordConfirm,
                    newpassword: EditForm.newpassword,
                    email: EditForm.email,
                    address: EditForm.address,
                    phone: EditForm.phone,
                    city: EditForm.city,
                    state: EditForm.state,
                    countryCode: EditForm.countryCode,
                    zip: EditForm.zip,
                    csrf: EditForm.csrf,
                    instructions: EditForm.instructions
                }
            }).done(function(data) {
                var jsonResponse = isValidJSON(data);
                if (jsonResponse) {
                    JSON.parse(data, function(k, v) {
                        switch (k) {
                            case "success":
                                setSuccessMessage(v);
                                break;
                        }
                    });
                }
            }).fail(function(data) {
                setErrorMessage(data.responseText);
            });
        }
    });
    $("[data-toggle='tooltip']").tooltip({
        container: "body"
    });
}(window, document, jQuery));
