<%--
  Created by IntelliJ IDEA.
  User: xlch
  Date: 2017/2/21
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="module" value="channel"/>

<!DOCTYPE html>
<html>
<head>
    <title>电池在线销售平台:<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link type="image/x-icon" href="${ctx}/static/front/img/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/front/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${ctx}/static/front/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/assets/layouts/layout/css/themes/light2.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="${ctx}/static/front/js/slider/unslider.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/css/custom.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/front/css/left.css" rel="stylesheet" type="text/css"/>

    <script src="${ctx}/static/front/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/front/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <sitemesh:head/>

</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" <sitemesh:getProperty property="body.id"
                                                                                         writeEntireProperty="true"/>>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner container">
        <!-- BEGIN LOGO -->
        <a href="${ctx}/front/index">
            <div class="page-logo">
                <img src="${ctx}/static/front/img/cart.jpg" alt="logo" class="logo-default"/>
            </div>
            <div class="site-title" style="color: red">电池在线销售平台</div>
        </a>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <div class="action pull-right">
            <%@include file="/WEB-INF/layout/navigation.jsp" %>
        </div>
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
<!-- BEGIN CONTAINER -->
<div class="container">
    <div class="page-container">
        <div class="page-sidebar-wrapper">
            <%@ include file="/WEB-INF/layout/new-goods-left.jsp" %>

        </div>
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <sitemesh:body></sitemesh:body>
        </div>
        <!-- END CONTENT -->

    </div>
</div>
<%@include file="/WEB-INF/layout/footer.jsp" %>
<script src="${ctx}/static/front/js/momentjs/moment.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/underscore/underscore.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/slider/unslider-min.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/util/utils.js" type="text/javascript"></script>
<sitemesh:getProperty property="page.page_script"></sitemesh:getProperty>
</body>
</html>

