var utilities_add = {

    fnSave: function () {
        var _name = $("#txtName").val();
        var _type = $("#txtType").val();
        if (_name.trim() == "") {
            helpers.fnModal("Save failed. Utility name is a required field.", "error");
        }
        else if (_type == "")
        {
            helpers.fnModal("Save failed. Utility type is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/MaintenanceUtilities/SaveUtilities",
                data: {
                    id: "0",
                    name: _name,
                    utilityTypeId: _type
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "callback", utilities_add.fnReturn);
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

    $("#btnSave").on("click", function () {
        utilities_add.fnSave();
    });

    $("#btnReturn").on("click", function () {
        utilities_add.fnReturn();
    });

});