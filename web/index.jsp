<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sssg.po.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宿舍时光</title>


    <!-- Font Icon -->
    <link href="assets/css/plugin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- CSS Global -->
    <link href="assets/css/plugin/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugin/bootstrap-select.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css"/>
    <link href="assets/css/plugin/owl.carousel.css" rel="stylesheet" type="text/css">


    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">


    <!--
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css" />-->

    <%User user = (User) request.getSession().getAttribute("user_session"); %>
    <style type="text/css">
        .biaoti {
            height: 100px;
        }

        body {
            background-color: rgb(57, 62, 66);
        }

        .first {
            background-color: white;
            width: 90%;
        }

        .input {
            margin-top: 24px;
        }

        .denglu {
            margin-top: 20px;

            height: 45px;
        }

        .left1 {
            border: 5px solid #ddd;
            width: 15%;
            height: 970px;
        }

        .right1 {
            width: 80%;
            height: 800px;

        }


    </style>
    <script type="text/javascript">


        function register() {
            if (($("#username").val() == "") || ($("#password").val() == "") || ($("#repassword").val() == "") || ($("#phone").val() == "") || ($("#address").val() == "")) {
                $("#registermsg").html("表单不能留空");
                return false;

            }
            if ($("#password").val() != $("#repassword").val()) {
                $("#registermsg").html("两次输入的密码不一致");
                return false;
            }

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


        function updateUser() {
            $.post("${pageContext.request.contextPath }/updateUser.action", $("#update").serialize(), function (data) {
                if (data == "OK") {
                    layer.msg('修改成功', {
                        icon: 1,
                        time: 1000, //2s后自动关闭
                    });
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();
                    }, 1000);
                } else {
                    layer.msg('修改失败', {
                        icon: 2,
                        time: 1000, //2s后自动关闭
                    });
                }
            });
        }


        function updateUserAddress() {
            $.post("${pageContext.request.contextPath }/updateUserAddress.action", $("#editAddress").serialize(), function (data) {
                if (data == "OK") {
                    layer.msg('编辑成功', {
                        icon: 1,
                        time: 1000, //1s后自动关闭
                    });
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();
                    }, 1000);
                } else {
                    layer.msg('编辑失败', {
                        icon: 2,
                        time: 1000, //1s后自动关闭
                    });
                }
            });
        }


        function loginout() {
            layer.confirm('确定退出登录吗？', {
                btn: ['确定', '取消'], //按钮
                icon: 5
            }, function () {
                $.post("logout.action", "", function (data1) {
                    window.location.reload();
                });

            }, function () {
                layer.msg('不退出登录才是正确的选择', {
                    icon: 6,
                    time: 2000, //2s后自动关闭
                    btn: ['明白了', '意义不大']
                });
            });
            /* if (r==true)
              {
                $.post("logout.action","",function(data1){
                    window.location.reload();
                });
              }   */


        }

        function showItem() {
            console.log("ok!!!");
        }


        function minamount() {
            if ($("#amountText").val() > 1) {
                $("#amountText").val($("#amountText").val() - 1);
                console.log($("#amountText").val());
            } else {
                $("#amountText").val(1);
                console.log($("#amountText").val());
            }

        }

        function addamount() {
            $("#amountText").val(parseInt($("#amountText").val()) + 1);
            console.log($("#amountText").val());
        }


        function showItemDetail(e, item_id) {
            $(".sync1 img,.sync2 img").attr("src", "");
            console.log("点击商品详情页面");
            console.log($(e.target.parentNode.parentNode.parentNode).find("#spid"));
            $.post("${pageContext.request.contextPath }/selectItemDetailByItemId.action", {"item_id": item_id}, function (data) {
                console.log("now", $(".sync1 .owl-item[class$=active]").find('#Id').val());
                console.log("商品id" + item_id);
                console.log("查询到的商品" + data.length)
                if (data.length <= 3) {
                    $(".owl-nav").css('display', 'none');
                } else {
                    $(".owl-nav").css('display', '');
                }

                if (data.length > 0) {
                    $("#amountText").val("1");
                    $(".sync2 .owl-item .item a img:eq(0)").trigger('click');
                    //将多余的图片显示栏和显示口味名称栏隐藏
                    for (var i = $(".sync1 .owl-item .item").length - 1; i >= data.length; i--) {
                        $(".sync1 .owl-item:eq(" + i + "),.sync2 .owl-item:eq(" + i + ")").css('display', 'none');
                        $(".tags-widget span a:eq(" + i + ")").css('display', 'none');
                    }

                    //将被隐藏的图片和口味名字栏显示，遍历查询到的口味个数，并将图片和名称信息显示到模态弹框
                    for (var i = 0; i < data.length; i++) {
                        console.log(data[i].shape_image);
                        console.log($(".sync1 .owl-item .item:eq(" + i + ")").find("img").attr("src"));
                        $(".sync1 .owl-item:eq(" + i + "),.sync2 .owl-item:eq(" + i + ")").css('display', '');
                        $(".tags-widget span a:eq(" + i + ")").css('display', '');

                        $(".sync1 .owl-item .item:eq(" + i + "),.sync2 .owl-item .item:eq(" + i + ")").find("img").attr("src", data[i].shape_image);
                        $(".tags-widget span a:eq(" + i + ")").text(data[i].item_shape);
                        //$(".sync1 .owl-item .item #shapeId:eq("+i+")").attr('value',data[i].shape_id);
                        /*$(".sync2 .owl-item .item a img:eq("+i+")").on("click",function(){
                            console.log("触发")
                            $(".single-caption .section-title .light-font").text(data[i].item_shape);
                               $(".single-caption .price .clr-txt.fsz-20").text(data[i].shape_price);
                               $(".single-caption .fsz-16 p").text(data[i].shape_describle);

                        });*/
                    }


                    //将查询到的第一个商品的信息填充到模态框
                    if (data.length > 0) {
                        $("#shapeId").attr('value', data[0].shape_id);
                        $("#SHAPE_NAME").text(data[0].item_shape);
                        $("#SHAPE_PRICE").text(data[0].shape_price);
                        $("#SHAPE_DESCRIBLE").text(data[0].shape_describle);
                        $("#SHAPE_AMOUNT").text(data[0].shape_amount);
                        $("#CATEGORY").text(data[0].categorydetail_name);

                    }


                    /*$(".sync1 .owl-item .item").each(function(index,element){
                        if($(element.parentNode).hasClass('active')==true){
                        }

                    });*/

                    //遍历地为每一个图片绑定单击事件
                    $(".sync2 .owl-item .item a img").each(function (index, element) {
                        if ($(element).attr("onclick") != "") {
                            $(element).unbind("click");
                            $(element).on('click', function () {


                                $("#shapeId").attr('value', data[index].shape_id);
                                $("#SHAPE_NAME").text(data[index].item_shape);
                                $("#SHAPE_PRICE").text(data[index].shape_price);
                                $("#SHAPE_DESCRIBLE").text(data[index].shape_describle);
                                $("#SHAPE_AMOUNT").text(data[index].shape_amount);
                                $("#CATEGORY").text(data[index].categorydetail_name);
                                $(".tags-widget span a").css({'background-color': 'white', 'color': "#a3a19f"});
                                $(".tags-widget span a:eq(" + index + ")").css({
                                    "color": "#fff",
                                    "background-color": "#7fba00"
                                });

                            });
                        }
                    });
                    //遍历地对每一个口味名标签绑定事件
                    $(".tags-widget span a").each(function (index, element) {
                        $(element).on('click', function () {
                            $(".sync2 .owl-item .item a img:eq(" + index + ")").trigger('click');
                            console.log($(".tags-widget span a"));
                            $(".tags-widget span a").css({'background-color': 'white', 'color': "#a3a19f"});
                            //$(element).addClass("selected");
                            $(element).css({"color": "#fff", "background-color": "#7fba00"});

                        });
                    });


                } else {
                    $(".sync1 .owl-item,.sync2 .owl-item").css('display', 'none');
                }


                $('#closeModal').click(function () {
                    $(".sync2 .owl-item .item a img:eq(0)").trigger('click');
                    $(".sync1 img,.sync2 img").attr("src", "");
                    console.log("初始化成功");
                });

            });
            $('#product-preview').modal('show');
        }


        function addItemToCart() {
            console.log("点击购买方法")
            var shape_id = $('#shapeId').val();
            var user_id = '${user_session.user_id }';
            var item_shape = $('#SHAPE_NAME').text();
            console.log("这一步也执行了" + user_id)
            if (user_id == null || user_id == "") {
                console.log("111111111111")
                layer.alert('请先登录再购买商品!!!正在为您跳转到登录页面..', {icon: 0});
                setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                    window.location.replace("${pageContext.request.contextPath }/login.jsp")
                }, 1000);
                return false;

            }
            ;
            var amount = $('#amountText').val();

            if (amount > 0) {
                $.post("${pageContext.request.contextPath }/addItemToCart.action", {
                    "cartitem_amount": amount,
                    "shape_id": shape_id,
                    "item_shape": item_shape,
                    "user_id": user_id
                }, function (data) {
                    if (data == "OK") {
                        layer.alert('成功添加商品到购物车', {
                            icon: 1,
                        })
                    } else if (data == "FAIL") {
                        layer.alert('添加商品到购物车失败', {icon: 2});
                    } else if (data == "WARNING") {
                        layer.alert('抱歉，库存不足', {icon: 0});
                        <%--}else{--%>
                        <%--	console.log("未登录购买被拦截"+"2222222222222")--%>
                        <%--	layer.alert('请先登录再购买商品!',{icon: 0});--%>
                        <%--	setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒--%>
                        <%--		window.location.replace("${pageContext.request.contextPath }/login.jsp")--%>
                        <%--	}, 1000);--%>
                    }
                    ;
                });
            } else {
                layer.alert('请选择商品数量', {icon: 0});
            }
            ;


        }


    </script>


