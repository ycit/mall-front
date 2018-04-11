<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>购物车</title>
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
        <input type="hidden" value="${user.balance}" id="user-balance">
        <div class="portlet-body result">
        </div>
    </div>
</div>
<!--     bootstrap modal          -->
<div class="modal fade" id="address-new-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增收货地址</h4>
            </div>
            <div class="modal-body">

                <div class="portlet light bordered">
                    <div class="portlet-body form">
                        <form role="form" class="form-horizontal" id="address-form">
                            <div class="form-body">
                                <div class="form-group form-md-line-input">
                                    <label class="col-md-2 control-label">所在地区</label>
                                    <div class="col-md-10">
                                        <input id="city" readonly type="text" placeholder="请选择省/市/区"
                                               data-toggle="city-picker" data-responsive="true" style="width:50%;">
                                        <%--<input type="text" class="form-control" placeholder="Enter your name">--%>
                                        <div class="form-control-focus"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">收货人</label>
                                    <div class="col-md-10">
                                        <input type="text" name="name" class="form-control">
                                        <div class="form-control-focus"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">详细地址</label>
                                    <div class="col-md-10">
                                        <input type="text" name="detail" class="form-control">
                                        <div class="form-control-focus"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">手机号码</label>
                                    <div class="col-md-10">
                                        <input type="text" name="phone" class="form-control">
                                        <div class="form-control-focus"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">固定号码</label>
                                    <div class="col-md-10">
                                        <input type="text" name="tel" class="form-control">
                                        <div class="form-control-focus"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-10">
                                        <button data-click="save" type="button" class="btn blue">保存收货人信息</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" data-click="add">新增</button>--%>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="address-edit-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑收货地址</h4>
            </div>
            <div class="modal-body">
                <div class="portlet light bordered">
                    <div class="portlet-body form">
                        <form role="form" class="form-horizontal" id="address-form-edit">
                            <div class="form-body" id="address-edit-form">

                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-10">
                                        <button data-click="edit" type="button" class="btn blue">保存收货人信息</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" data-click="add">新增</button>--%>
            </div>
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
                    <input class="goods-id" type="hidden" value="{{goods.id}}">
                    <input class="goods-name" type="hidden" value="{{goods.name}}">
                    <input class="goods-img" type="hidden" value="{{goods.img}}">
                    <input class="goods-price" type="hidden" value="{{goods.price}}">
                    <input class="goods-stock" type="hidden" value="{{goods.stock}}">
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
    <div class="portlet">
        <div class="portlet-body">
            <div class="checkout-steps">
                <div class="step-tit">
                    <h3>收货人信息</h3>
                    <div class="extra-r"><a class="ftx-05" id="address-new">新增收货地址</a></div>
                </div>
                <div class="step-cont">
                    <div class="consignee-content">
                        <div class="ui-scrollbar-wrap">
                            <div class="consignee-scrollbar">
                                <div class="ui-scrollbar-main">
                                    <div class="consignee-scroll">
                                        <div class="consignee-cont">
                                            <ul id="consignee-list">

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
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
                                    <div class="btn-area"><a class="submit-btn">结算</a></div>
                                    <div class="price-sum">
                                        <div>
                                            <span class="txt txt-new">总价：</span>
                                            <span class="price sumPrice"><em>¥0</em></span>
                                            <br>
                                            <span class="txt">我的金钱：</span>
                                            <span class="price myBalance">¥{{balance}}</span>
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

<script type="text/html" id="address">
    {{#if addresses}}
    {{#each addresses}}
    <li class="ui-switchable-panel ui-switchable-panel-selected address-li" id="{{id}}">
        <input type="hidden" value="{{id}}" class="address-id">
        <div class="consignee-item {{#compare defaultAddr '==' 1}}item-selected{{/compare}}">
            <span>{{name}}</span><b></b>
        </div>
        <div class="addr-detail">
            <span class="addr-name" title="{{name}}">{{name}}</span>
            <span class="addr-info"
                  title="{{provinceName}} {{cityName}} {{districtName}} {{detail}}">{{provinceName}} {{cityName}} {{districtName}} {{detail}}</span>
            <span class="addr-tel">{{phone}}</span>

            <span class="addr-default {{#compare defaultAddr '==' 0}}hide{{/compare}}">默认地址</span>

        </div>
        <div class="op-btns">
            <span></span>

            <a href="#none" class="ftx-05 setdefault-consignee {{#compare defaultAddr '==' 1}}hide{{/compare}}">设为默认地址</a>

            <a href="#none" class="ftx-05 edit-consignee">编辑</a>

            <a href="#none" class="ftx-05 del-consignee {{#compare defaultAddr '==' 1}}hide{{/compare}}">删除</a>

        </div>
    </li>
    {{/each}}
    {{else}}
    <li class="ui-switchable-panel ui-switchable-panel-selected">暂无收货地址</li>
    {{/if}}
</script>

<script type="text/html" id="address-detail">
    <div class="form-group form-md-line-input">
        <input type="hidden" name="id" value="{{id}}" id="address-edit-id">
        <input type="hidden" value="{{provinceName}}" id="address-province">
        <input type="hidden" value="{{cityName}}" id="address-city">
        <input type="hidden" value="{{districtName}}" id="address-district">
        <label class="col-md-2 control-label">所在地区</label>
        <div class="col-md-10">
            <input id="city-edit" readonly type="text" placeholder="请选择省/市/区"
                   data-toggle="city-picker" data-responsive="true" style="width:50%;">
            <div class="form-control-focus"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label">收货人</label>
        <div class="col-md-10">
            <input type="text" value="{{name}}" name="name" class="form-control">
            <div class="form-control-focus"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label">详细地址</label>
        <div class="col-md-10">
            <input type="text" value="{{detail}}" name="detail" class="form-control">
            <div class="form-control-focus"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label">手机号码</label>
        <div class="col-md-10">
            <input type="text" value="{{phone}}" name="phone" class="form-control">
            <div class="form-control-focus"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label">固定号码</label>
        <div class="col-md-10">
            <input type="text" value="{{tel}}" name="tel" class="form-control">
            <div class="form-control-focus"></div>
        </div>
    </div>
</script>


<script src="${ctx}/static/front/js/custom/cart.js" type="text/javascript"></script>

</body>
</html>