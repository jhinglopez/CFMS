var roles_index = {

    fnInitializeTable: function () {
        $.ajax({
            url: window.location.origin + "/SecurityRoles/GetRoles",
            type: "POST",
            cache: false,
            success: function (data) {
                var _html = "";
                if (data.length > 0) {
                    data.forEach(function (item, index) {
                        _html += "<tr>";
                        _html += "<td class=\"collapsing\"><a href=\"/Security/Roles/Detail/" + helpers.fnNormalizeUrl(item.Name) + "/" + item.Id + "\" title=\"edit\"><i class=\"edit icon\"></i></a></td>";
                        if (item.Name.toLowerCase().trim() != "admin") {
                            _html += "<td class=\"collapsing\"><a href=\"#\" title=\"delete\" onclick=\"roles_index.fnDeleteConfirmation('" + item.Id + "');\"><i class=\"trash alternate icon\"></i></a></td>";
                        }
                        else {
                            _html += "<td class=\"collapsing\">&nbsp;</td>";
                        }
                        _html += "<td class=\"top aligned\">" + item.Name + "</td>";
                        _html += "<td class=\"top aligned\">" + item.Description + "</td>";
                        _html += "</tr>";
                    });
                }
                else {
                    _html += "<tr>";
                    _html += "<td colspan=\"4\" class=\"center aligned\">There are no record(s) to view</td>";
                    _html += "<td style=\"display:none;\"></td>";
                    _html += "<td style=\"display:none;\"></td>";
                    _html += "<td style=\"display:none;\"></td>";
                    _html += "</tr>";
                }
                $("#tablebody").html(_html);
            },
            error: function () {
            }
        });
    },

    fnDeleteConfirmation: function (e) {
        $("#__id").val(e);
        helpers.fnModal("Are you sure you want to delete the selected record?", "confirm", roles_index.fnDelete)
    },

    fnDelete: function () {
        var _id = $("#__id").val();
        $.ajax({
            url: window.location.origin + "/SecurityRoles/DeleteRoles",
            data: {
                id: _id
            },
            type: "POST",
            cache: false,
            success: function (result) {
                if (result == "") {
                    helpers.fnModal("Record has been deleted successfully.", "callback", roles_index.fnRefresh);
                }
                else {
                    helpers.fnModal(result, "error");
                }
            },
            error: function () {
                helpers.fnModal("Delete failed. There has been an internal script error deleting the data. Please try again later.", "error");
            }
        });
    },

    fnRefresh: function () {
        window.location.href = window.location.origin + "/Security/Roles";
    }

};

$(function () {

    roles_index.fnInitializeTable();

});