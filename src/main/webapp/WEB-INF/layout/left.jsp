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
                         src="//wwc.alicdn.com/avatar/getAvatar.do?userNick=&amp;width=50&amp;height=50&amp;type=sns&amp;_input_charset=UTF-8">
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
            <div class="goods-img">
                <a href="">
                    <img src="${ctx}/static/front/img/08.jpg">
                </a>
                <div class="status">
                    <label class="price"><i class="fa fa-cny"></i>&nbsp;300</label>
                    <label class="pull-right">8人付款</label>
                </div>
                <div class="description">
                    <label>
                        <a>唯品会特卖2018春夏新款女装宽松大码气质显瘦印花真丝雪纺连衣裙</a>
                    </label>
                </div>
            </div>
            <div class="goods-img">
                <a href="">
                    <img src="${ctx}/static/front/img/10.jpg">
                </a>
            </div>
            <div class="goods-img">
                <a href="">
                    <img src="${ctx}/static/front/img/12.jpg">
                </a>
            </div>

        </div>
    </div>
</div>
<!-- END SIDEBAR -->
<!-- END SIDEBAR -->
