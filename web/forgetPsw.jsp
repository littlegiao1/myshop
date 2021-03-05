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

    <div class="mid" id="mid">
        <form class="form" id="findUserPsw">
            <div style="margin-top: -50px;margin-bottom: 40px" id="formTitle">
                <h4>密码找回</h4>
            </div>
            <div class="form-group">
                <label for="user_code"></label>
                <span class="glyphicon glyphicon-user"></span>
                <input type="text" class="form-control" id="user_code" name="user_code" placeholder="请输入用户名"
                       style="display:inline;width:240px;height: 40px">
            </div>
            <!-- <div class="form-check">
               <label class="form-check-label">
                 <input class="form-check-input" type="checkbox"> Remember me
               </label>
             </div> -->
            <button type="button" id="nextButton" class="btn btn-danger"
                    style="display:inline;width:240px;height: 40px;margin-left: 20px">下一步
            </button>
            <br><br><a href="login.jsp" style="margin-right: 120px;margin-left: 30px">登录</a><a href="register.jsp">免费注册</a>
           <br><span id="Msg" style="color:red;margin-left: 80px"></span>
        </form>

    </div>
    <div class="bootom">
        <jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
</div>





<script type="text/javascript">
    $(function () {
        $('#nextButton').on('click', function () {
                $.post("validateUserCode.action", $("#findUserPsw").serialize(), function (data1) {
                    if (data1 == "OK") {
                        console.log("did it");
                        $("#Msg").html("");
                            <%--window.location.replace("${pageContext.request.contextPath }/forgetPsw_inputUserQuestion.jsp");--%>
                         var user_code = $("#user_code").val();
                        console.log("!!!!"+user_code)
                            $("#findUserPsw").find(".form-group").remove();
                            $("#findUserPsw").find("#formTitle").append(" <div class=\"form-group\" style=\"margin-top: 30px\">\n" +
                                "                <label for=\"user_question\"></label>\n" +
                                "                <span class=\"glyphicon glyphicon-question-sign\"></span>\n" +
                                "                <span id=\"user_question\"  style=\"display:inline;width:240px;height: 40px\">密保问题?</span>\n" +
                                "            </div>\n" +
                                "            <div class=\"form-group\">\n" +
                                "                <label for=\"user_answer\"></label>\n" +
                                "                <span class=\"glyphicon glyphicon-pencil\"></span>\n" +
                                "                <input type=\"text\" class=\"form-control\" id=\"user_answer\" name=\"user_answer\" placeholder=\"请填写密保答案\"\n" +
                                "                       style=\"display:inline;width:240px;height: 40px\">\n" +
                                "                <br/>\n" +
                                "                <div class=\"msg\" for=\"user_answer\"></div>\n" +
                                "            </div>");
                            console.log("1")
                        $.post("queryUserQuestion.action", {"user_code":user_code},function (data1) {
                                console.log("问题"+data1);
                            console.log($("#user_question"));
                                 $("#user_question").html("密保问题:"+data1+"?");
                        });

                        $("#nextButton").unbind();

                            $("#nextButton").on('click', function () {
                                console.log("!!!!"+user_code)
                                $.post("queryUserAnswerByUserCode.action", {"user_code":user_code},function (data1) {
                                    console.log(data1);
                                    console.log("用户填写密保问题："+$("#user_answer").val())
                                    if($("#user_answer").val()==data1){
                                        console.log("密保正确！")
                                        $("#Msg").html("");
                                        $("#findUserPsw").find(".form-group").remove();
                                        $("#findUserPsw").find("#formTitle").append(" <div class=\"form-group\" style=\"margin-top: 30px\">\n" +
                                            "                <label for=\"user_password\"></label>\n" +
                                            "                <span class=\"glyphicon glyphicon-lock\"></span>\n" +
                                            "                <input type=\"password\" class=\"form-control\" id=\"user_password\" name=\"user_password\" placeholder=\"请输入新密码\"\n" +
                                            "                       style=\"display:inline;width:240px;height: 40px\">\n" +
                                            "            </div>");
                                        $("#nextButton").unbind();
                                        $("#nextButton").on('click', function () {
                                            console.log("点击下一步按钮提交新密码"+$("#user_password").val())
                                            $.post("updateUserPswByUserCode.action",{"user_code":user_code,"user_password":$("#user_password").val()},function(data1) {
                                                console.log($("#user_password").val());
                                                console.log("data"+data1)
                                                if(data1=="OK"){
                                                    layer.msg('修改密码成功,正在为您跳转到登录页面...', {icon: 6});
                                                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                                                        window.location.replace("${pageContext.request.contextPath }/login.jsp")
                                                    }, 1000);

                                                }

                                            });
                                        });
                                    }else{
                                        $("#Msg").html("密保答案错误！");
                                    }

                                });
                            });

                        // console.log("执行了")
                        // $.post("queryUserQuestion.action", user_code, function (data1) {
                        //        $("#user_question").html("密保问题:"+data1+"?");
                        // });

                    } else if (data1 == "FAIL") {

                       $("#Msg").html("该用户名不存在！");


                    } else{
                        $("#Msg").html("出现未知错误！");
                    }

                });

        });


    });

</script>

</body>
</html>
