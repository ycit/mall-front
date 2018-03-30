$(function () {
    $("#register-form").validate({
        rules:{
            username:{
                required:true,
                minlength:4,
                maxlength:12
            },
            password:{
                required:true,
                minlength:4,
                maxlength:12
            },
            confirm_password:{
                required:true,
                minlength:4,
                maxlength:12,
                equalTo: "#password"
            }
        },
        messages:{
            username:{
                required:"用户名不能为空",
                minlength:"用户名长度至少4位",
                maxlength:"用户名长度最多12位"
            },
            password:{
                required:"密码不能为空",
                minlength:"密码长度至少4位",
                maxlength:"密码长度最多12位"
            },
            confirm_password:{
                required:"确认密码不能为空",
                minlength:"确认密码长度至少4位",
                maxlength:"确认密码长度最多12位",
                equalTo: "确认密码和密码要保持一致"
            }
        }
    })

    utils.quick.click({
        register:function () {
            var pass = $("#register-form").valid();
            if (!pass) {
                return;
            }
            var username =$("#username-input").val();
            var password = $("#password").val();
            var rePassword = $("#confirm_password").val();
            $.ajax({
                type:"post",
                url:"/front/register",
                dataType:"text",
                data:{
                    username:username,
                    password:password,
                    rePassword:rePassword
                },
                success:function (data) {
                    if (data === "success") {
                        window.location.href="/front/login";
                    }else {
                        $("#notice").html(data);
                    }
                    console.log("data is " + data);
                },
                error:function (XMLHttpRequest, msg, exception) {
                    console.log("XMLHttpRequest is " + XMLHttpRequest);
                    console.log("msg is " + msg);
                    console.log("exception is " + exception);
                }
            })
        }
    })
})