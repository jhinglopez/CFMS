var forwardings_index = {

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
            if (_type.toLowerCase() == "parishshare") {
                $("#trTranDate").show();
                $("#trName").hide();
                $("#trAmount").show();
                $("#trVentureTitle").hide();
                $("#trBeneficiary").hide();
                $("#trApprover").show();
            }
            else if (_type.toLowerCase() == "ventureallocation") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trAmount").show();
                $("#trVentureTitle").show();
                $("#trBeneficiary").hide();
                $("#trApprover").show();
            }
            else if (_type.toLowerCase() == "assistancefund") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trAmount").show();
                $("#trVentureTitle").hide();
                $("#trBeneficiary").show();
                $("#trApprover").show();
            }
        }
    },

    fnSave: function () {
        var _chapelId = $("#txtChapel").val();
        var _tranType = $("#txtTranType").val();
        var _tranDate = $("#txtTranDate").val();
        var _tranName = $("#txtName").val();
        var _amount = $("#txtAmount").val();
        var _ventureTitle = $("#txtVentureTitle").val();
        var _beneficiary = $("#txtBeneficiary").val();
        var _approver = $("#txtApprover").val();
        if (_tranDate.trim() == "") {
            helpers.fnModal("Save failed. Transaction date is a required field.", "error");
        }
        else if ($('#trName').is(':visible') && _tranName.trim() == "") {
            helpers.fnModal("Save failed. Key person is a required field.", "error");
        }
        else if (_amount.trim() == "") {
            helpers.fnModal("Save failed. Amount is a required field.", "error");
        }
        else if (!helpers.fnIsValidAmount(_amount)) {
            helpers.fnModal("Save failed. Invalid amount.", "error");
        }
        else if ($('#trVentureTitle').is(':visible') && _ventureTitle.trim() == "") {
            helpers.fnModal("Save failed. Venture title is a required field.", "error");
        }
        else if ($('#trBeneficiary').is(':visible') && _beneficiary.trim() == "") {
            helpers.fnModal("Save failed. Beneficiary is a required field.", "error");
        }
        else if (_approver.trim() == "") {
            helpers.fnModal("Save failed. Approver is a required field.", "error");
        }
        else {
            $.ajax({
                url: window.location.origin + "/TransactionsForwardings/SaveForwardings",
                data: {
                    chapelId: _chapelId,
                    tranType: _tranType,
                    tranDate: _tranDate,
                    name: _tranName,
                    amount: _amount,
                    ventureTitle: _ventureTitle,
                    beneficiary: _beneficiary,
                    approvalUserId: _approver
                },
                type: "POST",
                cache: false,
                success: function (result) {
                    if (result == "") {
                        helpers.fnModal("The record has been saved successfully.", "callback", forwardings_index.fnNewTransaction);
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
        helpers.fnModal("Are you sure you want to cancel this transaction?", "confirm", forwardings_index.fnClear)
    },

    fnNewTransaction: function () {
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtAmount").val("");
        $("#txtVentureTitle").val("");
        $("#txtBeneficiary").val("");
        $("#ddlApprover").dropdown("clear");
        $("#txtApprover").val("");
    },

    fnClear: function () {
        $("#ddlChapel").removeClass("disabled");
        $("#ddlTranType").removeClass("disabled");
        $("#ddlChapel").dropdown("clear");
        $("#ddlTranType").dropdown("clear");
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtAmount").val("");
        $("#txtVentureTitle").val("");
        $("#txtBeneficiary").val("");
        $("#txtApprover").val("");
        $("#trTranDate").hide();
        $("#trName").hide();
        $("#trAmount").hide();
        $("#trVentureTitle").hide();
        $("#trBeneficiary").hide();
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
    forwardings_index.fnInitializeCalendar();

    $("#btnSave").on("click", function () {
        forwardings_index.fnSave();
    });

    $("#btnClear").on("click", function () {
        forwardings_index.fnClearConfirmation();
    });

    $("#ddlChapel").change(function () {
        forwardings_index.fnInitializeDetails();
    });

    $("#ddlTranType").change(function () {
        forwardings_index.fnInitializeDetails();
    });

    $("#txtAmount").keyup(function (event) {
        forwardings_index.fnFormatAmount();
    });

    $("#txtAmount").change(function (event) {
        forwardings_index.fnDecimalAmount();
    });

});