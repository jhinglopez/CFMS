var cashoutflows_index = {

    fnInitializeCalendar: function () {
        $('#txtDateToCalendar').calendar({
            formatter: {
                datetime: "MM/DD/YYYY hh:mm A"
            }
        });
    },

    fnInitializeDetails: function () {
        var _chapel = $("#txtChapel").val();
        var _type = $("#txtTranType").val();
        if (_chapel.trim() != "" && _type.trim() != "") {
            $("#ddlChapel").addClass("disabled");
            $("#ddlTranType").addClass("disabled");
            if (_type.toLowerCase() == "utilitybills") {
                $("#trCategory").show();
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trItem").hide();
                $("#trApprover").hide();
                $("#lblTranName").text("Assigned Person *");
            }
            else if (_type.toLowerCase() == "stipend") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trCategory").hide();
                $("#trItem").hide();
                $("#trApprover").hide();
                $("#lblTranName").text("Recipient *");
            }
            else if (_type.toLowerCase() == "services") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trApprover").show();
                $("#trCategory").hide();
                $("#trItem").hide();
                $("#lblTranName").text("Service Provider *");
            }
            else if (_type.toLowerCase() == "supplies") {
                $("#trCategory").show();
                $("#trTranDate").show();
                $("#trName").show();
                $("#trAmount").show();
                $("#trItem").show();
                $("#trApprover").show();
                $("#trReferenceTitle").hide();
                $("#lblTranName").text("Assigned Person *");
            }
        }
    },

    fnSave: function () {
        var _chapelId = $("#txtChapel").val();
        var _tranType = $("#txtTranType").val();
        var _category = $("#txtCategory").val();
        var _tranDate = $("#txtTranDate").val();
        var _tranName = $("#txtName").val();
        var _referenceTitle = $("#txtReferenceTitle").val();
        var _item = $("#txtItem").val();
        var _amount = $("#txtAmount").val();
        var _approver = $("#txtApprover").val();
        if ($('#trCategory').is(':visible') && _category.trim() == "") {
            helpers.fnModal("Save failed. Vendor is a required field.", "error");
        }
        else if (_tranDate.trim() == "") {
            helpers.fnModal("Save failed. Transaction date is a required field.", "error");
        }
        else if (_tranName.trim() == "") {
            helpers.fnModal("Save failed. Transaction name is a required field.", "error");
        }
        else if ($('#trReferenceTitle').is(':visible') && _referenceTitle.trim() == "") {
            helpers.fnModal("Save failed. Reference title is a required field.", "error");
        }
        else if ($('#trItem').is(':visible') && _item.trim() == "") {
            helpers.fnModal("Save failed. Item is a required field.", "error");
        }
        else if (_amount.trim() == "") {
            helpers.fnModal("Save failed. Amount is a required field.", "error");
        }
        else if (!helpers.fnIsValidAmount(_amount)) {
            helpers.fnModal("Save failed. Invalid amount.", "error");
        }
        else if ($('#trApprover').is(':visible') && _approver.trim() == "") {
            helpers.fnModal("Save failed. Approver is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/TransactionsCashOutFlows/SaveCashOutflows",
                data: {
                    chapelId: _chapelId,
                    tranType: _tranType,
                    category: _category,
                    tranDate: _tranDate,
                    name: _tranName,
                    referenceTitle: _referenceTitle,
                    amount: _amount,
                    itemName: _item,
                    approvalUserId: _approver
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "callback", cashoutflows_index.fnNewTransaction);
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

    fnClearConfirmation: function () {
        helpers.fnModal("Are you sure you want to cancel this transaction?", "confirm", cashoutflows_index.fnClear)
    },

    fnNewTransaction: function () {
        $("#txtCategory").val("");
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtReferenceTitle").val("");
        $("#txtItem").val("");
        $("#txtAmount").val("");
        $("#ddlApprover").dropdown("clear");
        $("#txtApprover").val("");
    },

    fnClear: function () {
        $("#ddlChapel").removeClass("disabled");
        $("#ddlTranType").removeClass("disabled");
        $("#ddlChapel").dropdown("clear");
        $("#ddlTranType").dropdown("clear");
        $("#txtCategory").val("");
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtReferenceTitle").val("");
        $("#txtAmount").val("");
        $("#txtItem").val("");
        $("#ddlApprover").dropdown("clear");
        $("#trCategory").hide();
        $("#trTranDate").hide();
        $("#trName").hide();
        $("#trReferenceTitle").hide();
        $("#trAmount").hide();
        $("#trItem").hide();
        $("#ddlApprover").dropdown("clear");
        $("#trApprover").hide();
    },

    fnFormatAmount: function () {
        var _amount = $("#txtAmount").val();
        $("#txtAmount").val(helpers.fnFormatAmount(_amount));
    },

    fnDecimalAmount: function () {
        $("#txtAmount").val(Number($("#txtAmount").val()).toFixed(2));
    }
};

$(function () {

    $("#ddlChapel").dropdown();
    $("#ddlTranType").dropdown();
    $("#ddlApprover").dropdown();
    cashoutflows_index.fnInitializeCalendar();

    $("#btnSave").on("click", function () {
        cashoutflows_index.fnSave();
    });

    $("#btnClear").on("click", function () {
        cashoutflows_index.fnClearConfirmation();
    });

    $("#ddlChapel").change(function () {
        cashoutflows_index.fnInitializeDetails();
    });

    $("#ddlTranType").change(function () {
        cashoutflows_index.fnInitializeDetails();
    });

    $("#txtAmount").keyup(function (event) {
        cashoutflows_index.fnFormatAmount();
    });

    $("#txtAmount").change(function (event) {
        cashoutflows_index.fnDecimalAmount();
    });

});