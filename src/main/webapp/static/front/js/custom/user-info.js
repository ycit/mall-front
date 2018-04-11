$(function () {
    var userFormSelector = $("#user-form");
    var pwFormSelector = $("#pw-form")
    var imgSelector = $("#user-image");
    var userInfoHtml = $("#user-info").html();
    var template = Handlebars.compile(userInfoHtml);
    var birthday;
    utils.myAjax.get("/front/users/self", {}, function (data) {
        userFormSelector.html(template({user: data}));
        $('.date-picker').datepicker({
            format: 'yyyymmdd',
            language: "zh-CN",
            autoclose: "true"
        }).on("changeDate", function (e) {
            birthday = e.timeStamp;
        });
        imgSelector.fileinput({
            language: 'zh', //设置语言
            uploadUrl: '/front/users/img/upload',
            uploadAsync: true,
            showCaption: false,//是否显示标题
            showUpload: true, //是否显示上传按钮
            showRemove: false,
            showCancel:false,
            browseIcon: '<i class="glyphicon glyphicon-upload"></i>&nbsp;',
            maxFileCount: 1, //表示允许同时上传的最大文件个数
            autoReplace: true,
            allowedFileExtensions: ['jpg', 'png', 'bmp', 'jpeg'],//接收的文件后缀
            enctype: 'multipart/form-data',
            dropZoneEnabled: false,//是否显示拖拽区域
            overwriteInitial: true,//覆盖已存在的图片
            browseClass: "btn green-soft", //按钮样式
            initialPreview:[data.img],
            initialPreviewAsData:true,
            initialPreviewShowDelete:true,
            layoutTemplates: {
                actionUpload: '',//设置为空可去掉上传按钮
                //actionDelete:'',//设置为空可去掉删除按钮
                // actionZoom: '',//设置为空可去掉预览按钮
                indicator: ''//设置为空可去左侧状态
            }
        }).on('fileuploaded', function (event, data, previewId, index) {
                $("#user-img").attr("src", data.response.img);
                $(".alert-notice-wrap").removeClass("hide");
                setTimeout("$(\".alert-notice-wrap\").addClass(\"hide\")", 1000);
                console.log("fileloaded");
            }).on('filebatchuploadcomplete', function (event, files, extra) {
            $(".alert-notice-wrap").removeClass("hide");
            setTimeout("$(\".alert-notice-wrap\").addClass(\"hide\")", 1000);
            console.log('File batch upload complete');
        }).on('filebatchuploaderror', function (event, data, msg) {
            alert(msg);
        });
    });




    userFormSelector.validate({
        rules: {
            nickname: {
                maxlength: 30
            }
        }
    });

    userFormSelector.on("click", ".save", function () {
        userFormSelector.valid();
        var params = userFormSelector.serialize();
        utils.myAjax.post("/front/users/update", params, function (data) {
            userFormSelector.html(template({user: data}));
            $(".alert-notice-wrap").removeClass("hide");
            setTimeout("$(\".alert-notice-wrap\").addClass(\"hide\")", 1000);
        });
    });

    pwFormSelector.validate({
        rules:{
            newPw:{
                required:true,
                minlength:4,
                maxlength:12
            },
            oldPw:{
                required:true,
                minlength:4,
                maxlength:12
            },
            reNewPw:{
                required:true,
                minlength:4,
                maxlength:12,
                equalTo: "#password"
            }
        },
        messages:{
            reNewPw:{
                equalTo:"两次密码输入不一致"
            }
        }
    })
    
    utils.quick.click({
        password:function () {
            var pass = pwFormSelector.valid();
            if (pass) {
                var params = pwFormSelector.serialize();
                utils.myAjax.get("/front/users/pw", params, function (data) {
                    if (data.code === 200) {
                        $(".alert-notice-wrap").removeClass("hide");
                        setTimeout("$(\".alert-notice-wrap\").addClass(\"hide\")", 1000);
                    }else {
                        utils.modal.myAlert(data.message);
                    }
                })
            };

        }
    })

})