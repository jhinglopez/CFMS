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
                $("#trCategory").show();
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trItem").hide();
                $("#trApprover").hide();
                $("#lblTranName").text("Recipient *");
            }
            else if (_type.toLowerCase() == "services") {
                $("#trCategory").show();
                $("#trTranDate").show();
                $("#trName").show();
                $("#trReferenceTitle").show();
                $("#trAmount").show();
                $("#trApprover").show();
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
        $("#trApprover").hide();
    },

    fnFormatAmount: function () {
        var _amount = $("#txtAmount").val();
        $("#txtAmount").val(helpers.fnFormatAmount(_amount));
    }
};

$(function () {

    $("#ddlChapel").dropdown();
    $("#ddlTranType").dropdown();
    $("#ddlApprover").dropdown();
    cashoutflows_index.fnInitializeDetails();

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

});