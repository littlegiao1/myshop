<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sssg" uri="http://sssg.com/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="theme/default/layer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/bootstrap.min.js"></script>
		 <script src="js/layer.js"></script>
		<style type="text/css">
			body{
				
				
			
				
			}
			.container{
			width:100%;
				float:left;
				
			}
			.header{
			width:100%;
			height:75px;
			margin-top:20px;
			 
			}
			.main{
				
				width:100%;
				height:550px;
				float:left;
			}
			
			.main1{
				height: 40px;
			}
			
			.footer{
				background-color: white;
				width:100%;
				height:60px;
			}
			
			
			
			
			
		
			
			
		</style>
		<script type="text/javascript">
	
		
		$(function(){
			
			if($('.main1').length==0){
				$('.main').append("<center><span id='msg' style='font-size:30px'>无相应商品</span></center>");
			}//若没有查询到商品则显示无对应商品
			
			
			var item_category=$('#item_category').val();
			console.log("所选择的category",item_category);
			var itemcategory_detailcode = "<option value=''>--请选择--</option>";
			  $.post("${pageContext.request.contextPath }/changeCategoryDetail.action",{'item_category':item_category},function(data){
				  console.log(data);
                           for(var i=0;i<data.length;i++){
                        	   $("#categorydetail_name").append(itemcategory_detailcode);
                        	   var j=i+1;
                        	   console.log("length",$('#categorydetail_name>option').length);
                        	   $("#categorydetail_name").find("option:eq("+j+")").text(data[i].categorydetail_name);
                        	   $("#categorydetail_name").find("option:eq("+j+")").val(data[i].categorydetail_id);
                           }
                           
                           
                           $('#categorydetail_name>option').each(function(index,element){
           					console.log(index,element)
           				 if($(element).val()==$("#ITEMCATEGORYDETAILMSG").val()){
           					 $(element).attr("selected","true");
           				  }
           				 });//将用户选择的类别详细选中
				 
			  });//将页面加载完毕后selected的option对应的类别详细填充到下拉框中
			  
			  
			 
			
			$('.main1 #shape_state').each(function(index,element){
				if($(this).val()==1){
					console.log($(this).parent().find("#deleteShapeButton").val());
					console.log($(this).next().val());
					console.log($(this).next().val());
					var shape_id = $(this).next().val();
					$(this).parent().find("#deleteShapeButton").text('上架');
					$(this).parent().find("#deleteShapeButton").removeAttr("onclick");
					$(this).parent().find("#deleteShapeButton").attr("onclick","recoverItem("+shape_id+")");
					
				}
			});//当商品被下架时将按钮的文字喝绑定事件修改
		
			
			
			$('#item_category').change(function(){
				console.log($("#item_category").val());
				var item_category = $("#item_category").val();
				$("#categorydetail_name>option").remove();
				 $.post("${pageContext.request.contextPath }/changeCategoryDetail.action",{'item_category':item_category},function(data){
					 console.log(data);
						for(var i=0;i<data.length;i++){
							var option = "<option value="+data[i].categorydetail_id+">"+data[i].categorydetail_name+"</option>";
							$('#categorydetail_name').append(option);
						}
					});
			});//当商品类别下拉框的值改变时动态地将被selected的商品类别对应的类别详细信息填充到对应下拉框
			
			/*$(".main1").each(function(e){
				console.log("点击的控件为"+e.target);
				console.log("遍历进入");
				console.log($(".main1 #shape_state"));
				if($(".main1 #shape_state").val()==1){
					console.log("点击的控件为"+e.target);
					$(".main1").css('background','gray');
					$(".main1 #deleteShapeButton").text('上架');
					var shape_id = $(".main1 #shape_id").val();
					$(".main1 #deleteShapeButton").attr("onclick","recoverItem("+shape_id+")");
				}
			});*/
		
			
			/*console.log($(".main1 #shape_state")[1].parentNode);
			console.log($(".main1 #shape_state[value=1]").length);
			
			$(".main1 #shape_state[value=1] #deleteShapeButton").text('上架');
			for(var i=0;i<$('.main1 #shape_state[value=1]').length;i++){
					
				
					$(".main1 #deleteShapeButton").attr("onclick","recoverItem("+shape_id+")");
				
			}
			*/
		});
		
		
		
		
		  function updateItem(id,price,amount){
			  console.log(id);
		      var price = $("#"+price+"").val();
		      var amount = $("#"+amount+"").val();
			  $.post("${pageContext.request.contextPath }/updateItem.action",{"shape_id":id,"shape_price":price,"shape_amount":amount},function(data){
					if(data =="OK"){
						layer.msg("成功更新商品",{icon:1});
						setTimeout(function(){window.location.reload()},1500);
						
					}
				    else{
				    	layer.msg("更新商品失败",{icon:2});
						setTimeout(function(){window.location.reload()},1500);
					}
				});
		  }
		  
		  function recoverItem(id){
			  window.parent.recoverItem(id);
			  console.log("id:"+id)
			  /*if(confirm("是否上架商品")==true){
				  $.post("${pageContext.request.contextPath }/recoverItem.action",{"shape_id":id},function(data){
					  if(data =="OK"){
							alert("成功上架架商品");
							window.location.reload();
						}
					    else{
							alert("上架商品失败");
							window.location.reload();
						}
					});
			  }
		  }*/
		  }
		  
		  
		  
		  function deleteItem(id){
			  console.log(id)
			  window.parent.deleteItem(id);
			  /*layer.confirm('确定下架商品？', {
				  btn: ['确定','取消'], //按钮
				  icon:3
				}, function(){
					 $.post("${pageContext.request.contextPath }/deleteItem.action",{"shape_id":id},function(data){
						  if(data =="OK"){
								alert("成功下架商品");
								window.location.reload();
							}
						    else{
								alert("下架商品失败");
								window.location.reload();
							}
						});
				 
				}, function(){
				  
				});
			  
			  if(confirm("是否下架商品")==true){
			  $.post("${pageContext.request.contextPath }/deleteItem.action",{"shape_id":id},function(data){
				  if(data =="OK"){
						alert("成功下架商品");
						window.location.reload();
					}
				    else{
						alert("下架商品失败");
						window.location.reload();
					}
				});
		  }*/
		  }
		  
		  
		
	
		</script>
