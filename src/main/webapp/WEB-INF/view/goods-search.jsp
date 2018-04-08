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
    <link href="${ctx}/static/front/css/goods-search.css" rel="stylesheet" type="text/css"/>
    <%--<link href="${ctx}/static/front/css/search-condition.css" rel="stylesheet" type="text/css"/>--%>
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
                <span>商品搜索</span>
            </li>
        </ul>
    </div>
    <div class="portlet">
        <div class="portlet-body">
            <form>
                <table class="table">
                    <tbody>
                    <tr class="row-tr" id="tags-tr">
                        <td class="odd">
                            <span> 商品名称 </span>
                        </td>
                        <td class="even">
                            <input id="goods-name" type="text" class="form-control input-small" value="${name}">
                        </td>
                        <td class="odd">
                            <span> 品牌 </span>
                        </td>
                        <td class="even">
                            <select id="goods-brand" class="form-control input-small" name="brandId">
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
                        </td>
                    </tr>
                    <tr class="row-tr">
                        <td class="odd">
                            <span> 种类 </span>
                        </td>
                        <td class="even">
                            <select id="goods-category" class="form-control input-small" name="categoryId">
                                <c:if test="${categories != null && categories.size() > 0}">
                                    <option value="">全部</option>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${categories == null || categories.size() == 0}">
                                    <option value="0">暂无可选种类</option>
                                </c:if>
                            </select>
                        </td>
                        <td class="odd">
                            <span> 用途 </span>
                        </td>
                        <td class="even">
                            <select id="goods-usage" class="form-control input-small" name="purposeId">
                                <c:if test="${usages != null && usages.size() > 0}">
                                    <option value="">全部</option>
                                    <c:forEach items="${usages}" var="usage">
                                        <option value="${usage.id}">${usage.name}</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${usages == null || usages.size() == 0}">
                                    <option value="0">暂无可选专卖店</option>
                                </c:if>
                            </select>
                        </td>
                    </tr>
                    <tr class="row-tr">
                        <td class="odd">
                            <span> 价格 </span>
                        </td>
                        <td class="even">
                            <input id="goods-minPrice" type="text" class="form-control input-xsmall pull-left">
                            <span class="pull-left" style="margin:0 5px">-</span>
                            <input id="goods-maxPrice" type="text" class="form-control input-xsmall pull-left">
                        </td>
                        <td class="odd"></td>
                        <td class="">
                            <button data-click="search" type="button" class="btn blue">搜索</button>
                            <button data-click="reset" type="reset" class="btn default">重置</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <div class="portlet">
        <div id="js-grid-juicy-projects" class="cbp">
        </div>
    </div>
    <div style="text-align: center">
        <ul id="goods-pages" class="pagination-goods"></ul>
    </div>
</div>
<script type="text/html" id="goods-result">
    {{#each this}}
    <div class="cbp-item graphic">
        <div class="cbp-caption">
            <div class="cbp-caption-defaultWrap">
                <a href="/front/goodses/{{id}}/detail">
                    <img src="{{#if thumbnail}} {{thumbnail}} {{else}} ${ctx}/static/front/img/bad.jpg{{/if}}" alt="{{name}}">
                </a>
            </div>
        </div>
        <div class="cbp-l-grid-projects-title"><strong
                class="pull-left price"><em>￥</em><i>{{price}}</i></strong><strong
                class="pull-right">已售<a>{{saleCount}}</a></strong></div>
        <div class="">
            <a href="/front/goodses/{{id}}/detail" data-toggle="tooltip" data-placement="top" title="{{name}}">
                <div class="goods-name">{{omitName}}</div>
            </a>
        </div>
        <div class="cbp-l-grid-projects-desc">
            <span class="pull-left">{{store.name}}</span>
            <span class="pull-right" data-id="{{store.id}}"><a>同品牌专卖店</a></span>
        </div>
    </div>
    {{/each}}
</script>

<script src="${ctx}/static/front/js/custom/goods-search.js" type="text/javascript"></script>
<%--<script src="${ctx}/static/front/assets/pages/scripts/portfolio-1.min.js" type="text/javascript"></script>--%>
</body>
</html>