var utilitytype_add = {

    fnSave: function () {
        var _name = $("#txtName").val();
        if (_name.trim() == "") {
            helpers.fnModal("Save failed. Utility type name is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/Maintenance/SaveUtilityType",
                data: {
                    id: "0",
                    name: _name
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "callback", utilitytype_add.fnReturn);
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
        window.location.href = window.location.origin + "/Maintenance/UtilityType";
    }

};

$(function () {

    $("#btnSave").on("click", function () {
        utilitytype_add.fnSave();
    });

    $("#btnReturn").on("click", function () {
        utilitytype_add.fnReturn();
    });

});