</head>
<body>
<c:if test="${user_session.user_level=='管理员' }">
    <%request.getRequestDispatcher("/WEB-INF/jsp/merchant.jsp").forward(request, response); %>
</c:if>
<div class="container first">


    <div class="row biaoti">
        <div class="col-lg-5 ">
            <img alt="" src="image/logo.jpg" width="40%">
        </div>
        <%
            if (session.getAttribute("user_session") == null) {
        %>
        <div class="col-lg-3">
            <form class="form-inline" method="post"
                  action="${pageContext.request.contextPath }/findItemByName.action" target="main">
                <div class="input-group input">
                    <input id="serachItemBox" type="text" class="form-control" name="item_name" placeholder="搜索你想要的商品">
                    <span class="input-group-btn">
								<button class="btn btn-primary" type="submit"
                                        style="height:45px;border-top-right-radius: 25px;border-bottom-right-radius: 25px;">
								<span style="color:white">搜索</span>
									<span style="color:white" class="glyphicon glyphicon-search"></span>
								</button>
							</span>
                </div>
            </form>
        </div>
        <div class="col-lg-2">

        </div>
        <div class="col-lg-2" style="margin-left:-20px">
            <div class="btn-group">
                <!--登录 -->
                <button id="login1" class="btn btn-primary btn-lg denglu">
                    登录
                </button>


                <!--注册 -->
                <button id="register1" class="btn btn-primary btn-lg denglu"
                        style="border-top-right-radius: 6px;border-bottom-right-radius: 6px;">
                    注册
                </button>
            </div>
        </div>


        <%
            }
            ;
        %>
        <%if (session.getAttribute("user_session") != null) {%>

        <div class="col-lg-4">

            <form class="form-inline" method="post"
                  action="${pageContext.request.contextPath }/findItemByName.action" target="main">
                <div class="input-group input">
                    <input type="text" class="form-control" id="serachItemBox" name="item_name" placeholder="搜索你想要的商品">
                    <span class="input-group-btn">
								<button class="btn btn-primary" type="submit"
                                        style="height:45px;border-top-right-radius: 25px;border-bottom-right-radius: 25px;">
								<span style="color:white">搜索</span>
									<span style="color:white" class="glyphicon glyphicon-search"></span>
								</button>
							</span>
                </div>
            </form>
        </div>

        <div class="col-lg-1">
            <a href="${pageContext.request.contextPath }/showCartList.action?id=${user_session.user_id}">
                <button type="button" class="btn btn-primary btn-lg denglu">
                    <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;购物车
                </button>
            </a>
        </div>

        <div class="col-lg-1">
            <div class="container">
                <div class="btn-group">
                    <div class="btn-group">
                        <button class="btn btn-default dropdown-toggle denglu" data-toggle="dropdown" type="button">
                            <span class="glyphicon glyphicon-user"></span>

                                ${user_session.user_code }



                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li data-toggle="modal" data-target="#userEditDialog">
                                <a href="#">修改个人信息</a>
                            </li>
                            <li data-toggle="modal" data-target="#userEditAddressDialog">
                                <a href="#">管理收获地址</a>
                            </li>
                            <li id="loginout" onclick="loginout()">
                                <a href="#">退出登录</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                修改个人信息
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <form class="form-horizontal" id="update">
                                    <input type="hidden" name="user_id" value="${user_session.user_id }"/>

                                    <div class="form-group">
                                        <label class="control-label col-lg-3">账号：</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="usercode" name="user_code" class="form-control"
                                                   placeholder="请输入要修改账号" value="${user_session.user_code }"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">密码：</label>
                                        <div class="col-lg-6">
                                            <input type="password" id="password" name="user_password"
                                                   class="form-control" placeholder="请输入要修改的密码"
                                                   value="${user_session.user_password }"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">电话号码：</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="phone" name="user_phone" class="form-control"
                                                   placeholder="请输入要修改电话号码" value="${user_session.user_phone }"/>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary" onclick="updateUser()">
                                确认修改
                            </button>
                        </div>

                    </div>
                </div>
            </div>


            <div class="modal fade" id="userEditAddressDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                管理收货地址
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <form class="form-horizontal" id="editAddress">
                                    <input type="hidden" name="user_id" value="${user_session.user_id }"/>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">收货人：</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="username" name="user_name" class="form-control"
                                                   placeholder="请输入真实姓名" value="${user_session.user_name }"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-lg-3">电话号码：</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="phone" name="user_phone" class="form-control"
                                                   placeholder="请输入电话号码" value="${user_session.user_phone }"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">宿舍栋号：</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="address" name="user_address" class="form-control"
                                                   placeholder="请输入收货宿舍号" value="${user_session.user_address }"/>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary" onclick="updateUserAddress()">
                                确认编辑
                            </button>
                        </div>

                    </div>
                </div>
            </div>



        </div>

        <%} %>


    </div>
    <!--左侧导航 -->

    <div class="row body1">
        <div class="col-lg-2 left1">


        </div>


        <!-- 右边的商品页面-->
        <div class="col-lg-10 right1">

            <iframe style="border:5px solid #ddd;" id="ItemFrame" name="main" width="102%" height="970px"
                    frameborder="6" src="findAllItem.action"></iframe>

        </div>

    </div>
    <center>
        <jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
    </center>
