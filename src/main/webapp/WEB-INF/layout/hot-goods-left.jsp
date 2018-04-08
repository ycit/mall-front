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
                <span class="caption-subject font-dark bold uppercase">最热商品</span>
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
