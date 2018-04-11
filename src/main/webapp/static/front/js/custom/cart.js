$(function () {
    var totalPrice = 0;
    var addressHtml = $("#address").html();
    var addressTemplate = Handlebars.compile(addressHtml);
    utils.myAjax.get("/front/cart/list", {}, function (data) {
        var total = 0;
        var html;
        var addresses;
        if (data.length > 0) {
            _.forEach(data, function (carGoodsVos) {
                _.forEach(carGoodsVos.cartVos, function (cart) {
                    total++;
                    cart.totalPrice = cart.goodsCount * cart.goods.price;
                })
            });
            html = $("#cart").html();
            var template = Handlebars.compile(html);
            var userBalance = $("#user-balance").val();
            $(".result").html(template({carts: data, total: total, addresses:addresses, balance:userBalance}));
        } else {
            html = "<div class='empty-notice'><span class='empty-span'>购物车空空如也，快去<a href='/front/goodses'>搜索相关宝贝</a>吧~</span></div>";
            $(".result").html(html);
        }
        // 请求 地址信息
        utils.myAjax.get("/front/address", {}, function (addressData) {
            if (addressData.length > 0) {
                _.forEach(addressData, function (address) {
                    var phone = address.phone;
                    address.phone = address.phone.substr(0, 3) + "****" + address.phone.substr(7, 11);
                })
                addresses = addressData;
            }
            $("#consignee-list").html(addressTemplate({addresses:addresses}));
        });
    });

    //全选、全不选
    $(".result").on("change", ".check-all", function () {
        var value = $(this).prop("checked");
        $(".check-all").prop("checked", value);
        $(".item-checkbox").prop("checked", value);
        var checkboxSelect = $(".item-checkbox:checked");
        var goodsNum = checkboxSelect.length;
        $(".amount-sum").find("em").html(goodsNum);
        totalPrice = 0;
        if (value) {
            _.forEach(checkboxSelect, function (checkbox) {
                var price = $(checkbox).parents(".item-full").find(".total-price").html().replace(/[^0-9]/ig, "");
                totalPrice += parseInt(price);
            });
        }
        $(".sumPrice").find("em").html("¥" + totalPrice);
    });

    //单个选择框变化事件
    $(".result").on("change", ".item-checkbox", function () {
        var checkboxSelect = $(".item-checkbox:checked");
        var goodsNum = checkboxSelect.length;
        $(".amount-sum").find("em").html(goodsNum);
        var price = $(this).parents(".item-full").find(".total-price").html().replace(/[^0-9]/ig, "");
        if ($(this).prop("checked")) {
            totalPrice += parseInt(price);
        } else {
            totalPrice -= parseInt(price);
        }
        $(".sumPrice").find("em").html("¥" + totalPrice);
    });

    // 单个商品的删除
    $(".result").on("click", ".cart-a", function () {
        var that = this;
        var goodsSize = $(this).parents(".cart-store-group").find(".item-full").length;
        var cartId = $(this).parents(".item-full").find(".cart-id").val();
        console.log(cartId);
        utils.modal.myConfirm("确认从购物车删除该商品吗？", function (sure) {
            if (sure) {
                utils.myAjax.get("/front/cart/" + cartId + "/delete", {}, function (data) {
                    var total = $("#goods-total").html();
                    $("#goods-total").html(parseInt(total) - 1);
                    $("#badge").html(parseInt(total) - 1);
                    if (data > 0) {
                        if (goodsSize > 1) {
                            $(that).parents(".item-full").remove();
                        } else {
                            $(that).parents(".cart-store-group").prev(".cart-store-name").remove();
                            $(that).parents(".cart-store-group").remove();
                        }
                        /** 已选择商品数字变化  begin**/
                        var checkboxSelect = $(".item-checkbox:checked");
                        var goodsNum = checkboxSelect.length;
                        $(".amount-sum").find("em").html(goodsNum);
                        /** 已选择商品数字变化  end**/
                        var total = $("#cart-list").find(".cart-store-group").size();
                        if (total < 1) {
                            $(".result").html("<div class='empty-notice'><span class='empty-span'>购物车空空如也，快去<a href='/front/goodses'>搜索相关宝贝</a>吧~</span></div>");
                        }
                    }
                })
            }
        });

    });

    // 商品数量输入
    $(".result").on("keyup", ".goods-count", function () {
        var value = this.value.replace(/\D/g, ''); //防止输入非数字类型数据
        if (value === "") {
            value = 1;
        }
        // 最大购买量不得超过 200件
        if( value > 200) {
            value = 200;
        }
        //有货无货判断
        var stock = $(this).parents(".item-full").find(".goods-stock").val();
        if (value > parseInt(stock)) {
            $(this).parents(".item-full").find(".quantity-text").html("无货");
            $("#submit-hidden").attr("value", false);
        } else {
            $(this).parents(".item-full").find(".quantity-text").html("有货");
        }
        $(this).val(value);
        $(this).attr("value", value);
        var price = $(this).parents(".item-full").find(".goods-price").val();
        var sTotalPrice = parseInt(price) * parseInt(value);
        $(this).parents(".item-full").find(".total-price").html("¥" + sTotalPrice);

        var checkboxSelect = $(".item-checkbox:checked");
        totalPrice = 0;
        _.forEach(checkboxSelect, function (checkbox) {
            var price = $(checkbox).parents(".item-full").find(".total-price").html().replace(/[^0-9]/ig, "");
            totalPrice += parseInt(price);
        });
        $(".sumPrice").find("em").html("¥" + totalPrice);
    });

    //批量删除
    $(".result").on("click", ".remove-batch", function () {
        var checkboxSelector = $(".item-checkbox:checked");
        var ids = [];
        _.forEach(checkboxSelector, function (checkbox) {
            var id = $(checkbox).data("id");
            ids.push(id);
        });
        if (ids.length > 0) {
            utils.modal.myConfirm("确认删除所选商品？", function (sure) {
                if (sure) {
                    var idStr = ids.join(",");
                    utils.myAjax.get("/front/cart/delete/batch", {ids: idStr}, function (data) {
                        if (data > 0) {
                            /**   商品数字变化   begin**/
                            var total = $("#goods-total").html();
                            $("#goods-total").html(parseInt(total) - checkboxSelector.length); //全部商品数字变化
                            $("#badge").html(parseInt(total) - data);  // 右上角数字变化
                            /**   商品数字变化   end**/
                            /** 总价重新计算 begin **/
                            totalPrice = 0;
                            $(".sumPrice").find("em").html("¥" + totalPrice);
                            /** 总价重新计算 end **/
                            /**  页面重新渲染 begin  **/
                            _.forEach(checkboxSelector, function (checkbox) {
                                var goodsSize = $(checkbox).parents(".cart-store-group").find(".item-full").length;
                                if (goodsSize > 1) {
                                    $(checkbox).parents(".item-full").remove();
                                } else {
                                    $(checkbox).parents(".cart-store-group").prev(".cart-store-name").remove();
                                    $(checkbox).parents(".cart-store-group").remove();
                                }
                                var total = $("#cart-list").find(".cart-store-group").size();
                                if (total < 1) {
                                    $(".result").html("<div class='empty-notice'><span class='empty-span'>购物车空空如也，快去<a href='/front/goodses'>搜索相关宝贝</a>吧~</span></div>");
                                }
                            });
                            /**  页面重新渲染 end  **/
                            /** 已选择商品数字变化  begin**/
                            var checkboxSelect = $(".item-checkbox:checked");
                            var goodsNum = checkboxSelect.length;
                            $(".amount-sum").find("em").html(goodsNum);
                            /** 已选择商品数字变化  end**/
                        }
                    });
                }
            })
        } else {
            utils.modal.myAlert("未选择任何商品.");
        }
    });

    //新增地址弹出框
    $(".result").on("click", "#address-new", function () {
        var cityPickerSelector = $('#city');
        $("#address-new-modal").modal("show");
    });

    // 新增 编辑 地址 事件
    utils.quick.click({
        save: function () {
            $("#address-form").validate({
                rules:{
                    name:{
                        required:true
                    },
                    detail:{
                        required:true
                    },
                    phone:{
                        required:true,
                        phone:true
                    },
                    tel: {
                        tel:true
                    }
                }
            });
            var pass = $("#address-form").valid();
            if (pass) {
                var cityPickerSelector = $('#city');
                var params = $("#address-form").serializeArray();
                var provinceId = cityPickerSelector.data('citypicker').getCode("province");
                var cityId = cityPickerSelector.data('citypicker').getCode("city");
                var districtId = cityPickerSelector.data('citypicker').getCode("district");
                if (typeof provinceId=== 'undefined' || typeof cityId === 'undefined' ||typeof districtId === 'undefined') {
                    utils.modal.myAlert("提示", "请选择省市区");
                    return;
                }
                var nameArray = cityPickerSelector.data('citypicker').getVal().split("/");
                var provinceName = nameArray[0];
                var cityName = nameArray[1];
                var districtName= nameArray[2];
                params.push({"name":"provinceId","value":provinceId});
                params.push({"name":"provinceName","value":provinceName});
                params.push({"name":"cityId","value":cityId});
                params.push({"name":"cityName","value":cityName});
                params.push({"name":"districtId","value":districtId});
                params.push({"name":"districtName","value":districtName});
                utils.myAjax.post("/front/address/add", params, function (data) {
                    var addresses = [];
                    addresses.push(data);
                    if ($("#consignee-list").find("li.address-li").length < 1) {
                        $("#consignee-list").html(addressTemplate({addresses:addresses}));
                    } else {
                        $("#consignee-list").append(addressTemplate({addresses:addresses}));
                    }
                    $("#address-new-modal").modal("hide");
                })
            }
        },
        edit: function () {
            var that = this;
            $("#address-form-edit").validate({
                rules:{
                    name:{
                        required:true
                    },
                    detail:{
                        required:true
                    },
                    phone:{
                        required:true,
                        phone:true
                    },
                    tel: {
                        tel:true
                    }
                }
            });
            var pass = $("#address-form-edit").valid();
            if (pass) {
                var cityPickerSelector = $('#city-edit');
                var params = $("#address-form-edit").serializeArray();
                var provinceId = cityPickerSelector.data('citypicker').getCode("province");
                var cityId = cityPickerSelector.data('citypicker').getCode("city");
                var districtId = cityPickerSelector.data('citypicker').getCode("district");
                if (typeof provinceId=== 'undefined' || typeof cityId === 'undefined' ||typeof districtId === 'undefined') {
                    utils.modal.myAlert("提示", "请选择省市区");
                    return;
                }
                var nameArray = cityPickerSelector.data('citypicker').getVal().split("/");
                var provinceName = nameArray[0];
                var cityName = nameArray[1];
                var districtName= nameArray[2];
                params.push({"name":"provinceId","value":provinceId});
                params.push({"name":"provinceName","value":provinceName});
                params.push({"name":"cityId","value":cityId});
                params.push({"name":"cityName","value":cityName});
                params.push({"name":"districtId","value":districtId});
                params.push({"name":"districtName","value":districtName});
                console.log(params);
                utils.myAjax.post("/front/address/update", params, function (data) {
                    var id = $("#address-edit-id").val();
                    var addresses = [];
                    addresses.push(data);

                    var preLi = $("#" + id).prev("li.address-li");
                    var nextLi;
                    if (preLi.length < 1) {
                        nextLi = $("#" + id).next("li.address-li");
                    }
                    $("#" + id).remove();
                    if(preLi.length > 0) {
                        preLi.after(addressTemplate({addresses:addresses}));
                    } else {
                        nextLi.before(addressTemplate({addresses:addresses}));
                    }
                    $("#address-edit-modal").modal("hide");
                })
            }
        }
    });

    // 鼠标移上事件
    $(".result").on("mouseover", ".address-li", function () {
        $(this).addClass("li-hover");
    });

    // 鼠标移下事件
    $(".result").on("mouseleave", ".address-li", function () {
        $(this).removeClass("li-hover");
    });

    // 删除收获地址
    $(".result").on("click", ".del-consignee", function () {
        utils.modal.myConfirm("确认删除该条收获地址？", function (sure) {
            if (sure) {
                var that = this;
                var id = $(this).parents("li").find(".address-id").val();
                utils.myAjax.get("/front/address/delete", {id:id}, function (data) {
                    if (data > 0) {
                        $(that).parents("li").remove();
                        if ($("#consignee-list").find("li.address-li").length < 1) {
                            $("#consignee-list").html("<li class=\"ui-switchable-panel ui-switchable-panel-selected\">暂无收货地址</li>");
                        }
                    }
                });
            }
        })
    });

    //编辑收获地址
    $(".result").on("click", ".edit-consignee", function () {
        var id = $(this).parents("li").find(".address-id").val();
        utils.myAjax.get("/front/address/" + id, {}, function (data) {
            var editHtml = $("#address-detail").html();
            var editTemplate = Handlebars.compile(editHtml);
            $("#address-edit-form").html(editTemplate(data));
            var cityPickerSelector = $("#city-edit");
            cityPickerSelector.citypicker({
                province: $("#address-province").val(),
                city: $("#address-city").val(),
                district: $("#address-district").val()
            });
            $("#address-edit-modal").modal("show");
        })
    });

    //设为默认地址
    $(".result").on("click", ".setdefault-consignee", function () {
        var that = this;
        var id = $(this).parents("li").find(".address-id").val();
        utils.myAjax.get("/front/address/update/status", {id:id}, function (data) {
            if (data > 0) {
                $("#consignee-list").find(".item-selected").parents("li.address-li").find(".addr-default").addClass("hide");
                $("#consignee-list").find(".item-selected").parents("li.address-li").find(".del-consignee").removeClass("hide");
                $("#consignee-list").find(".item-selected").parents("li.address-li").find(".setdefault-consignee").removeClass("hide");
                $("#consignee-list").find(".item-selected").removeClass("item-selected");
                $(that).parents("li.address-li").find(".consignee-item").addClass("item-selected");
                $(that).parents("li.address-li").find(".del-consignee").addClass("hide");
                $(that).parents("li.address-li").find(".setdefault-consignee").addClass("hide");
                $(that).parents("li.address-li").find(".addr-default").removeClass("hide");
            }
        })
    });

    // 地址选中切换
    $(".result").on("click", ".consignee-item", function () {
        $("#consignee-list").find(".item-selected").removeClass("item-selected");
        var has = $(this).hasClass("item-selected");
        if (!has) {
            $(this).addClass("item-selected");
        }
    });

    //结算
    $(".result").on("click", ".submit-btn", function () {
        //是否选择商品判断
        var selectedGoodsSelector = $(".item-checkbox:checked");
        var goodsNum = selectedGoodsSelector.length;
        if (goodsNum < 1) {
            utils.modal.myAlert("请选择商品再结算");
            return;
        }
        // 是否有货判断
        var has = $("#submit-hidden").val();
        if (!has) {
            utils.modal.myAlert("所选商品部分无货，请重新调整");
            return;
        }
        // 收获地址判断
        var addressSelected = $(".item-selected").length;
        if (addressSelected != 1) {
            utils.modal.myAlert("请保证选择一个收获人信息");
            return;
        }
        // 余额判断
        var payPrice = $(".sumPrice").find("em").html().replace(/[^0-9]/ig, "");
        var balance = $(".myBalance").html().replace(/[^0-9]/ig, "");
        if (parseInt(payPrice) > parseInt(balance)) {
            utils.modal.myAlert("余额不足，无法结算");
            return;
        }
        var goodsArray = [];
        _.forEach(selectedGoodsSelector, function (checkbox) {
            var goodsNum = $(checkbox).parents(".item-full").find(".goods-count").val();
            var goodsPrice = $(checkbox).parents(".item-full").find(".p-price").find("strong").html().replace(/[^0-9]/ig, "");
            var totalPrice = $(checkbox).parents(".item-full").find(".total-price").html().replace(/[^0-9]/ig, "");
            var goodsId = $(checkbox).parents(".item-full").find(".goods-id").val();
            var goodsName = $(checkbox).parents(".item-full").find(".goods-name").val();
            var goodsImg = $(checkbox).parents(".item-full").find(".goods-img").val();
            var goods = {
                goodsId:goodsId, goodsNum:goodsNum, goodsPrice:goodsPrice,
                goodsName:goodsName, goodsImg:goodsImg
            };
            goodsArray.push(goods);
        });
        var addressId = $(".result").find(".item-selected").parents("li.address-li").find(".address-id").val();
        var username = $(".result").find(".item-selected").find("span").html(); // 收货人
        var order = {
            price:payPrice, addressId:addressId,receiveName:username,
            goodsList:goodsArray
        };
        $.ajax({
            url:"/front/order/state",
            type:"post",
            contentType:"application/json",
            dataType:"json",
            data:JSON.stringify(order),
            success: function (data) {
                if (data.code == 200) {
                    window.location.href = "/front/orders";
                } else {
                    utils.modal.myAlert(data.message);
                }
            }
        })


    });

});