$(function() {
    $('#roll').unslider({
        autoplay: true,  //自动播放
        arrows: false,  //显示“Prev”和“Next”的箭头
        delay: 3000
    });
    
    utils.quick.click({
        // 商品搜索
        goodsSearch:function () {
            var goodsName = $("#goods-name").val();
            window.location.href = "/front/goodses?name=" + goodsName;
        },
        //专卖店搜索
        storeSearch:function () {
            var storeName = $("#store-name").val();
            window.location.href = "/front/stores?name=" + storeName;
        }
    })
})