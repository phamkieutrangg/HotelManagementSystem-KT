
function Validator(options) {
    function validate(selectElement, rule) {
        var errormessage = rule.test(selectElement.value);
        var errorElement = selectElement.parentElement.querySelector('.form-message');
        if (errormessage) {
            errorElement.innerText = errormessage;
            return errormessage;
        } else {
            errorElement.innerText = '';
        }
    }
    var formElement = document.querySelector(options.form);
    if (formElement) {
        options.rules.forEach(function (rule) {
            var selectElement = formElement.querySelector(rule.selector);

            if (selectElement) {
                selectElement.onblur = function () {
                    validate(selectElement, rule);
                };
                selectElement.onchange = function () {
                    validate(selectElement, rule);
                };

                selectElement.oninput = function () {
                    validate(selectElement, rule);
                };

            }

        });

        formElement.onsubmit = function (event) {
            check = true;
            check2 = true;
            options.rules.forEach(function (rule) {

                var selectElement = formElement.querySelector(rule.selector);

                if (validate(selectElement, rule)) {
                    check = false;
                    return;
                }
            });

            if (!check || !check2) {
                event.preventDefault();
            }
        };

    }
}
;
Validator.isRoomNumber = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter Room Number!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isRoomType = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '[Choose yours]') {
                return 'Please enter Room Type!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isNumberOfBed = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '0') {
                return 'Please enter Number Of Bed!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isStatus = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '[Choose yours]') {
                return 'Please enter Status Of Room!!!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isName = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter Room Type!!!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isName = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            var numberPhone = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập số điện thoại';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isBirthDay = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn ngày tháng năm sinh';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isAddress = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập địa chỉ';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isIdCart = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            var idCart = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập CMND/Hộ chiếu';
            } else if (!idCart.test(value) || value.length != 9) {
                return 'Số CMND/Hộ chiếu không hợp lệ';
            } else {
                return undefined;
            }
            ;
        }
    }
};


console.log('test')