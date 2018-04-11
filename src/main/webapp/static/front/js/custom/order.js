$(function () {
    window.pagination;
    window.currentPage = 1;
    window.size = 5;
    window.pageData;
    var results;
    var html = $("#orders-list").html();
    var template = Handlebars.compile(html);
    var tableSelector = $(".results");
    // 请求 订单
    utils.myAjax.post("/front/orders", {}, function (data) {
        results = data.result;
        refresh(template, results);
    });

    tableSelector.on("click", ".delete-action", function () {
        var that = this;
        var orderId = $(this).parents("tbody").find(".order-id").val();
        utils.myAjax.get("/front/orders/delete", {id: orderId}, function (data) {
            if (data > 0) {
                results = _.reject(results, function (obj) {
                    return obj.id === parseInt(orderId);
                });
                $(that).parents("tbody").remove();
                var size = $("#order-table").find("tbody").length;
                if (size < 1) {
                    if (window.currentPage === 1) {
                        $(".results").html("<div class='not-found'> </div><div style='text-align: center'><strong>暂无订单信息</strong></div>")
                    }else {
                        window.currentPage -= 1;
                        refresh(template, results);
                    }
                } else {
                    refresh(template, results);
                }
            }
        });
    });

    tableSelector.on("click", ".receive-action", function () {
        var that = this;
        var orderId = $(this).parents("tbody").find(".order-id").val();
        utils.myAjax.get("/front/orders/receive", {id: orderId}, function (data) {
            if (data > 0) {
                $(that).parents("tbody").find("td.order-status").html("已完成");
                $(that).parents("tbody").find("a.receive-action").addClass("hide");
            }
        });
    });
});

function refresh(template, data) {
    renderPage(template, data);
    if (typeof window.pagination !== 'undefined') {
        $("#orders-pages").bootstrapPaginator("destroy");
    }
    if (data.length > window.size) {
        var totalSize = data.length;
        var totalPage = Math.ceil(totalSize / window.size);
        var options = {
            bootstrapMajorVersion: 3,
            totalPages: totalPage,
            currentPage: window.currentPage,
            // size: 'small',
            numberOfPages: 5,
            onPageClicked: function (event, originalEvent, type, page) {
                window.currentPage = page;
                renderPage(template, data);
            },
            shouldShowPage: function (type) {
                switch (type) {
                    case "first":
                    case "last":
                        return false;
                    default:
                        return true;
                }
            }
        };
        window.pagination = $("#orders-pages").bootstrapPaginator(options);
    }
}

function renderPage(template, data) {
    var start = window.size * (window.currentPage - 1);
    var end = window.size * window.currentPage - 1;
    window.pageData = data.slice(start, end + 1);
    _.forEach(window.pageData, function (order) {
        order.goodsSize = order.goodsList.length;
        _.forEach(order.goodsList, function (goods) {
            if (goods.goodsName.length > 10) {
                goods.omitName = goods.goodsName.substr(0, 10) + "..."
            } else {
                goods.omitName = goods.goodsName;
            }
            goods.totalPrice = goods.goodsNum * goods.goodsPrice
        })
    });

    $(".results").html(template({orders: window.pageData}));
    $('[data-toggle="tooltip"]').tooltip();
}