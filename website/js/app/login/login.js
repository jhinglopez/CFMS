var login = {

    fnLogin: function () {
        if ($("#txtUsername").val().trim() == "") {
            login.fnLoginError("Login failed. Invalid username.");
        }
        else if ($("#txtPassword").val().trim() == "") {
            login.fnLoginError("Login failed. Invalid password.");
        }
        else if ($("#txtChapel").val().trim() == "") {
            login.fnLoginError("Login failed. Invalid selected chapel.");
        }
        else {
            $("#btnLogin").addClass("disabled");
            $("#btnLogin").addClass("loading");
            $("#formLogin").submit();
        }
    },

    fnLoginError: function (e) {
        $("#btnLogin").removeClass("disabled");
        $("#btnLogin").removeClass("loading");
        helpers.fnModal(e, "error");
    }

};

$(function () {

    $("#txtUsername").keyup(function (event) {
        if (event.keyCode == 13) {
            document.getElementById("txtPassword").focus();
        }
    });

    $("#txtPassword").keyup(function (event) {
        if (event.keyCode == 13) {
            $("#btnLogin").click();
        }
    });

    $("#btnLogin").click(function () {
        login.fnLogin();
    });

});