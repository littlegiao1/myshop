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
    <title>登录页面</title>

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
            padding-top: 140px;
            padding-left: 900px;

        }


        .form {
            width: 360px;
            height: 360px;
            background: #d9edf7;
            padding-left: 45px;
            padding-top: 80px;
            /*margin-top: 80px;*/
            /*margin-left: 900px;*/
        }

        .bootom {
            width: 100%;
            height: 130px;
        }

    </style>
    <script src="js/jquery-2.2.2.js"></script>
    <script src="layer/layer.js"></script>
    <script type="text/javascript">
    </script>

    <script type="text/javascript">
       // function login(){
       //          $.post("login.action",$("#login").serialize(),function(data1){
       //              console.log("ok");
       //              console.log(data1);
       //              if(data1 == "admin"){
       //                  layer.alert('欢迎管理员登录',{icon: 6});
       //                  setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
       //                      window.location.reload();//页面刷新
       //                  },1000);
       //              }else if(data1 == "OK"){
       //                  layer.msg('登录成功',{icon: 6});
       //                  setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
       //                      window.location.reload();//页面刷新
       //                  },1000);
       //              }else if(data1 == "FAIL"){
       //                  $("#loginmsg").html("账号或密码错误！");
       //              }
       //
       //          });
       //
       //  }

    </script>
</head>
<body>

<h1></h1>
<div class="container">
    <div class="header">
        <img src="image/logo.jpg" style="width: 230px;height=100px;margin-left: 50px"/>
    </div>

    <div class="mid">
        <form class="form" id="login">
            <div style="margin-top: -50px;margin-bottom: 40px">
                <h4>登录</h4>
            </div>
            <div class="form-group">
                <label for="user_code"></label>
                <span class="glyphicon glyphicon-user"></span>
                <input type="text" class="form-control" id="user_code" name="user_code" placeholder="请输入用户名"
                       style="display:inline;width:240px;height: 40px">
            </div>
            <div class="form-group">
                <label for="user_password"></label>
                <span class="glyphicon glyphicon-lock"></span>
                <input type="password" class="form-control" id="user_password" name="user_password" placeholder="请输入密码"
                       style="display:inline;width:240px;height: 40px">
            </div>
            <!-- <div class="form-check">
               <label class="form-check-label">
                 <input class="form-check-input" type="checkbox"> Remember me
               </label>
             </div> -->
            <button type="button" id="loginButton" class="btn btn-danger"
                    style="display:inline;width:240px;height: 40px;margin-left: 20px">登录
            </button>
            <br><br><a href="forgetPsw.jsp" style="margin-right: 120px;margin-left: 20px">忘记密码</a><a href="register.jsp">免费注册</a>
           <br><span id="loginMsg" style="color:red;margin-left: 80px"></span>
        </form>

    </div>
    <div class="bootom">
        <jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
</div>





<script type="text/javascript">
    $(function () {
        $('#loginButton').on('click', function () {
                $.post("login.action", $("#login").serialize(), function (data1) {
                    console.log("ok");
                    console.log(data1);
                    if (data1 == "admin") {
                        layer.alert('欢迎管理员登录', {icon: 6});
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时1000毫秒
                            window.location.replace("${pageContext.request.contextPath }/index.jsp");
                        }, 1000);
                    } else if (data1 == "OK") {
                        console.log("success to login!");
                        layer.msg('登录成功,正在跳转');
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时1000毫秒
                            window.location.replace("${pageContext.request.contextPath }/index.jsp");
                        }, 1000);


                    } else if (data1 == "FAIL") {
                        console.log($("#loginMsg").html());
                        $("#loginMsg").text("账号或密码错误！");
                    }

                });

        });


    });

</script>

</body>
</html>
