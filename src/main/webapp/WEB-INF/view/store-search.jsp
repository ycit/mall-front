<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>店铺查询</title>
    <meta charset="utf-8">
    <link href="${ctx}/static/front/css/store-search.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="page-content" style="min-height:1318px">
    <div class="page-bar" style="min-height: 61px;border-bottom: 1px #e1e1e1 solid!important;">
        <ul class="page-breadcrumb">
            <li>
                <a href="${ctx}/front/index">首页</a>
                <i class="fa fa-circle"></i>
            </li>
            <li>
                <span>专卖店搜索</span>
            </li>
        </ul>
    </div>
    <div class="portlet light bordered"  style="margin-top: 10px;border:1px #e1e1e1 solid !important;">
        <div class="portlet-body form">
            <form id="store-form" class="form-horizontal" role="form" enctype="multipart/form-data">
                <div class="form-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label">专卖店名称</label>
                        <div class="col-md-9">
                            <input type="text" id="store-name" name="name" class="form-control" value="${name}" placeholder="输入专卖店名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">地址</label>
                        <div class="col-md-9">
                            <input id="city" readonly type="text" placeholder="请选择省/市/区" data-toggle="city-picker" data-responsive="true" style="width:50%;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">经营品牌</label>
                        <div class="col-md-9">
                            <select id="store-brand" class="form-control input-small" name="brandId">
                                <c:if test="${brands != null && brands.size() > 0}">
                                    <option value="">全部</option>
                                    <c:forEach items="${brands}" var="brand">
                                        <option value="${brand.id}">${brand.name}</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${brands == null || brands.size() == 0}">
                                    <option value="">暂无可选品牌</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3"></label>
                        <div class="col-md-9">
                            <button data-click="search" type="button" class="btn green">搜索</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="portlet store-results">
    </div>
    <div  style="text-align: center">
        <ul id="pages" class="pagination-store"></ul>
    </div>
</div>
<script type="text/html" id="store-result">
    {{#each this}}
    <div class="portlet-body">
        <div class="row">
            <div class="store-img item">
                <img src="{{#if img}} {{img}} {{else}} ${ctx}/static/front/img/store.jpg{{/if}}"/>
            </div>
            <div class="store-txt item">
                <span class="item-name">{{name}}</span>
                <span>主营品牌:{{brands}}</span>
                <span>联系电话:{{tel}}</span>
                <span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:{{address}}</span>
            </div>
        </div>
    </div>
    {{/each}}
</script>


<script src="${ctx}/static/front/js/custom/store-search.js" type="text/javascript"></script>

</body>
</html>