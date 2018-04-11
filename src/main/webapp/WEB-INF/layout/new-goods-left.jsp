<%--
  Created by IntelliJ IDEA.
  User: xlch
  Date: 2017/2/21
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="sitemash" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">

</script>

<!-- BEGIN SIDEBAR -->

<!-- BEGIN SIDEBAR -->
<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
<div class="page-sidebar navbar-collapse collapse">
    <div class="member">
        <div class="member-info">
            <div class="member-img">
                <a class="member-home" href="javascript:;" target="_self">
                    <img style="border-radius: 50px !important;" class=""
                         src="${user.img}">
                </a>
            </div>
            <div class="member-nick-info">
                <shiro:guest>
                    <span class="member-nick-info">
                        Hi! <strong class="member-nick">你好</strong>
                    </span>
                </shiro:guest>
                <shiro:authenticated>
                    <span class="member-nick-info">
                        Hi! <strong class="member-nick"><shiro:principal/></strong>
                    </span>
                </shiro:authenticated>
            </div>
        </div>
        <div class="member-ft">
            <div class="member-logout" data-spm-ab="2">
                <shiro:guest>
                    <a href="${ctx}/front/login"
                       class="btn-login tb-bg">登录</a>
                    <a href="${ctx}/front/register"
                       class="btn-register tb-bg">注册</a>
                </shiro:guest>
                <shiro:authenticated>
                    <a href="${ctx}/front/logout"
                       class="btn-login tb-bg">退出</a>
                </shiro:authenticated>
            </div>
        </div>
    </div>
    <div class="new-goods portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-edit font-dark"></i>
                <span class="caption-subject font-dark bold uppercase">最新上架</span>
            </div>
        </div>
        <div class="portlet-body">
            <c:forEach items="${goodses}" var="goods">
                <div class="goods-img">
                    <a href="">
                        <img src="<c:if test="${goods.thumbnail != null}">${goods.thumbnail}</c:if> <c:if test="${goods.thumbnail == null}">${ctx}/static/front/img/bad.jpg</c:if>">
                    </a>
                    <div class="status">
                        <label class="price"><i class="fa fa-cny"></i>&nbsp;${goods.price}</label>
                        <label class="pull-right">${goods.saleCount}人付款</label>
                    </div>
                    <div class="description">
                        <label>
                            <a>${goods.description}</a>
                        </label>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- END SIDEBAR -->
<!-- END SIDEBAR -->
