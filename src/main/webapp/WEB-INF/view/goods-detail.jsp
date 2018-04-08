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
    <link href="${ctx}/static/front/css/goos-detail.css" rel="stylesheet" type="text/css"/>
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
                <a href="${ctx}/front/goodses">商品搜索</a>
                <i class="fa fa-circle"></i>
            </li>
            <li>
                <span>商品详情</span>
            </li>
        </ul>
        <div class="store-info pull-right">
            <a href="${ctx}/front/stores?name=${goods.storeName}">${goods.storeName}</a>
        </div>
    </div>
    <div class="portlet">
        <%--<div class="portlet-title">--%>
            <%--<div class="actions">--%>
                <%--<a>${goods.storeName}</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="portlet-body" style="padding: 10px 20px 10px 20px;">
            <div class="row">
                <div class="col-md-4">
                    <div class="preview-wrap">
                        <div class="preview">
                            <div class="main-img">
                                <img src="${goods.img}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="itemInfo-wrap">
                        <div class="sku-name">${goods.name}</div>
                        <div class="summary">
                            <div class="summary-info-wrap">
                                <div class="info1">
                                    <div class="dt">价&nbsp;&nbsp;格</div>
                                    <div class="dd">
                                        <span class="p-price"><span>￥</span><span class="price">${goods.price}</span></span>
                                    </div>
                                </div>
                                <div class="sale-info">
                                    <div class="sale-count">
                                        <p class="sale">累计销量</p>
                                        <label class="count">${goods.saleCount}</label>
                                    </div>
                                </div>
                                <div class="info1">
                                    <div class="dt">规&nbsp;&nbsp;格</div>
                                    <div class="dd">
                                        <span>
                                        <c:if test="${goods.length != null}">${goods.length}</c:if>
                                        <c:if test="${goods.length == null}">未知</c:if>
                                        </span><span>&nbsp;x&nbsp;</span>
                                        <span>
                                        <c:if test="${goods.width != null}">${goods.width}</c:if>
                                        <c:if test="${goods.width == null}">未知</c:if>
                                        </span><span>&nbsp;x&nbsp;</span>
                                        <span>
                                        <c:if test="${goods.height != null}">${goods.height}</c:if>
                                        <c:if test="${goods.height == null}">未知</c:if>
                                        </span><span>&nbsp;cm</span>
                                    </div>
                                </div>
                                <div class="info1">
                                    <div class="dt">型&nbsp;&nbsp;号</div>
                                    <div class="dd">
                                        <c:if test="${goods.model != null}">${goods.model}</c:if>
                                        <c:if test="${goods.model == null}">未知</c:if>
                                    </div>
                                </div>
                                <div class="info1">
                                    <div class="dt">种&nbsp;&nbsp;类</div>
                                    <div class="dd">
                                        <c:if test="${goods.categoryName != null}">${goods.categoryName}</c:if>
                                        <c:if test="${goods.categoryName == null}">未知</c:if>
                                    </div>
                                </div>
                                <div class="info1">
                                    <div class="dt">适用车型</div>
                                    <div class="dd">
                                        <c:if test="${goods.purposeName != null}">${goods.purposeName}</c:if>
                                        <c:if test="${goods.purposeName == null}">未知</c:if>
                                    </div>
                                </div>
                                <div class="info1">
                                    <div class="dt">容&nbsp;&nbsp;量</div>
                                    <div class="dd">
                                        <c:if test="${goods.capacity != null}">${goods.capacity} A.H</c:if>
                                        <c:if test="${goods.capacity == null}">未知</c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form id="buy-form">
                            <input id="goods-stock" type="hidden" value="${goods.stock}">
                            <input id="goods-id" type="hidden" value="${goods.id}">
                            <input id="username" type="hidden" value="<shiro:principal/>">
                            <input id="store-id" type="hidden" value="${goods.storeId}">
                            <div class="amount">
                                <div class="dt">购买数量</div>
                                <div class="a-amount">
                                    <input id="amount-input" class="amount-input" type="text" name="amount" value="1">
                                </div>
                                <em>库存${goods.stock}件</em>
                                <span id="notice" class="notice hide"><i class="fa fa-x fa-minus-circle"></i>购买数量超出库存数量！</span>
                            </div>
                            <div class="goods-action">
                                <button id="cart" data-click="cart" type="button" class="btn">加入购物车</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="alert-notice-wrap hide">
        <div class="alert-notice">
            <span class="glyphicon glyphicon-ok"> </span>
            <div>加入购物车成功</div>
        </div>
    </div>
</div>


<script src="${ctx}/static/front/js/custom/goods-detail.js" type="text/javascript"></script>

</body>
</html>