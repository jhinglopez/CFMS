var users_add = {

    fnSave: function () {
        var _username = $("#txtUserName").val();
        var _fullname = $("#txtFullName").val();
        var _email = $("#txtEmail").val();
        var _password = $("#txtPassword").val();
        var _roleId = $("#txtRole").val();
        var _approver = "0";
        if ($("#chkApprover").prop("checked")) {
            _approver = "1";
        }
        if (_username.trim() == "") {
            helpers.fnModal("Save failed. Username is a required field.", "error");
        }
        else if (_fullname == "") {
            helpers.fnModal("Save failed. Fullname is a required field.", "error");
        }
        else if (_email == "") {
            helpers.fnModal("Save failed. Email is a required field.", "error");
        }
        else if (!helpers.fnIsValidEmailAddress(_email)) {
            helpers.fnModal("Save failed. Invalid email format.", "error");
        }
        else if (_roleId == "") {
            helpers.fnModal("Save failed. Role is a required field.", "error");
        }
        else if (_password == "") {
            helpers.fnModal("Save failed. Password is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/SecurityUsers/SaveUsers",
                data: {
                    id: "0",
                    username: _username,
                    password: _password,
                    fullname: _fullname,
                    email: _email,
                    roleId: _roleId,
                    approver: _approver
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "callback", users_add.fnReturn);
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

    fnReturn: function () {
        window.location.href = window.location.origin + "/Security/Users";
    }

};

$(function () {

    $("#ddlRole").dropdown();

    $("#btnSave").on("click", function () {
        users_add.fnSave();
    });

    $("#btnReturn").on("click", function () {
        users_add.fnReturn();
    });

});