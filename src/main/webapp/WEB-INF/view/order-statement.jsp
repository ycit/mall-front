<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>商品详情</title>
    <meta charset="utf-8">
    <link href="${ctx}/static/front/css/cart.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="page-content" style="min-height:1318px">
    <div class="page-bar">
        <ul class="page-breadcrumb">
            <li>
                <a href="${ctx}/front/index">首页</a>
                <i class="fa fa-circle"></i>
            </li>
            <li>
                <span>购物车</span>
            </li>
        </ul>
    </div>
    <div class="portlet light">
        <div class="portlet-body result">
            <%--<div class="caption cart-full">--%>
            <%--<span class="caption-subject bold font-grey-gallery"> 全部商品 </span>--%>
            <%--<span id="goods-total"></span>--%>
            <%--</div>--%>
            <%--<div class="cart-head">--%>
            <%--<div class="column t-checkbox">--%>
            <%--<div class="cart-checkbox"><input type="checkbox" class="check-all"></div>--%>
            <%--全选--%>
            <%--</div>--%>
            <%--<div class="column t-goods">商品</div>--%>
            <%--<div class="column t-props"></div>--%>
            <%--<div class="column t-price">单价</div>--%>
            <%--<div class="column t-quantity">数量</div>--%>
            <%--<div class="column t-sum">小计</div>--%>
            <%--<div class="column t-action">操作</div>--%>
            <%--</div>--%>
            <%--<div class="portlet" id="cart-list">--%>
            <%--</div>--%>
            <%--<div id="cart-floatbar">--%>
            <%--<div style="width: 990px;height: 52px;">--%>
            <%--<div class="cart-toolbar">--%>
            <%--<div class="toolbar-wrap">--%>
            <%--<div class="options-box">--%>
            <%--<div class="select-all">--%>
            <%--<div class="cart-checkbox"><input type="checkbox" class="check-all checkbox"></div>--%>
            <%--全选--%>
            <%--</div>--%>
            <%--<div class="operation"><a class="remove-batch">删除选中的商品</a></div>--%>
            <%--<div class="toolbar-right">--%>
            <%--<div class="normal">--%>
            <%--<div class="comm-right">--%>
            <%--<div class="btn-area"><a class="submit-btn">去结算</a></div>--%>
            <%--<div class="price-sum">--%>
            <%--<div>--%>
            <%--<span class="txt txt-new">总价：</span>--%>
            <%--<span class="price sumPrice"><em>¥0</em></span>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="amount-sum">--%>
            <%--已选择<em>0</em>件商品<b class="up"></b>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<script type="text/html" id="cart">
    <div class="caption cart-full">
        <span class="caption-subject bold font-grey-gallery"> 全部商品 </span>
        <span id="goods-total">{{total}}</span>
    </div>
    <div class="cart-head">
        <input type="hidden" id="submit-hidden" value="true"/>
        <div class="column t-checkbox">
            <div class="cart-checkbox"><input type="checkbox" class="check-all"></div>
            全选
        </div>
        <div class="column t-goods">商品</div>
        <div class="column t-props"></div>
        <div class="column t-price">单价</div>
        <div class="column t-quantity">数量</div>
        <div class="column t-sum">小计</div>
        <div class="column t-action">操作</div>
    </div>
    <div class="portlet" id="cart-list">
        {{#each carts}}
        <div class="portlet-title cart-store-name">
            <div class="caption">
                <span class="">{{name}}</span>
            </div>
        </div>
        <div class="portlet-body cart-store-group">
            <div class="cart-list">
                {{#each cartVos}}
                <div class="item-full">
                    <input class="cart-id" type="hidden" value="{{id}}">
                    <input class="goods-price" type="hidden" , value="{{goods.price}}">
                    <input class="goods-stock" type="hidden" , value="{{goods.stock}}">
                    <div class="item">
                        <div class="item-form">
                            <div class="cell p-checkbox">
                                <div class="cart-checkbox">
                                    <input type="checkbox" class="item-checkbox" data-id="{{id}}">
                                </div>
                            </div>
                            <div class="cell p-goods">
                                <div class="goods-item">
                                    <div class="p-img"><img src="{{goods.img}}"/></div>
                                    <div class="item-msg">
                                        <div class="p-name">{{goods.name}}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="cell p-props">
                                <div>种类:{{#if goods.categoryName}}{{goods.categoryName}}{{else}}未知{{/if}}</div>
                                <div>适用车型:{{#if goods.purposeName}}{{goods.purposeName}}{{else}}未知{{/if}}</div>
                                <div>型号:{{#if goods.model}}{{goods.model}}{{else}}未知{{/if}}</div>
                            </div>
                            <div class="cell p-price">
                                <strong>￥{{goods.price}}</strong>
                            </div>
                            <div class="cell p-quantity">
                                <div class="quantity-form">
                                    <input type="text" class="input-xsmall goods-count" value="{{goodsCount}}">
                                </div>
                                <div class="quantity-text">有货</div>
                                <div></div>
                            </div>
                            <div class="cell p-sum"><strong class="total-price">¥{{totalPrice}}</strong></div>
                            <div class="cell p-ops"><a class="cart-a"><i class="fa fa-x fa-trash-o">删除</i></a></div>
                        </div>
                    </div>
                </div>
                {{/each}}
            </div>
        </div>
        {{/each}}
    </div>
    <div id="cart-floatbar">
        <div style="width: 990px;height: 52px;">
            <div class="cart-toolbar">
                <div class="toolbar-wrap">
                    <div class="options-box">
                        <div class="select-all">
                            <div class="cart-checkbox"><input type="checkbox" class="check-all checkbox"></div>
                            全选
                        </div>
                        <div class="operation"><a class="remove-batch">删除选中的商品</a></div>
                        <div class="toolbar-right">
                            <div class="normal">
                                <div class="comm-right">
                                    <div class="btn-area"><a class="submit-btn">去结算</a></div>
                                    <div class="price-sum">
                                        <div>
                                            <span class="txt txt-new">总价：</span>
                                            <span class="price sumPrice"><em>¥0</em></span>
                                        </div>
                                    </div>
                                    <div class="amount-sum">
                                        已选择<em>0</em>件商品<b class="up"></b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>


<script src="${ctx}/static/front/js/custom/cart.js" type="text/javascript"></script>

</body>
</html>