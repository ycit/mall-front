<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<head>
    <title>个人信息</title>
    <meta charset="utf-8">
    <link href="${ctx}/static/front/css/user-info.css" rel="stylesheet" type="text/css"/>
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
                <span>个人信息</span>
            </li>
        </ul>
    </div>
    <div class="portlet light">
        <div class="portlet-body">
            <div class="portlet-body">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#tab_15_1" data-toggle="tab" aria-expanded="true"> 基本信息 </a>
                        </li>
                        <li class="">
                            <a href="#tab_15_2" data-toggle="tab" aria-expanded="false"> 头像照片 </a>
                        </li>
                        <li class="">
                            <a href="#tab_15_3" data-toggle="tab" aria-expanded="false"> 密码修改 </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_15_1">
                            <div class="portlet-body form">
                                <form role="form" class="form-horizontal" id="user-form">

                                </form>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_15_2">
                            <div class="portlet-body form">
                                <form id="img-form" class="form-horizontal" role="form" enctype="multipart/form-data">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">上传图片</label>
                                            <div class="col-md-9">
                                                <input id="user-image" type="file" name="img">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_15_3">
                            <div class="portlet-body form">
                                <form id="pw-form" class="form-horizontal">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">当前密码</label>
                                            <div class="col-md-4">
                                                <input type="password" class="form-control" name="oldPw">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">新&nbsp;&nbsp;密&nbsp;&nbsp;码</label>
                                            <div class="col-md-4">
                                                <input type="password" id="password" class="form-control" name="newPw">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">确认密码</label>
                                            <div class="col-md-4">
                                                <input type="password" class="form-control" name="reNewPw">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button data-click="password" type="button" class="btn green">保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="alert-notice-wrap hide">
    <div class="alert-notice">
        <span class="glyphicon glyphicon-ok"> </span>
        <div>操作成功</div>
    </div>
</div>

<script type="text/html" id="user-info">
    <div class="form-body">
        <input type="hidden" name="id" value="{{user.id}}">
        <div class="form-group">
            <label class="col-md-2 control-label">用户名 :</label>
            <div class="col-md-10">
                <div class="form-control form-control-static" style="border: none !important;"> {{user.username}} </div>
                <div class="form-control-focus"> </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">昵&nbsp;&nbsp;&nbsp;称 :</label>
            <div class="col-md-10">
                <input type="text" class="form-control input-small" name="nickname" value="{{user.nickname}}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">性&nbsp;&nbsp;&nbsp;别 :</label>
            <div class="col-md-10">
                <div class="radio-list">
                    <label class="radio-inline">
                        <div class="radio"><span><input type="radio" name="sex" value="1" {{#compare user.sex '==' 1}}checked{{/compare}}/></span> 男 </div></label>
                    <label class="radio-inline">
                        <div class="radio"><span><input type="radio" name="sex" value="0" {{#compare user.sex '==' 0}}checked{{/compare}}/></span> 女 </div></label>
                    <label class="radio-inline">
                        <div class="radio"><span><input type="radio" name="sex" value="-1" {{#compare user.sex '==' -1}}checked{{/compare}}/></span> 保密 </div></label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">生&nbsp;&nbsp;&nbsp;日 :</label>
            <div class="col-md-10">
                <input class="form-control form-control-inline input-medium date-picker" readonly name="birthday" size="16" type="text" value="{{user.birthday}}">
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-2 col-md-12">
                <button data-click="save" type="button" class="btn blue save">保存</button>
            </div>
        </div>
    </div>
</script>

<script src="${ctx}/static/front/js/custom/user-info.js" type="text/javascript"></script>

</body>
</html>