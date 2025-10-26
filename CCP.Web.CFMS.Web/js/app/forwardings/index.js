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