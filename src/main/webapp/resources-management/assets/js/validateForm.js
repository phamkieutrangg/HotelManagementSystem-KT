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
//roomValidate
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
//roomTypeValidate
Validator.isNameRoomType = function (selector) {

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
Validator.isPriceRoomType = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value === '0.0' || value ==='') {
                return 'Please enter price!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isSizeRoomType = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '0' || value ==='') {
                return 'Please enter size!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isStatusRoomType = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter status!!!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDescriptionRoomType = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter description!!!';
            } else {
                return undefined;
            }
        }
    };
};
//promotionValidate
 Validator.isStartDatePromotion = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === 'dd/mm/yyyy') {
                            return 'Please enter start date';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
Validator.isDiscountPromotion = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value === '' || value ==='0') {
                return 'Please enter discount!!!';
            } else {
                return undefined;
            }
        }
    };
};           
Validator.isNamePromotion = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter promotion!!!';
            } else {
                return undefined;
            }
        }
    };
};
 Validator.isEndDatePromotion = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === 'yyyy-MM-dd') {
                            return 'Please enter end date!!!';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
Validator.isStatusPromotion = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter status!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isDescriptionPromotion = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter description!!!';
            } else {
                return undefined;
            }
        }
    };
};
//serviceValidate
Validator.isNameService = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter Service!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isPriceService = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == ''|| value ==='0.0') {
                return 'Please enter Price!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isLocationService = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter Location!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isStatusService = function (selector) {

     return {
        selector: selector,
        test: function (value) {
            if (value === '-1') {
                return 'Please enter Status!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isOpenTimeService = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter Open Time!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isDescriptionService = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter description!!!';
            } else {
                return undefined;
            }
        }
    };
};
//searchNameValidate
Validator.isSearchName = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter name!!';
            } else {
                return undefined;
            }
        }
    };
};
//searchDateValidate

//guestValidate
Validator.isNameGuest = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter your name!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isGenderGuest = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '[Choose yours]') {
                return 'Please enter your gender!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isBirthDate = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == 'mm/dd/yyyy') {
                return 'Please enter your birthdate!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isEmailGuest = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter your email!!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isPhoneGuest = function (selector) {

    return {
                    selector: selector,
                    test: function (value) {
                        var numberPhone = /^(?:[0-9]\d*|\d)$/;
                        if (value == '') {
                            return 'Please enter your phone';
                        } else if (!numberPhone.test(value) || value.length != 10) {
                            return 'Invalid phone number';
                        } else {
                            return undefined;
                        }
                    }
                };
};
Validator.isAdressGuest = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please enter your adresss!!';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isIdCard = function (selector) {

    return {
                    selector: selector,
                    test: function (value) {

                        var idCart = /^(?:[0-9]\d*|\d)$/;
                        if (value == '') {
                            return 'Please enter your ID Card';
                        } else if (!idCart.test(value) || value.length != 9) {
                            return 'Invalid ID Card';
                        } else {
                            return undefined;
                        }
                        ;
                    }
                }
};
