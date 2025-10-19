var utilities_edit = {

    fnInitializeDetail: function () {
        var _id = $("#__id").val();
        $.ajax({
            url: window.location.origin + "/MaintenanceUtilities/GetUtilitiesById",
            data: {
                id: _id
            },
            type: "POST",
            cache: false,
            success: function (data) {
                if (data.length > 0) {
                    data.forEach(function (item, index) {
                        $("#txtName").val(item.Name);
                        $("#ddlType").dropdown("set selected", item.UtilityTypeId);
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
        var _type = $("#txtType").val();
        if (_name.trim() == "") {
            helpers.fnModal("Save failed. Utility name is a required field.", "error");
        }
        else if (_type == "") {
            helpers.fnModal("Save failed. Utility type is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/MaintenanceUtilities/SaveUtilities",
                data: {
                    id: _id,
                    name: _name,
                    utilityTypeId: _type
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
        window.location.href = window.location.origin + "/Maintenance/Utilities";
    }

};

$(function () {

    $("#ddlType").dropdown();
    utilities_edit.fnInitializeDetail();

    $("#btnSave").on("click", function () {
        utilities_edit.fnSave();
    });

    $("#btnReturn").on("click", function () {
        utilities_edit.fnReturn();
    });

});