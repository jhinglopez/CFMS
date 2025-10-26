var account_changepassword = {

    fnSave: function () {
        var _oldPassword = $("#txtOldPassword").val();
        var _newPassword = $("#txtNewPassword").val();
        if (_oldPassword.trim() == "") {
            helpers.fnModal("Save failed. Old password is a required field.", "error");
        }
        else if (_newPassword.trim() == "") {
            helpers.fnModal("Save failed. New password is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/Account/UpdatePassword",
                data: {
                    oldPassword: _oldPassword,
                    newPassword: _newPassword
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The new password has been saved successfully. Please login again.", "callback", account_changepassword.fnLogoff);
                    }
                    else {
                        helpers.fnModal(result, "error");
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    helpers.fnModal("There has been an internal script error that unable to save the record. Please try it again later.", "error");
                }
            });
        }
    },

    fnLogoff: function () {
        window.location.href = window.location.origin + "/Account/LogOff";
    }

};

$(function () {

    $("#btnSave").on("click", function () {
        account_changepassword.fnSave();
    });

});