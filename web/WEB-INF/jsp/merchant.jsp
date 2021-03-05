<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
		<script type="text/javascript" src="js/jquery-2.2.2.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<style type="text/css">
			body
			{
				background-color: rgb(57,62,66);	
			}
			.first
			{
				background-color: white;	
				width: 93%;
			}
			.left1{
				 border: 5px solid #ddd;
				width:16%;
				height:900px;	
			}
			.right1
			{
				width:82%;
				height: 1000px;	
			}
			.denglu
			{
				margin-top: 20px;
				
				height:45px;	
			}
			
			
			
		</style>

	<script src="js/jquery-2.2.2.js"></script>
	<script src="layer/layer.js"></script>
		<script type="text/javascript">
		function deleteItem(id){
			console.log("进入父方法")
			console.log(id)
			layer.confirm('确定下架商品？', {
				  btn: ['确定','取消'], //按钮
				  icon:3
				}, function(){
					console.log("点击确定");
					console.log(id);
					 $.post("${pageContext.request.contextPath }/deleteItem.action",{"shape_id":id},function(data){
						  if(data =="OK"){
								document.getElementById('main1').contentWindow.location.reload();
								setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
									layer.msg('成功下架商品',{icon:1});
									},0);
								layer.close(layer.index);                            
							}
						    else{
						    	setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
									layer.msg('下架商品失败',{icon:1});
									},0);
								layer.close(layer.index);   
							}
						});
				 
				}, function(){
				  
				});
		}
		
		
		
		  function recoverItem(id){
			  layer.confirm('是否上架商品？', {
				  btn: ['确定','取消'], //按钮
				  icon:3
				}, function(){
					console.log("点击确定");
					 $.post("${pageContext.request.contextPath }/recoverItem.action",{"shape_id":id},function(data){
						  if(data =="OK"){
								document.getElementById('main1').contentWindow.location.reload();
								setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
									layer.msg('成功上架商品',{icon:1});
									},0);
								layer.close(layer.index);                            
							}
						    else{
						    	setTimeout(function(){  //使用  setTimeout（）方法设定定时0秒后显示
									layer.msg('上架商品失败',{icon:1});
									},0);
								layer.close(layer.index);   
							}
						});
				 
				}, function(){
				  
				});
		  }
		
		
		function loginout(){
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
		}
		function getCookie(cname)
		{
		  var name = cname + "=";
		  var ca = document.cookie.split(';');
		  for(var i=0; i<ca.length; i++) 
		  {
		    var c = ca[i].trim();
		    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
		  }
		  return "";
		}
		
		$(function(){
			document.getElementById('main1').contentWindow.location.reload(true);
		   $('iFrame').attr("src","MerchantFindAllItem.action");
		});
			/*if(getCookie("time")!=""&&getCookie("time")!=null){
				console.log(getCookie("time"))
				if(getCookie("time")==0){
					/*setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
						window.location.reload();//页面刷新
						},1);
					
					console.log("haha")
					window.location.reload()
					
					}
				document.cookie ="time=1";
				console.log("we did it!");
			}*/
			
			
	
			
		
		</script>
</head>
<body>
<div class="container first">
			<div class="row">
				<div class="col-lg-10">
					<img alt="" src="image/logo.jpg" width="30%">
				</div>
				<div class="col-lg-2">
					<div class="container">
				 		<div class="btn-group">
				 			<div class="btn-group">
				 			<button class="btn btn-default dropdown-toggle denglu" data-toggle="dropdown"  type="button">
				 					admin:
				 					${user_session.user_name }
				 					<span class="caret"></span>
				 				</button>
				 				<ul class="dropdown-menu">
				 					<li>
				 						
				 					</li>
				 					<li   onclick="loginout()">
				 						<a href="#">退出登录</a>
				 					</li>
				 				</ul>
				 			
				 			</div>
				 		</div>
				 	</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2 left1">
									
					<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#panelContainer" 
									   href="#collapsel1">
										商品管理
									</a>
								</h4>
							</div>
							<div id="collapsel1" class="panel-collapse collapse">
								<div class="panel-body">
								<a href="${pageContext.request.contextPath }/MerchantFindAllItem.action" target="main1">管理商品</a><br /><br />
								<a href="${pageContext.request.contextPath }/toaddItem.action" target="main1">新增商品</a>
								</div>
							</div>
							
					</div>
					
					
					<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="${pageContext.request.contextPath }/toItemCategory.action" target="main1">
										商品类别管理
									</a>
								</h4>
							</div>
						
						</div>	
							
							
					<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#panelContainer" 
									   href="#collapsel3">
										用户订单
									</a>
								</h4>
							</div>
							<div id="collapsel3" class="panel-collapse collapse">
								<div class="panel-body">
									<a href="${pageContext.request.contextPath }/toOrders.action" target="main1">查看所有订单</a>
								</div>
							</div>
					</div>
				</div>
									
<!-- 右边的商品页面-->
				<div class="col-lg-10 right1">
					<!--<iframe id="iframe" name="main" width="100%" height="600px" frameborder="0" scrolling="auto" src="MerchantFindAllItem.action"></iframe>-->
						<iframe id="main1" style="border:5px solid #ddd;" name="main1" width="100%" height="90%" frameborder="1" scrolling="no" src="MerchantFindAllItem.action"></iframe>
				</div>
	
			</div>
		<center>
			<%@include  file="inc/footer.inc"%>
			</center>
		</div>
</body>
</html>