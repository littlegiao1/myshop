<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sssg" uri="http://sssg.com/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/bootstrap.min.js"></script>
		<style type="text/css">
			body{
				
				width:100%;
			
				
			}
			.zhu{
				background-color: white;
				height:540px;
				width:100%;
					
			}
			.main{
				
				width:100%;
				height:570px;
				float:left;
			}
			.main1{
				height: 70px;
				
			}
			
			.footer{
				background-color: white;
				width:100%;
				height:60px;
			}
			
		</style>
		<script type="text/javascript">
		
		</script>
</head>
<body>
<div class="container zhu">
			
			<div class="row">
				<div class="col-lg-2">
					<h1>订单管理</h1>
				</div>
				<div class="col-lg-10">
					
				</div>
			</div>
			
			<div class="row">
					<ul class="nav nav-tabs">
						<li class="active"><a>全部商品</a></li>
					</ul>
					<br />
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							
								<div class="row">
									<div class="col-sm-1">
										 <center><span>序号</span></center>
									</div>
									<div class="col-sm-2">
										<span style="margin-left:10px">顾客姓名</span>
									</div>
									<div class="col-sm-4">
										<center><span>商品列表</span></center>
									</div>
									
									<div class="col-sm-1">
										价格
									</div>
									<div class="col-sm-1">
									         顾客电话
									</div>
									<div class="col-sm-1">
										    地址
									</div>
									<div class="col-sm-2">
										  <center>订单时间</center>
									</div>
								</div>
								<hr />
				<div class="main">				
					<c:forEach items="${page.rows }" var="order">
								<div class="row main1">
									<div class="col-sm-1">
										<center> <span>${order.order_id }</span></center>
									</div>
									<div class="col-sm-2">
									   <span style="margin-left:20px"> ${order.user.user_name }</span>
									</div>
									<div class="col-sm-4">
									<center>
									   <c:forEach items="${order.carts }" var="cart">
									   <c:forEach items="${cart.cartitems }" var="cartitem">
										${cartitem.shape.item_shape }×${cartitem.cartitem_amount }
								       </c:forEach>
								       </c:forEach>
								       </center>
									</div>
									<div class="col-sm-1">
										<c:forEach items="${order.carts }" var="cart">
										${cart.totalprice }
										</c:forEach>
									</div>
									<div class="col-sm-1">
									${order.user.user_phone }
									</div>
									<div class="col-sm-1">
									${order.user.user_address }
									</div>
									<div class="col-sm-2">
									${order.create_time }
									</div>
								</div>
								<hr />
					</c:forEach>
			</div>
			</div>		
			<div class="text-right">
						<sssg:page url="${pageContext.request.contextPath }/toOrders.action" />
				</div>
		</div>			
	</div>
	
</div>
		


		
</body>
</html>