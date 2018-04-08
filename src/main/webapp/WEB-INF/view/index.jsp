<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <link href="${ctx}/static/front/css/index.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="page-content" style="min-height:1318px">
    <div class="portlet">
        <div class="portlet-body">
            <div class="search">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab_1_1" data-toggle="tab" aria-expanded="true"> 宝贝 </a>
                    </li>
                    <li class="">
                        <a href="#tab_1_2" data-toggle="tab" aria-expanded="false"> 专卖店 </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="tab_1_1">
                        <div class="search-content">
                            <form role="form">
                                <div class="input-group input-group-lg search-input">
                                    <input type="text" id="goods-name" class="form-control" placeholder="输入宝贝名称">
                                    <input type="hidden" value="0">
                                    <span class="input-group-btn">
                                        <button data-click="goodsSearch" class="btn" type="button">搜索</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab_1_2">
                        <div class="search">
                            <form role="form">
                                <div class="input-group input-group-lg search-input">
                                    <input type="text" id="store-name" class="form-control" placeholder="输入专卖店名称">
                                    <input type="hidden" value="1"/>
                                    <span class="input-group-btn">
                                        <button data-click="storeSearch" class="btn" type="button">搜索</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portlet">
        <div class="portlet-title">
        </div>
        <div class="portlet-body">
            <div class="news-show">
                <div class="banner" id="roll">
                    <ul>
                        <c:forEach items="${newses}" var="news">
                            <li><a href="${news.url}" target="_blank"> <img src="${news.img}"></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${ctx}/static/front/js/custom/index.js" type="text/javascript"></script>

</body>
</html>