<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="sitemash" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    $(function () {
        var navUsername = $("#nav-username").val();
        if (navUsername !== "") {
            utils.myAjax.get("/front/cart/count", {}, function (data) {
                $("#badge").html(data);
            })
        }
    })
</script>
<ul class="">
    <input id="nav-username" type="hidden" value="<shiro:principal/>">
    <shiro:guest>
        <li class="menu login">
            <div class="menu-hd">
                <div class="sign">
                    <a href="${ctx}/front/login" target="_top" class="h">亲，请登录</a>
                    <a href="${ctx}/front/register" target="_top">免费注册</a>
                </div>
            </div>
        </li>
        <li class="pipe">|</li>
        <li class="menu order ">
            <div class="menu-hd">
                <a href="${ctx}/front/login" target="_top">我的订单</a>
            </div>
        </li>
        <li class="pipe">|</li>
        <li class="menu cart">
            <div class="menu-hd">
                <a href="${ctx}/front/login" target="_top">
                    <i class="fa fa-shopping-cart" style="color: #FF0036; "></i>我的购物车</a>
            </div>
        </li>
    </shiro:guest>
    <shiro:authenticated>
        <li class="menu login">
            <div class="menu-hd">
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown dropdown-user">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-close-others="true">
                                <img alt="" class="img-circle"
                                     src="${ctx}/static/front/assets/layouts/layout/img/avatar3_small.jpg">
                                <span class="username username-hide-on-mobile"> <shiro:principal/> </span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a href="page_user_profile_1.html">
                                        <i class="icon-user"></i> 个人信息 </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="${ctx}/front/logout">
                                        <i class="icon-key"></i> 退出 </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="pipe">|</li>
        <li class="menu order ">
            <div class="menu-hd">
                <a href="${ctx}/front/orders" target="_top">我的订单</a>
            </div>
        </li>
        <li class="pipe">|</li>
        <li class="menu cart">
            <div class="menu-hd">
                <a href="${ctx}/front/cart" target="_top">
                    <i class="fa fa-shopping-cart" style="color: #FF0036; "></i>我的购物车
                    <span id="badge" class="badge badge-default"></span>
                </a>
            </div>
        </li>
    </shiro:authenticated>
</ul>
