<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <meta charset="utf-8" />
    <title>电池在线销售平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link type="image/x-icon" href="${ctx}/static/front/img/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/front/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
    <link href="${ctx}/static/front/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css">
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${ctx}/static/front/assets/pages/css/login.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/front/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/front/css/login.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        img {
            width: 50px;
        }
    </style>
</head>

<body class=" login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="${ctx}/front/index">
        <img src="${ctx}/static/front/img/shop.jpg" alt=""> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- END FORGOT PASSWORD FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form id="register-form" class="register-form" style="display: block;">
        <h3 class="font-green">注册</h3>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">用户名</label>
            <input id="username-input" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"> </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">设置密码</label>
            <input id="password" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"> </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">确认密码</label>
            <input id="confirm_password" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码确认" name="confirm_password"> </div>
        <div class="form-group margin-top-20 margin-bottom-20">
            <div> <label id="notice" class="error-msg"></label> </div>
        </div>
        <div class="form-actions">
            <a href="${ctx}/front/login">已有账号? 返回登录</a>
            <button type="button" id="register-submit-btn" class="btn btn-success uppercase pull-right" data-click="register">立即注册</button>
        </div>
    </form>
    <!-- END REGISTRATION FORM -->
</div>

<script src="${ctx}/static/front/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/jquery-validator/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/jquery-validator/locale/messages_zh.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/util/utils.js" type="text/javascript"></script>
<script src="${ctx}/static/front/js/custom/register.js" type="text/javascript"></script>
</body>
</html>