</div>
</div>


<!-- Product Preview Popup -->
<section class="modal fade" id="product-preview" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg product-modal" style="width:800px">
        <div class="modal-content">
            <a id="closeModal" aria-hidden="true" data-dismiss="modal" class="sb-close-btn close" href="#"> <i
                    class=" fa fa-close"></i> </a>

            <div class="product-single pb-50 clearfix">
                <!-- Single Products Slider Starts -->
                <div class="col-lg-6 col-sm-8 col-sm-offset-2 col-lg-offset-0 pt-50">
                    <div class="prod-slider sync1">
                        <div class="item">
                            <input type="hidden" id="shapeId" value="">
                            <input type="hidden" id="Id" value="0">
                            <img src="" alt="">
                            <a href="assets/img/products/prod-big-1.png" data-gal="prettyPhoto[prettyPhoto]"
                               title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                        </div>
                        <div class="item">
                            <input type="hidden" id="Id" value="2">
                            <img src="" alt="">
                            <a href="assets/img/products/prod-big-2.png" data-gal="prettyPhoto[prettyPhoto]"
                               title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                        </div>
                        <div class="item">
                            <input type="hidden" id="Id" value="3">
                            <img src="" alt="">
                            <a href="assets/img/products/prod-big-3.png" data-gal="prettyPhoto[prettyPhoto]"
                               title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                        </div>
                        <div class="item">
                            <input type="hidden" id="Id" value="4">
                            <img src="" alt="">
                            <a href="assets/img/products/prod-big-1.png" data-gal="prettyPhoto[prettyPhoto]"
                               title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                        </div>
                        <div class="item">
                            <input type="hidden" id="Id" value="5">
                            <img src="" alt="">
                            <a href="assets/img/products/prod-big-1.png" data-gal="prettyPhoto[prettyPhoto]"
                               title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                        </div>
                    </div>

                    <div class="sync2">
                        <div class="item"><a href="#"> <img style="width:120px;height:90px" src="" alt=""> </a></div>
                        <div class="item"><a href="#"> <img style="width:120px;height:90px" src="" alt=""> </a></div>
                        <div class="item"><a href="#"> <img style="width:120px;height:90px" src="" alt=""> </a></div>
                        <div class="item"><a href="#"> <img style="width:120px;height:90px" src="" alt=""> </a></div>
                        <div class="item"><a href="#"> <img style="width:120px;height:90px" src="" alt=""> </a></div>
                    </div>
                </div>
                <!-- Single Products Slider Ends -->

                <div class="col-lg-6 pt-50">
                    <div class="product-content block-inline">

                        <div class="tag-rate">
                            <span class="prod-tag tag-1">new</span> <span class="prod-tag tag-2">sale</span>
                            <div class="rating">
                                <span class="star active"></span>
                                <span class="star active"></span>
                                <span class="star active"></span>
                                <span class="star active"></span>
                                <span class="star active"></span>
                                <span class="fsz-12"> Based on 25 reviews</span>
                            </div>
                        </div>

                        <div class="single-caption">
                            <h3 class="section-title" style="height:40px">
                                <a href="#"> <span class="light-font" id="SHAPE_NAME">  </span> </a>
                            </h3>
                            <span class="divider-2"></span>
                            <p class="price">
                                <strong>¥</strong><strong class="clr-txt fsz-20" id="SHAPE_PRICE">50.00 </strong>
                            </p>

                            <div class="fsz-16" style="height:50px">
                                <p id="SHAPE_DESCRIBLE"></p>
                            </div>

                            <div class="prod-btns">
                                <div class="quantity">
                                    <button class="btn minus" onclick="minamount()"><i class="fa fa-minus-circle"></i>
                                    </button>
                                    <input id="amountText" title="数量" value="1" class="form-control qty" type="text">
                                    <button class="btn plus" onclick="addamount()"><i class="fa fa-plus-circle"></i>
                                    </button>
                                </div>


                            </div>
                            <ul class="meta">
                                <li><strong> 库存 </strong> <span id="SHAPE_AMOUNT"></span></li>
                                <li><strong> 类别 </strong> <span>:</span><span id="CATEGORY">  </span></li>
                                <li class="tags-widget"><strong> 口味名称 </strong> <span>:  <a href="JavaScript:void(0)"
                                                                                            style="color: #fff;background-color:#7fba00"
                                                                                            class="selected"></a> <a
                                        href="JavaScript:void(0)"></a> <a href="JavaScript:void(0)"></a> <a
                                        href="JavaScript:void(0)"></a><a href="JavaScript:void(0)"></a></span></li>
                            </ul>
                            <div class="divider-full-1"></div>
                            <div class="add-cart">
                                <a href="JavaScript:void(0)" class="theme-btn btn" onclick="addItemToCart()"> <strong>
                                   添加到购物车 </strong> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- / Product Preview Popup -->


