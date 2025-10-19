var chapels_edit = {

    fnInitializeDetail: function () {
        var _id = $("#__id").val();
        $.ajax({
            url: window.location.origin + "/MaintenanceChapels/GetChapelsById",
            data: {
                id: _id
            },
            type: "POST",
            cache: false,
            success: function (data) {
                if (data.length > 0) {
                    data.forEach(function (item, index) {
                        $("#txtName").val(item.Name);
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
        if (_name.trim() == "") {
            helpers.fnModal("Save failed. Chapel name is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/MaintenanceChapels/SaveChapels",
                data: {
                    id: _id,
                    name: _name
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
        window.location.href = window.location.origin + "/Maintenance/Chapels";
    }

};

$(function () {

    chapels_edit.fnInitializeDetail();

    $("#btnSave").on("click", function () {
        chapels_edit.fnSave();
    });

    $("#btnReturn").on("click", function () {
        chapels_edit.fnReturn();
    });

});