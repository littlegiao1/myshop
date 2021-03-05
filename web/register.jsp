<%--
  Created by IntelliJ IDEA.
  User: 24339
  Date: 2020/6/17
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册页面</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <![endif]-->
    <style type="text/css">

        .container {
            width: 100%;

        }

        .header {
            width: 100%;
            height: 80px;
            border: 2px;
            margin-top: -20px;
            /*border: 5px solid #ff0000;*/
        }

        .mid {
            width: 100%;
            height: 600px;
            background-image: url("image/background.jpg");
            padding-top: 14px;
            padding-left: 900px;

        }


        .form {
            width: 360px;
            height: 575px;
            background: #d9edf7;
            padding-left: 45px;
            padding-top: 80px;
            /*margin-top: 80px;*/
            /*margin-left: 900px;*/
        }

        .form-group{
        margin-top: -15px;
        }

        .msg {
            width: 200px;
            height: 30px;
            margin-left: 25px;

        }


        .bootom {
            width: 100%;
            height: 130px;
        }


        .error {
            color: red;

        }

    </style>
    <script src="js/jquery-2.2.2.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/messages_zh.js"></script>
    <script src="layer/layer.js"></script>

    <script type="text/javascript">
        function register() {
            $("#registermsg").html("");
            $.post("createUser.action", $("#register").serialize(), function (data) {
                if (data == "OK") {
                    layer.msg('注册成功', {icon: 6});
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();//页面刷新
                    }, 1000);
                    //window.location.reload();
                } else {
                    layer.msg('注册失败', {icon: 5});
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();//页面刷新
                    }, 1000);
                    //window.location.reload();
                }

            });
        }

        $.validator.setDefaults({
            submitHandler: function () {
                $.post("createUser.action", $("#registerform").serialize(), function (data) {
                    if (data == "OK") {
                        layer.msg('注册成功,正在为您跳转到登录页面...', {icon: 6});
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.replace("${pageContext.request.contextPath }/login.jsp")
                        }, 1000);
                        //window.location.reload();
                    } else {
                        layer.msg('注册失败', {icon: 5});
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.reload();//页面刷新
                        }, 1000);
                        //window.location.reload();
                    }
                });

            }
        });

        $().ready(function () {
// 在键盘按下并释放及提交后验证提交表单
            $("#registerform").validate({
                rules: {
                    user_code: {
                        required: true,
                        minlength: 6,
                        remote: {
                            url: "validateUserCode.action",
                            type: "post",
                            dataType: "json",
                            data: {
                                user_code: function() {
                                    return $("#user_code").val();
                                }
                            },
                            dataFilter: function(data, type) {
                                if (data == "OK")
                                    return false;
                                else
                                    return true;
                            }
                        },

                    },
                    user_password: {
                        required: true,
                        minlength: 6
                    },

                    user_repassword: {
                        required: true,
                        minlength: 5,
                        equalTo: "#user_password"
                    },
                    user_phone: {
                        required: true,
                    },
                    user_question:{
                        required: true,
                    },
                    user_answer: {
                        required: true,
                        minlength: 1
                    },
                },
                errorPlacement: function(error, element) {
                    // Append error within linked label
                    $( element )
                        .closest( "form" )
                        .find( "div[for='" + element.attr( "id" ) + "']" )
                        .append( error );
                },
                errorElement: "span",
                messages: {
                    user_code: {
                        required: "请输入用户名",
                        minlength: "用户名不能少于 6 个字母",
                        remote:"该用户名已被注册"
                    },
                    user_password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 6 个字母"
                    },
                    user_repassword: {
                        required: "请再次输入密码",
                        minlength: "密码长度不能小于 6 个字母",
                        equalTo: "两次密码输入不一致"
                    },
                    user_phone:"请正确填写手机号码"
                    ,
                    user_question:"请选择密保问题"
                    ,
                    user_answer: "请输入密保答案"
                }
            });
        });

    </script>
</head>
<body>
<h1></h1>
<div class="container">
    <div class="header">
        <img src="image/logo.jpg" style="width: 230px;height=100px;margin-left: 50px"/>
    </div>

    <div class="mid">
        <form class="form" id="registerform">
            <div style="margin-top:-55px;margin-bottom: 40px;margin-left: 100px">
                <h4>注册</h4>
            </div>
            <div class="form-group">
                <label for="user_code"></label>
                <span class="glyphicon glyphicon-user"></span>
                <input type="text" class="form-control" id="user_code" name="user_code" placeholder="请输入用户名"
                       style="display:inline;width:240px;height: 40px">
                <br/>
                <div class="msg" for="user_code"></div>
            </div>
            <div class="form-group">
                <label for="user_password"></label>
                <span class="glyphicon glyphicon-lock"></span>
                <input type="password" class="form-control" id="user_password" name="user_password" placeholder="请输入密码"
                       style="display:inline;width:240px;height: 40px">
                <br/>
                <div class="msg" for="user_password"></div>
            </div>
            <div class="form-group">
                <label for="user_repassword"></label>
                <span class="glyphicon glyphicon-lock"></span>
                <input type="password" class="form-control" id="user_repassword" name="user_repassword"
                       placeholder="请再次输入密码"
                       style="display:inline;width:240px;height: 40px">
                <br/>
                <div class="msg" for="user_repassword"></div>
            </div>

            <div class="form-group">
                <label for="user_phone"></label>
                <span class="glyphicon glyphicon-earphone"></span>
                <input type="tel" class="form-control" id="user_phone" name="user_phone" placeholder="请填写手机号码"
                       style="display:inline;width:240px;height: 40px">
                <br/>
                <div class="msg" for="user_phone"></div>
            </div>
            <div class="form-group">
                <label for="user_question"></label>
                <span class="glyphicon glyphicon-question-sign"></span>
                <select class="form-control" style="display:inline;width:240px;height: 40px" placeholder="请选中密保问题"
                        id="user_question" name="user_question">
                    <option value="" style="display: none;" disabled selected>请选择密保问题</option>
                    <option>我最喜欢的车</option>
                    <option>我的小学老师</option>
                    <option>我父亲的名字</option>
                </select>
                <br/>
                <div class="msg" for="user_question"></div>
            </div>
            <div class="form-group">
                <label for="user_answer"></label>
                <span class="glyphicon glyphicon-pencil"></span>
                <input type="text" class="form-control" id="user_answer" name="user_answer" placeholder="请填写密保答案"
                       style="display:inline;width:240px;height: 40px">
                <br/>
                <div class="msg" for="user_answer"></div>
            </div>
            <!-- <div class="form-check">
               <label class="form-check-label">
                 <input class="form-check-input" type="checkbox"> Remember me
               </label>
             </div> -->
            <button type="submit" class="btn btn-danger"
                    style="display:inline;width:240px;height: 40px;margin-left: 20px">注册
            </button>
        </form>
    </div>
    <div class="bootom">
        <jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
</div>


</body>
</html>