<!-- JS Global -->
<script src="assets/js/plugin/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="assets/js/plugin/bootstrap.min.js"></script>
<script src="assets/js/plugin/bootstrap-select.min.js"></script>
<script src="assets/js/plugin/owl.carousel.min.js"></script>
<script src="layer\layer.js"></script>


<!-- Custom JS -->
<script src="assets/js/theme.js"></script>


<script type="text/javascript">
    $(function () {

        /*$(".sync1 .owl-item[class$=active]").find('#Id').change(function(){
            console.log("we did it")
        });
        $('.owl-stage .owl-item .item #Id').change(function(){
            console.log($('.owl-stage .owl-item .item #Id'));
        });*/
        $.get("selectCategoryAndDetail.action", function (data) {
            for (var i = 0; i < data.length; i++) {
                var categorycode = "<div class='panel panel-default'><div class='panel-heading'><a data-toggle='collapse' data-parent='#panelContainer' href='#collapsel" + i + "'><h4 class='panel-title'>" + data[i].category_name + "</h4></a></div></div>"

                $(".col-lg-2.left1").append(categorycode);
                if (data[i].categoryDetailList.length > 0) {
                    var categorydetailparentcode = "<div id='collapsel" + i + "' class='panel-collapse collapse'><div class='panel-body'></div></div>";
                    $(".panel.panel-default:eq(" + i + ")").append(categorydetailparentcode);
                }
                for (var j = 0; j < data[i].categoryDetailList.length; j++) {
                    var categorydetailcode = "<a href='${pageContext.request.contextPath }/findItemByCategory.action?item_categorydetail=" + data[i].categoryDetailList[j].categorydetail_name + "' target='main'>" + data[i].categoryDetailList[j].categorydetail_name + "</a><br><br>";
                    $(".panel-body:eq(" + i + ")").append(categorydetailcode);
                }


            }
            ;
        });


        var AllItemName = [];
        $.get("selectAllItemName.action", function (data) {

            for (var i = 0; i < data.length; i++) {
                AllItemName.push(data[i]);
            }


        });
        $("#serachItemBox").autocomplete({
            source: AllItemName
        });

        document.cookie = "time=0";
    });

    $("#register1").on('click', function () {
        window.location.replace("${pageContext.request.contextPath }/register.jsp")
    });

    $("#login1").on('click', function () {
        window.location.replace("${pageContext.request.contextPath }/login.jsp")
    });

</script>


<!--  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.2.2.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>-->
</body>
</html>