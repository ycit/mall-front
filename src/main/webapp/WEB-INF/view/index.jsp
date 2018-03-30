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
                                    <input type="text" class="form-control" placeholder="输入宝贝名称">
                                    <input type="hidden" value="0">
                                    <span class="input-group-btn">
                        <button class="btn" type="button">搜索</button>
                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab_1_2">
                        <div class="search">
                            <form role="form">
                                <div class="input-group input-group-lg search-input">
                                    <input type="text" class="form-control" placeholder="输入专卖店名称">
                                    <input type="hidden" value="1"/>
                                    <span class="input-group-btn">
                        <button class="btn" type="button">搜索</button>
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
                        <li><img src="${ctx}/static/front/img/cat1.jpg" alt="Cats!"></li>
                        <li><img src="${ctx}/static/front/img/cat2.jpg" alt="Cats!"></li>
                        <li><img src="${ctx}/static/front/img/cat3.jpg" alt="Cats!"></li>
                        <li><img src="${ctx}/static/front/img/cat4.jpg" alt="Cats!"></li>
                        <li><img src="${ctx}/static/front/img/cat5.jpg" alt="Cats"></li>
                        <li><img src="${ctx}/static/front/img/cat6.jpg" alt="Cats!"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!--     bootstrap modal          -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">前一天发送消息详情</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body-title" id="msg-portlet-body-title"></div>
                <div class="table-scrollable">
                    <table class="table table-hover" align="center" id="msg-result">
                        <thead>
                        <tr>
                            <th> 调用应用名称</th>
                            <th> 发送目的地</th>
                            <th> 发送时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div id="msg-table"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" data-click="comment">评论</button>--%>
            </div>
        </div>
    </div>
</div>

<!--     bootstrap modal          -->
<div class="modal fade" id="wait-send-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">待发消息详情</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body-title" id="wait-portlet-body-title"></div>
                <div class="table-scrollable">
                    <table class="table table-hover" align="center" id="wait-result">
                        <thead>
                        <tr>
                            <th> 调用应用名称</th>
                            <th> 发送目的地</th>
                            <th> 请求时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div id="wait-table"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" data-click="comment">评论</button>--%>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="channels_warning">
    <tr>
        <td>{name}</td>
        <td><a data-id="{id}" data-click="yesterday">{sendNum}</a></td>
        <td><a data-id="{id}" data-click="waitSend">{waitNum}</a></td>
        <td><i class="fa fa-warning"></i></td>
    </tr>
</script>
<script type="text/html" id="channels_normal">
    <tr>
        <td>{name}</td>
        <td><a data-id="{id}" data-click="yesterday">{sendNum}</a></td>
        <td><a data-id="{id}" data-click="waitSend">{waitNum}</a></td>
        <td><span class="glyphicon glyphicon-ok-circle"> </span></td>
    </tr>
</script>
<script type="text/html" id="msg">
    <tr>
        <td>{appName}</td>
        <td>{destination}</td>
        <td>{createTime}</td>
    </tr>
</script>
<script type="text/html" id="wait-msg">
    <tr>
        <td>{appName}</td>
        <td>{destination}</td>
        <td>{createTime}</td>
    </tr>
</script>
<script type="text/html" id="alert">
    <tr>
        <td colspan="4">
            <div class="alert alert-warning" role="alert">
                暂无可用通道
            </div>
        </td>
    </tr>
</script>
<script type="text/html" id="msg-alert">
    <tr>
        <td colspan="3">
            <div class="alert alert-warning" role="alert">
                暂无数据
            </div>
        </td>
    </tr>
</script>
<script type="text/html" id="page">
    <div style="text-align: center">
        <ul class="my-pagination"></ul>
    </div>
</script>
<script type="text/html" id="msg-page">
    <div style="text-align: center">
        <ul class="msg-pagination"></ul>
    </div>
</script>
<script type="text/html" id="wait-page">
    <div style="text-align: center">
        <ul class="wait-pagination"></ul>
    </div>
</script>

<script src="${ctx}/static/front/js/custom/index.js" type="text/javascript"></script>

</body>
</html>