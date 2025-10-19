var roles_edit = {

    fnInitializeDetail: function () {
        var _id = $("#__id").val();
        $.ajax({
            url: window.location.origin + "/SecurityRoles/GetRolesById",
            data: {
                id: _id
            },
            type: "POST",
            cache: false,
            success: function (data) {
                if (data.length > 0) {
                    data.forEach(function (item, index) {
                        $("#txtName").val(item.Name);
                        $("#txtDescription").val(item.Description);
                        if (item.Name.toLowerCase() == "admin") {
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
        var _name = $("#txtName").val();
        var _description = $("#txtDescription").val();
        var _pages = "";
        if (_name.trim() == "") {
            helpers.fnModal("Save failed. Role name is a required field.", "error");
        }
        else if (_description == "") {
            helpers.fnModal("Save failed. Role description is a required field.", "error");
        }
        else {
            $("input[name='modules']:checked").each(function () {
                var _id = $(this).attr("id");
                _pages += _id + ",";
            });
            $.ajax({
                url: window.location.origin + "/SecurityRoles/SaveRoles",
                data: {
                    id: _id,
                    name: _name,
                    description: _description,
                    pages: _pages
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
        window.location.href = window.location.origin + "/Security/Roles";
    }

};

$(function () {

    roles_edit.fnInitializeDetail();

    $("#btnSave").on("click", function () {
        roles_edit.fnSave();
    });

    $("#btnReturn").on("click", function () {
        roles_edit.fnReturn();
    });

});