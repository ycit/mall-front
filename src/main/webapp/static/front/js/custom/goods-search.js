$(function () {
    window.cube;
    window.pagination;
    window.currentPage = 1;
    window.size = 24;
    window.pageData;
    var temp = $("#goods-result").html();
    var name = $("#goods-name").val();
    var brandId = $("#goods-brand").val();
    var category = $("#goods-category").val();
    var usage = $("#goods-usage").val();
    var minPrice = $("#goods-minPrice").val();
    var maxPrice = $("#goods-maxPrice").val();
    var params = {
        name: name, brandId: brandId, category: category,
        purpose: usage, minPrice: minPrice, maxPrice: maxPrice
    };
    search(params, temp);
    utils.quick.click({
        search: function () {
            params.name = $("#goods-name").val();
            params.category = $("#goods-category").val();
            params.purpose = $("#goods-usage").val();
            params.minPrice = $("#goods-minPrice").val();
            params.maxPrice = $("#goods-maxPrice").val();
            params.brandId = $("#goods-brand").val();
            $("#js-grid-juicy-projects").html();
            search(params, temp);
        },
        reset: function () {
            $("#goods-name").attr("value","");
        }
    });

});

function search(params, temp) {
    utils.myAjax.post("/front/goodses", params, function (data) {
        var html;
        if (data.length < 1) {
            if (typeof window.pagination !== 'undefined') {
                $("#goods-pages").bootstrapPaginator("destroy");
            }
            cubeInit();
            html = "<div class='not-found'> </div><div style='text-align: center'><strong>未找到相关商品</strong></div>";
            $("#js-grid-juicy-projects").html(html);
            return;
        }
        var totalSize = data.length;
        var totalPage = Math.ceil(totalSize / window.size);
        renderPage(temp, data);
        cubeInit();
        var that = this;
        var options = {
            bootstrapMajorVersion: 3,
            totalPages: totalPage,
            currentPage: that.currentPage,
            // size: 'small',
            numberOfPages: 5,
            onPageClicked: function (event, originalEvent, type, page) {
                window.currentPage = page;
                renderPage(temp, data);
                cubeInit();
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
        window.pagination = $("#goods-pages").bootstrapPaginator(options);
    });
};

function cubeInit() {
    if (typeof window.cube !== "undefined") {
        window.cube.cubeportfolio("destroy");
    }
    window.cube = $('#js-grid-juicy-projects').cubeportfolio({
        // filters: '#js-filters-juicy-projects',
        loadMore: '#js-loadMore-juicy-projects',
        loadMoreAction: 'click',
        layoutMode: 'grid',
        // defaultFilter: '*',
        animationType: 'quicksand',
        gapHorizontal: 35,
        gapVertical: 30,
        gridAdjustment: 'responsive',
        mediaQueries: [{
            width: 900,
            cols: 5
        }, {
            width: 720,
            cols: 4
        }, {
            width: 540,
            cols: 3
        }, {
            width: 360,
            cols: 2
        }, {
            width: 180,
            cols: 1
        }],
        caption: '',

        // lightbox
        lightboxDelegate: '.cbp-lightbox',
        lightboxGallery: true,
        lightboxTitleSrc: 'data-title',
        lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>',
    });
}

function renderPage(temp, data) {
    var start = window.size * (window.currentPage - 1);
    var end = window.size * window.currentPage - 1;
    window.pageData = data.slice(start, end + 1);
    _.forEach(window.pageData, function (goods) {
        var omitName = goods.name.length > 27 ? goods.name.substr(0, 27) + "..." : goods.name;
        goods.omitName = omitName;
    })
    var template = Handlebars.compile(temp);
    var html = template(window.pageData);
    $("#js-grid-juicy-projects").html(html);
    $('[data-toggle="tooltip"]').tooltip();
}