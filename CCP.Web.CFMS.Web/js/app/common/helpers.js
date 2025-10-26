var helpers = {

    fnModal: function (msg, type, func) {
        if (type == "success") {
            $("#ModalMessageInfo").text(msg);
            $(".ui.basic.modal.okmsgbox").modal({
                closable: false
            }).modal("show");
        }
        else if (type == "error") {
            $("#ModalMessageError").text(msg);
            $(".ui.basic.modal.errmsgbox").modal({
                closable: false
            }).modal("show");
        }
        else if (type == "confirm") {
            $("#ModalMessageConfirm").text(msg);
            $(".ui.basic.modal.confirmmsgbox").modal({
                closable: false,
                onApprove: function () {
                    func();
                }
            }).modal("show");
        }
        else if (type == "callback") {
            $("#ModalMessageCallBack").text(msg);
            $(".ui.basic.modal.callbackmsgbox").modal({
                closable: false,
                onApprove: function () {
                    func();
                }
            }).modal("show");
        }
        else {
            $("#ModalMessageInfo").text(msg);
            $(".ui.basic.modal.okmsgbox").modal({
                closable: false
            }).modal("show");
        }
    },

    fnNormalizeUrl: function (e) {
        var _new = e;
        _new = _new.replaceAll(" ", "_");
        _new = _new.replaceAll("~", "");
        _new = _new.replaceAll("!", "");
        _new = _new.replaceAll("@", "");
        _new = _new.replaceAll("#", "");
        _new = _new.replaceAll("$", "");
        _new = _new.replaceAll("%", "");
        _new = _new.replaceAll("^", "");
        _new = _new.replaceAll("&", "");
        _new = _new.replaceAll("*", "");
        _new = _new.replaceAll("(", "");
        _new = _new.replaceAll(")", "");
        _new = _new.replaceAll("+", "");
        _new = _new.replaceAll("=", "");
        _new = _new.replaceAll("[", "");
        _new = _new.replaceAll("]", "");
        _new = _new.replaceAll("{", "");
        _new = _new.replaceAll("}", "");
        _new = _new.replaceAll("|", "");
        _new = _new.replaceAll("\\", "");
        _new = _new.replaceAll(";", "");
        _new = _new.replaceAll(":", "");
        _new = _new.replaceAll("'", "");
        _new = _new.replaceAll("\"", "");
        _new = _new.replaceAll("<", "");
        _new = _new.replaceAll(">", "");
        _new = _new.replaceAll(",", "");
        _new = _new.replaceAll(".", "");
        _new = _new.replaceAll("?", "");
        _new = _new.replaceAll("/", "");
        _new = _new.replaceAll("–", "");
        _new = _new.replaceAll("-", "");
        _new = _new.replaceAll("‘", "");
        _new = _new.replaceAll("’", "");
        return _new;
    },

    fnIsValidEmailAddress: function (emailAddress) {
        var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (pattern.test(emailAddress)) {
            return true;
        }
        else {
            return false;
        }
    },

    fnIsValidAmount: function (amount) { 
        var pattern = /^\d*\.?\d+$/;
        if (pattern.test(amount)) {
            return true;
        }
        else {
            return false;
        }
    },

    fnFormatAmount: function (amount) {
        var _amount = amount;
        _amount = _amount.replace(/[^0-9.]/g, "");
        const parts = _amount.split('.');
        if (parts.length > 2) {
            _amount = parts[0] + '.' + parts.slice(1, -1).join('') + parts[parts.length - 1];
        }
        return _amount;
    }

};