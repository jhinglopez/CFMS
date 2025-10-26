var cashinflows_index = {

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
            if (_type.toLowerCase() == "masscollections") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trAcknowledgementReceipt").hide();
                $("#lblTranName").text("Celebrant *");
                $("#lblReferenceTitle").text("Reference Title *");
            }
            else if (_type.toLowerCase() == "specialintentionoffering") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trAcknowledgementReceipt").show();
                $("#lblTranName").text("Name of Offeror *");
                $("#lblReferenceTitle").text("Reference Title *");
            }
            else if (_type.toLowerCase() == "sponsorship") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trAcknowledgementReceipt").show();
                $("#lblTranName").text("Name of Sponsor *");
                $("#lblReferenceTitle").text("Reference Title *");
            }
            else if (_type.toLowerCase() == "donation") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trProjectTitle").show();
                $("#trAmount").show();
                $("#trAcknowledgementReceipt").show();
                $("#trReferenceTitle").show();
                $("#lblTranName").text("Name of Donor *");
                $("#lblReferenceTitle").text("Project Title *");
            }
            else if (_type.toLowerCase() == "secondcollection") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trProjectTitle").hide();
                $("#trAcknowledgementReceipt").hide();
                $("#lblTranName").text("Celebrant *");
                $("#lblReferenceTitle").text("Reference Title *");
            }
            else if (_type.toLowerCase() == "venturerevenue") {
                $("#trTranDate").show();
                $("#trName").show();
                $("#trAmount").show();
                $("#trAcknowledgementReceipt").show();
                $("#trReferenceTitle").hide();
                $("#lblTranName").text("Venture Title *");
                $("#lblReferenceTitle").text("Reference Title *");
            }
        }
    },

    fnSave: function () {
        var _tranDate = $("#txtTranDate").val();
        var _tranName = $("#txtName").val();
        var _referenceTitle = $("#txtReferenceTitle").val();
        var _amount = $("#txtAmount").val();
        var _acknowledgementReceipt = $("#txtAcknowledgementReceipt").val();
        if (_tranDate.trim() == "") {
            helpers.fnModal("Save failed. Transaction date is a required field.", "error");
        }
        else if (_tranName.trim() == "") {
            helpers.fnModal("Save failed. " + $("#lblTranName").text().replace("*","") + "is a required field.", "error");
        }
        else if ($('#trReferenceTitle').is(':visible') && _referenceTitle.trim() == "") {
            helpers.fnModal("Save failed. Reference title is a required field.", "error");
        }
        else if (_amount.trim() == "") {
            helpers.fnModal("Save failed. Amount is a required field.", "error");
        }
        else if (!helpers.fnIsValidAmount(_amount)) {
            helpers.fnModal("Save failed. Invalid amount.", "error");
        }
        else if ($('#trAcknowledgementReceipt').is(':visible') && _acknowledgementReceipt.trim() == "") {
            helpers.fnModal("Save failed. Acknowledgement receipt is a required field.", "error");
        }
        else {
            _amount = Number(_amount).toFixed(2);
            $("#txtAmount").val(_amount);
            alert("Saved! ");
            cashinflows_index.fnNewTransaction();
        }
    },

    fnClearConfirmation: function () {
        helpers.fnModal("Are you sure you want to cancel this transaction?", "confirm", cashinflows_index.fnClear)
    },

    fnNewTransaction: function () {
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtReferenceTitle").val("");
        $("#txtAmount").val("");
        $("#txtAcknowledgementReceipt").val("");
    },

    fnClear: function () {
        $("#ddlChapel").removeClass("disabled");
        $("#ddlTranType").removeClass("disabled");
        $("#ddlChapel").dropdown("clear");
        $("#ddlTranType").dropdown("clear");
        $("#txtTranDate").val("");
        $("#txtName").val("");
        $("#txtReferenceTitle").val("");
        $("#txtAmount").val("");
        $("#txtAcknowledgementReceipt").val("");
        $("#trTranDate").hide();
        $("#trName").hide();
        $("#trReferenceTitle").hide();
        $("#trAmount").hide();
        $("#trAcknowledgementReceipt").hide();
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
    cashinflows_index.fnInitializeCalendar();

    $("#btnSave").on("click", function () {
        cashinflows_index.fnSave();
    });

    $("#btnClear").on("click", function () {
        cashinflows_index.fnClearConfirmation();
    });

    $("#ddlChapel").change(function () {
        cashinflows_index.fnInitializeDetails();
    });

    $("#ddlTranType").change(function () {
        cashinflows_index.fnInitializeDetails();
    });

    $("#txtAmount").keyup(function (event) {
        cashinflows_index.fnFormatAmount();
    });

    $("#txtAmount").change(function (event) {
        cashinflows_index.fnDecimalAmount();
    });

});