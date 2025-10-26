var users_edit = {

    fnInitializeDetail: function () {
        var _id = $("#__id").val();
        $.ajax({
            url: window.location.origin + "/SecurityUsers/GetUsersById",
            data: {
                id: _id
            },
            type: "POST",
            cache: false,
            success: function (data) {
                if (data.length > 0) {
                    data.forEach(function (item, index) {
                        $("#txtUserName").val(item.UserName);
                        $("#txtFullName").val(item.FullName);
                        $("#txtEmail").val(item.Email);
                        $("#ddlRole").dropdown("set selected", item.RoleId);
                        if (item.SecuritySignum == "1") {
                            $("#chkApprover").prop("checked", true);
                        }
                        else {
                            $("#chkApprover").prop("checked", false);
                        }
                        if (item.UserName.toLowerCase() == "admin") {
                            $("#btnSave").hide();
                        }
                    });
                }
            },
            error: function () {
            }
        });
    },

    fnSave: function () {
        var _id = $("#__id").val();
        var _username = $("#txtUserName").val();
        var _fullname = $("#txtFullName").val();
        var _email = $("#txtEmail").val();
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
        else {
            $.ajax({
                url: window.location.origin + "/SecurityUsers/UpdateUsers",
                data: {
                    id: _id,
                    username: _username,
                    fullname: _fullname,
                    email: _email,
                    roleId: _roleId,
                    approver: _approver
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "success");
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
    users_edit.fnInitializeDetail();

    $("#btnSave").on("click", function () {
        users_edit.fnSave();
    });

    $("#btnReturn").on("click", function () {
        users_edit.fnReturn();
    });

});