</head>
<body>
<div class="container">
  <div class="header">
			<div class="row">
				<div class="col-sm-2">
					<h2>商品管理</h2>
				</div>
				<div class="col-sm-10">
					
					
					
					
				<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/findItemByCondition.action">
					<div class="form-group">
						<label for="item_name">商品名称</label> 
						<input type="text" style="width:100px" class="form-control" id="item_shape" 
						                   value="${item.shapeList[0].item_shape }" name="shapeList[0].item_shape" />
					</div>
					<div class="form-group">
						<label>查询条件</label> 
						<select	class="form-control" id="item_state" name="shapeList[0].shape_state">
							<option value="2" <c:if test="${item.shapeList[0].shape_state ==  2}">selected</c:if>>所有商品</option>
							<option value="0" <c:if test="${item.shapeList[0].shape_state ==  0}">selected</c:if>>已上架商品</option>
							<option value="1" <c:if test="${item.shapeList[0].shape_state ==  1}">selected</c:if>>已下架商品</option>
						</select>
					</div>
					<div class="form-group">
						<label>商品类别</label> 
						<select	class="form-control" id="item_category"  name="item_category">
							<option value="">--请选择--</option>
							<c:forEach items="${categoryList}" var="category">
								<option value="${category.category_name}" <c:if test="${item.item_category ==  category.category_name}">selected</c:if>>
								    ${category.category_name}
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>类别详细</label>
						<select	class="form-control" id="categorydetail_name" name="item_categorydetail" style="width:120px">
							<option value="" >--请选择--</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>	
					
					
					
					
					
					
					
				 </div>	
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
										序号
									</div>
									<div class="col-sm-2">
										<span style="margin-left:20px">图片</span>
									</div>
									<div class="col-sm-2">
										商品名
									</div>
									
									<div class="col-sm-2">
										类型
									</div>
									
									<div class="col-sm-2">
										价格
									</div>
									<div class="col-sm-1">
									             数量
									</div>
									<div class="col-sm-1">
										修改
									</div>
									<div class="col-sm-1">
										下架
									</div>
								</div>
								<hr />
								<input type="hidden" value="${item.item_categorydetail }" id="ITEMCATEGORYDETAILMSG">
				<div class="main">			
					<c:forEach items="${page.rows }" var="item" varStatus="vss">
					<c:forEach items="${item.shapeList }" var="shape" varStatus="vs">
								<div class="main1">
								<input type="hidden" id="shape_state" value="${vs.current.shape_state }">
								<input type="hidden" id="shape_id" value="${vs.current.shape_id }">
									<div class="col-sm-1">
										<span style="margin-left:10px">${vs.index+1 }</span>
									</div>
									<div class="col-sm-2">
										<img src="${vs.current.shape_image }" title="${item.item_name }"  style="height:50px" />
									</div>
									<div class="col-sm-2">
										${vs.current.item_shape }
									</div>
									<div class="col-sm-2">
										${item.item_categorydetail }
									</div>
									<div class="col-sm-2">
										  <input type="text" id="${vs.current.shape_id }price" style="width:50px" value="${vs.current.shape_price }"> 
									</div>
									<div class="col-sm-1">
									  <input type="text" id="${vs.current.shape_id }amount" style="width:50px" value="${vs.current.shape_amount }"> 
									</div>
									
									<div class="col-sm-1">
										<button class="btn btn-primary" style="margin-left:-10px" onclick="updateItem('${vs.current.shape_id }','${vs.current.shape_id }price','${vs.current.shape_id }amount')">修改</button>
									</div>
										<div class="col-sm-1">
										<button id="deleteShapeButton" class="btn btn-danger" style="margin-left:-10px" onclick="deleteItem('${vs.current.shape_id }')" value="ss">下架</button>
									</div>
								</div>
								<hr />
								</c:forEach>
					</c:forEach>
				</div>	
			</div>	
			
			
			
			
			
			 <c:choose>
                 <c:when test="${all>0 }"> 
                           <div class="text-right">
						      <sssg:page url="${pageContext.request.contextPath }/MerchantFindAllItem.action" />
				           </div>                                
                  </c:when>
                   <c:otherwise>
                      <div class="text-right">
						      <sssg:page url="${pageContext.request.contextPath }/findItemByCondition.action" />
				      </div>     
                   </c:otherwise>
            </c:choose>
			
			
			
			
			
		</div>			
	</div>
</div>
		


		
</body>
</html>