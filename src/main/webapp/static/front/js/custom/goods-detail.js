$(function () {
    $("#buy-form").validate({
        rules:{
            amount :{
                required:true
            }
        }
    });



    utils.quick.click({
        cart: function () {
            var username = $("#username").val();
            if (username === "") {
                utils.modal.myConfirm("未登录提示", "前往登录页面登录？", function (sure) {
                    if (sure) {
                        window.location.href = "/front/login";
                    }
                })
            } else {
                var goodsId = $("#goods-id").val();
                var goodsCount = $("#amount-input").val();
                var storeId = $("#store-id").val();
                var params = {
                    goodsId:goodsId, goodsCount:goodsCount, storeId:storeId
                };
                utils.myAjax.post("/front/cart/add", params, function (data) {
                    $(".alert-notice-wrap").removeClass("hide");
                    setTimeout("$(\".alert-notice-wrap\").addClass(\"hide\")", 1000)
                    if (data.exist === 0) {
                        var cartCount = $("#badge").html();
                        $("#badge").html(parseInt(cartCount) + 1);
                    }
                });
            }
        }
    });

    var amountInputSelector = $("#amount-input");
    var cartActionSelector = $("#cart");
    var noticeSelector = $("#notice");
    amountInputSelector.on("keyup", function () {
        var value = this.value.replace(/\D/g,'')
        if (value ==="") {
           value = 1;
        }
        var stock = $("#goods-stock").val();
        if (parseInt(value) > parseInt(stock)) {
            cartActionSelector.addClass("no-post");
            cartActionSelector.attr("disabled", "disabled");
            noticeSelector.removeClass("hide");
        } else {
            cartActionSelector.removeClass("no-post");
            cartActionSelector.removeAttr("disabled");
            noticeSelector.addClass("hide");
        }
        amountInputSelector.val(value);
        amountInputSelector.attr("value", value);
    });
})