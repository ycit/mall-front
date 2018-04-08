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
    <div class="new-goods portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-edit font-dark"></i>
                <span class="caption-subject font-dark bold uppercase">最新入驻专卖店</span>
            </div>
        </div>
        <div class="portlet-body">
            <c:forEach items="${stores}" var="store">
                <div class="box">
                    <a href="">
                        <img src="<c:if test="${store.img != null}">${store.img}</c:if> <c:if test="${store.img == null}">${ctx}/static/front/img/store.jpg</c:if>">
                    </a>
                    <div class="left-description">
                        <label>名称:${store.name}</label>
                        <label>主营品牌:<c:forEach items="${store.brands}" var="brand">${brand.brandName} </c:forEach> </label>
                        <label>联系电话:${store.tel}</label>
                        <label>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:${store.provinceName}${store.cityName}${store.districtName}</label>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- END SIDEBAR -->
<!-- END SIDEBAR -->
