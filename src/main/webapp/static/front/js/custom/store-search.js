$(function () {
    window.paginator;
    var cityPickerSelector = $('#city');
    cityPickerSelector.citypicker();
    var temp = $("#store-result").html();
    var name = $("#store-name").val();
    var brandId = $("#store-brand").val();
    var provinceId = cityPickerSelector.data('citypicker').getCode("province");
    var cityId = cityPickerSelector.data('citypicker').getCode("city");
    var districtId = cityPickerSelector.data('citypicker').getCode("district");
    if (typeof provinceId === 'undefined') {
        provinceId = "";
    }
    if (typeof cityId === 'undefined') {
        cityId = "";
    }
    if (typeof districtId === 'undefined') {
        districtId = "";
    }
    var params = {
        name:name, brandId:brandId, provinceId:provinceId,
        cityId:cityId, districtId:districtId
    };
    search(params, temp);
    utils.quick.click({
        search:function () {
            params.name = $("#store-name").val();
            params.provinceId = cityPickerSelector.data('citypicker').getCode("province");
            params.cityId = cityPickerSelector.data('citypicker').getCode("city");
            params.districtId = cityPickerSelector.data('citypicker').getCode("district");
            params.brandId = $("#store-brand").val();
            search(params, temp);
        }
    });

});

function  search(params, temp) {
    utils.myAjax.post("/front/stores", params, function (data) {
        var html;
        if (data.length < 1) {
            if (typeof window.paginator !== "undefined") {
                $("#pages").bootstrapPaginator("destroy");
            }
            html = "<div class='not-found'> </div><div style='text-align: center'><strong>未找到相关专卖店</strong></div>";
            $(".store-results").html(html);
            return;
        }
        _.each(data, function (store) {
            var brandArray = store.brands;
            var brands = _.pluck(brandArray, "brandName").join("、");
            store.brands = brands;
            store.address = (store.provinceName === null ? "":store.provinceName )
                + (store.cityName === null? "" : store.cityName )
                +(store.districtName === null ? "" : store.districtName)
                + (store.addressDetail === null ? "" : store.addressDetail);
            console.log(store.brands)
        })
        var template = Handlebars.compile(temp);
        html = template(data);
        $(".store-results").html(html);
        var totalSize = data.length;
        var size = 5;
        var totalPage = Math.ceil(totalSize / size);
        var currentPage = 1;
        var that = this;
        var options = {
            bootstrapMajorVersion: 3,
            totalPages: totalPage,
            currentPage: that.currentPage,
            // size: 'small',
            numberOfPages: 5,
            onPageClicked: function(event, originalEvent, type, page) {
                that.currentPage = page;
            },
            shouldShowPage: function(type) {
                switch (type) {
                    case "first":
                    case "last":
                        return false;
                    default:
                        return true;
                }
            },
            // itemTexts: function(type, page) {
            //     switch (type) {
            //         case "first":
            //         case "last":
            //             return false;
            //         case "prev":
            //             return "前一页";
            //         case "next":
            //             return "后一页";
            //         case "page":
            //             return page;
            //     }
            // },
            // tooltipTitles: function(type, page) {
            //     switch (type) {
            //         case "first":
            //         case "last":
            //             return false;
            //         case "prev":
            //             return "前一页";
            //         case "next":
            //             return "后一夜";
            //         case "page":
            //             return "第 " + page + "页";
            //     }
            // }
        };
        window.paginator = $("#pages").bootstrapPaginator(options);
    });
}