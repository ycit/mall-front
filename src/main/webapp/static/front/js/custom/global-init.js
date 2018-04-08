$(function () {
    Handlebars.registerHelper("compare",function (left, operator, right, options) {
        if (arguments.length < 3) {
            throw new Error('Handlerbars Helper "compare" needs 2 parameters');
        }
        var operators = {
            '==':     function(l, r) {return l == r; },
            '===':    function(l, r) {return l === r; },
            '!=':     function(l, r) {return l != r; },
            '!==':    function(l, r) {return l !== r; },
            '<':      function(l, r) {return l < r; },
            '>':      function(l, r) {return l > r; },
            '<=':     function(l, r) {return l <= r; },
            '>=':     function(l, r) {return l >= r; },
            'typeof': function(l, r) {return typeof l == r; }
        };

        if (!operators[operator]) {
            throw new Error('Handlerbars Helper "compare" doesn\'t know the operator ' + operator);
        }

        var result = operators[operator](left, right);

        if (result) {
            return options.fn(this);
        } else {
            return options.inverse(this);
        }

    });

    jQuery.validator.addMethod("positiveInteger", function(value, element) {
        var reg = /^[1-9]\d*$/;
        return this.optional(element) || reg.test(value);
    }, "必须输入正整数");

    jQuery.validator.addMethod("bigEqualZero", function(value, element) {
        var reg = /^[1-9]\d*|0$/;
        return this.optional(element) || reg.test(value);
    }, "必须输入正整数 或者 0");

    jQuery.validator.addMethod("between", function(value, element) {
        return this.optional(element) ||  value > 0 & value < 10000;
    }, "充值金额不得高于10000");

    jQuery.validator.addMethod("telephone", function(value, element) {
        var reg = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || reg.test(value);
    }, "号码不合法(固定号码形式:xxx-xxxxx;手机号码为11位)");

    jQuery.validator.addMethod("phone", function(value, element) {
        var reg = /^(1[3584]\d{9})$/
        return this.optional(element) || reg.test(value);
    }, "手机号码不合法(手机号码为11位)");

    jQuery.validator.addMethod("tel", function(value, element) {
        var reg = /^(0\d{2,3}-\d{7,8})$/;
        return this.optional(element) || reg.test(value);
    }, "固定号码不合法(固定号码形式:xxx-xxxxx)");

    jQuery.validator.addMethod("float", function(value, element) {
        var reg = /^[1-9]\d*\.*\d*|0\.\d*[1-9]\d*$/;
        return this.optional(element) || reg.test(value);
    }, "必须输入正浮点数");
})