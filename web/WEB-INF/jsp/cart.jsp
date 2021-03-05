<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/jquery-2.2.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<style type="text/css">
			
			
			body{
				background-color: rgb(57,62,66);
				
				
			}
			.all{
				height:100%;
				background-color: white;
				width:90%;
				
			}
			.zhu{
				background-color: white;
				height: 680px;
				width:90%;
					
			}
			.main1{
				height: 70px;
			}
			.footer{
				background-color: white;
			}
			.denglu
			{
				height:45px;	
			
			}
		</style>


	<script src="layer/layer.js"></script>
<script type="text/javascript">


  function submit(user_id){
	  console.log("let'go")
	  console.log(user_id)
	  console.log("let'go")
	  var totalPrice = '${totalPrice}';
	  
	 var user_address = '${user_session.user_address}';
	 
	 layer.confirm('确定收货地址为:'+user_address+"吗?", {
		  btn: ['确定','取消'], //按钮
		  icon:3
		}, function(){
			  $.post("${pageContext.request.contextPath }/cartSubmit.action",{"user_id":user_id},function(data){
				  if(data =="OK"){
						setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
							layer.msg("结算成功，共消费"+totalPrice+"元",{icon:1});
							},0);
						layer.close(layer.index);
						setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
							window.location.reload();
							},600);
						
					}else if(data =="empty"){
						setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
							layer.msg("您暂未购买任何商品",{icon:7});
							},0);
					}
				    else{
				    	setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
							layer.msg('结算失败',{icon:2});
							},0);
						layer.close(layer.index);   
					}
				});
		 
		}, function(){
		  
		});
	 
	 
	 /* if(confirm('确定收货地址为:'+user_address+"吗?")==true){
	  $.post("${pageContext.request.contextPath }/cartSubmit.action",{"user_id":user_id},function(data){
			if(data =="OK"){
				alert("结算成功，共消费"+totalPrice+"元");
				window.location.reload();
			}else if(data =="empty"){
				setTimeout(function(){layer.msg("您暂未购买任何商品",{icon:7})},1500);
				window.location.reload()
			}else{
				alert("结算失败");
			}
		});
	  }*/
  }
  
  function deleteCartItem(cartitem_id){
	  $.post("${pageContext.request.contextPath }/deleteCartItem.action",{"cartitem_id":cartitem_id},function(data){
			if(data =="OK"){
				setTimeout(function(){window.location.reload();},300);
				setTimeout(function(){layer.msg("移除商品成功",{icon:1})},0);
				
			}else if(data=="FAIL"){
				setTimeout(function(){window.location.reload();},300);
				setTimeout(function(){layer.msg("移除商品失败",{icon:2})},0);
			}
		});
  }
  
  
  
  $(function(){
	  var user_id='${user_session.user_id}';
	  $.get("${pageContext.request.contextPath }/showCartList1.action",{"user_id":user_id},function(data){
			if(data == "FAIL"){
				$("#msg").html("购物车空空如也，快去购买商品吧");
			}
		});
  });

</script>
</head>

<body>
<center>
	<div class="all">
		<div class="container zhu">
			<div class="row">
				<div class="col-lg-2">
					<h1>购物车</h1>
				</div>
				<div class="col-lg-10">
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<ul class="nav nav-tabs">
						<li class="active"><a>全部商品</a></li>
					</ul>
					<br />
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="container">
								<div class="row">
									<div class="col-lg-1">
										序号
									</div>
									<div class="col-lg-2">
										图片
									</div>
									<div class="col-lg-2">
										商品名
									</div>
									<div class="col-lg-2">
									           单价
									</div>
									<div class="col-lg-2">
										数量
									</div>
									<div class="col-lg-1">
									           金额
									</div>
									<div class="col-lg-1">
										是否移除
									</div>
									
								</div>
								<hr />
								<center><span id="msg" style="font-size:30px"></span></center>
						<c:forEach items="${cartitems }" var="cartitem">		
								<div class="row main1">
									<div class="col-lg-1">
									    ${cartitem.cartitem_id }
									</div>
									<div class="col-lg-2">
											<img src="${cartitem.shape.shape_image }" title="${cartitem.shape.shape_image }"  style="height:80px;margin-top:-10px" />
									</div>
									<div class="col-lg-2">
										${cartitem.shape.item_shape }
									</div>
									<div class="col-lg-2">
										${cartitem.shape.shape_price }
									</div>
									<div class="col-lg-2">
										${cartitem.cartitem_amount }
									</div>
									<div class="col-lg-1">
									    ${cartitem.sum }
									</div>
									
									<div class="col-lg-1">
										<button class="btn btn-danger" onclick="deleteCartItem('${cartitem.cartitem_id }')">移除</button>
									</div>
								
								</div>
								<hr />
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="container footer">
			<div class="row">
				<div class="col-lg-6">
				</div>
				<div class="col-lg-3">
				<span style="font-size:32px">总价：${totalPrice }元</span>
				</div>
				<div class="col-lg-1">
				  <a href="index.jsp">
				  <button class="btn btn-default btn-primary denglu">继续购物</button>
				  </a>
				</div>
									
				<div class="col-lg-1">
					<button class="btn btn-default btn-success denglu" onclick="submit('${user_session.user_id }')">&nbsp;&nbsp;结&nbsp;&nbsp;算&nbsp;&nbsp;</button>
				</div>
				<div class="col-lg-1">
				</div>
			</div>
			<br />
		</div>
	</div>
</center>		
</body>
</html>