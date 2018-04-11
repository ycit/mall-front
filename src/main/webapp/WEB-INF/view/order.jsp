<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>我的订单</title>
    <meta charset="utf-8">
    <link href="${ctx}/static/front/css/order.css" rel="stylesheet" type="text/css"/>
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
                <span>我的订单</span>
            </li>
        </ul>
    </div>
    <div class="portlet light">
        <div class="portlet-body results">
        </div>
        <div style="text-align: center">
            <ul id="orders-pages" class="pagination-goods"></ul>
        </div>
    </div>
</div>

<script type="text/html" id="orders-list">
    {{#if orders}}
    <table class="table table-bordered no-footer" id="order-table">
        <thead>
        <th colspan="3" style="text-align: center">订单详情</th>
        <th>收货人</th>
        <th>总金额</th>
        <th>状态</th>
        <th>操作</th>
        </thead>
        {{#each orders}}
        <tbody>
        <input type="hidden" class="order-id" value="{{id}}"/>
        <tr class="sep-row">
            <td colspan="7"></td>
        </tr>
        <tr class="tr-th">
            <td colspan="7">
                <span class="gap"></span>
                <span class="dealtime" title="2018-02-20 09:58:28">{{#time createTime}}{{/time}}</span>
                <input type="hidden" value="2018-02-20 09:58:28">
                <span class="number">订单号：{{code}}</span>
            </td>
        </tr>
        {{#each goodsList}}
        <tr>
            <input type="hidden" class="order-goods-id" value="{{id}}"/>
            <td>
                <img class="" src="{{goodsImg}}" title="{{goodsName}}" width="60" height="60">
            </td>
            <td><div data-toggle="tooltip" data-placement="top" title="{{goodsName}}">{{omitName}}</div></td>
            <td>x{{goodsNum}}</td>
            <td>{{../receiveName}}</td>
            {{#compare @index '==' 0}}
            <td rowspan="{{../goodsSize}}" style="vertical-align: middle">¥{{../price}}</td>
            {{/compare}}
            {{#compare @index '==' 0}}
            <td class="order-status" rowspan="{{../goodsSize}}" style="vertical-align: middle">{{#compare ../status '==' 0}}待发货{{/compare}}{{#compare ../status '==' 1}}待签收{{/compare}}{{#compare ../status '==' 2}}已完成{{/compare}}</td>
            {{/compare}}
            {{#compare @index '==' 0}}
            <td rowspan="{{../goodsSize}}" style="vertical-align: middle">
                <a class="receive-action {{#compare ../status '!=' 1}}hide{{/compare}}" title="确认收货" data-id="{{id}}">
                    <i class="fa fa-envelope"></i>
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="delete-action" title="删除" data-id="{{id}}">
                    <i class="fa fa-x fa-trash-o"></i>
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            {{/compare}}
        </tr>
        {{/each}}
        </tbody>
        {{/each}}
    </table>
    {{else}}
    <div class='not-found'> </div><div style='text-align: center'><strong>暂无订单信息</strong></div>
    {{/if}}
</script>



<script src="${ctx}/static/front/js/custom/order.js" type="text/javascript"></script>

</body>
</html>