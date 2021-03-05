<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="theme/default/layer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<script type="text/javascript" src="js/jquery.validate.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-2.2.2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		 <script src="js/layer.js"></script>
		<style type="text/css">
			body{
				text-align:center;
				width:100%;
			
				
			}
			.zhu{
				background-color: white;
				height:700px;
				width:100%;
				float:left;
					
			}
			
			.footer{
				background-color: white;
				width:100%;
				height:60px;
			}
			.form-control{
			    width:200px;
			    height
			}
			
		</style>
		<script type="text/javascript">
		
	
		function addItem(){
			console.log("kuolieyagatong");
			console.log($("#add").serialize());
			 $.post("${pageContext.request.contextPath }/merchantAddItem.action",$("#add").serialize(),function(data){
					if(data =="OK"){
						layer.alert("成功添加商品",{icon:1});
					
					}else{
						layer.alert("添加商品失败",{icon:2});
					}
				});
		}
		
		
		$(function(){
			$('#item_category').change(function(){
				console.log($("#item_category").val());
				var item_category = $("#item_category").val();
				 $.post("${pageContext.request.contextPath }/changeCategoryDetail.action",{'item_category':item_category},function(data){
					 console.log(data);
						for(var i=0;i<data.length;i++){
							var option = "<option value="+data[i].categorydetail_id+">"+data[i].categorydetail_name+"</option>";
							$('#categorydetail_name').append(option);
						}
					});
			});
			
			
			
			
			$('#upload').click(function(){
				console.log($('#showFileName img').length);
				if($('#showFileName img').length>0){
					layer.alert("该口味已被添加",{icon:7});
				}else{
					
				
				console.log($("#file").val());
			//利用FormData对象上传文件，以二进制形式提交文件
			var formData = new FormData();
			var file=$('#file')[0].files;
			formData.append('file1',file[0]);
			$.ajax({
			url:'Upload.action',
			type:'POST',
			data:formData,
			//因为data是FormData对象，不需要对数据做处理
			processData:false,
			//因为data是FormData对象，不需要设置上传参数类型
			contentType:false,
			//设置上传文件是否需要缓存
			cache:false,  success:function(re){
				console.log(re);
			$('#showFileName').append("<img style='width:50px;height:80px;' src='image/"+re+"' />");
			//$('#showFileName').append(re);
			var a = $('#item_image').val("image/"+re);
			
			$('#addShape').before("<div class='model' style='width:75px;height:80px;float:left'><div class='modal-content'><button type='button' class='close'>&times;</button><img class='11' style='width:70px;height:60px;' src='image/"+re+"' /><input type='hidden' id='shape_image' name='shape_image' value='image/"+re+"'><input type='hidden' id='shape_amount' name='shape_amount' value=''><input type='hidden' id='shape_name2' name='item_shape' value=''><input type='hidden' id='shape_price' name='shape_price' value=''><input type='hidden' id='shape_describle' name='shape_describle' value=''><span id='shape_name' value='' style='fontSize:2px'></span></div></div>");
			$('.model .modal-content #shape_amount:last').attr('value',$('#shape_amount1').val());
			$('.model .modal-content #shape_name2:last').attr('value',$('#item_name').val()+$('#item_shape').val());
			$('.model .modal-content #shape_price:last').attr('value',$('#shape_price1').val());
			$('.model .modal-content #shape_describle:last').attr('value',$('#shape_describle1').val());
			$('span:last').html($('#item_shape').val());
			$('span:last').attr('value',$('#item_shape').val());
			console.log($('span:last').val());
			console.log($("#shape_image").val()); 
			layer.msg('成功添加口味！',{icon:1});
			},
			error:function(re){
			layer.alert('添加口味失败！',{icon:2});
			}
			});
			}
			});
			
			
			$('#upload1').click(function(){
				if($('#showFileName1 img').length>0){
					layer.alert("该商品已被添加",{icon:7});
				}else{
				console.log($("#file").val());
			//利用FormData对象上传文件，以二进制形式提交文件
			var formData = new FormData();
			var file=$('#file1')[0].files;
			formData.append('file1',file[0]);
			$.ajax({
			url:'Upload.action',
			type:'POST',
			data:formData,
			//因为data是FormData对象，不需要对数据做处理
			processData:false,
			//因为data是FormData对象，不需要设置上传参数类型
			contentType:false,
			//设置上传文件是否需要缓存
			cache:false,  success:function(re){
				console.log(re);
			$('#showFileName1').append("<img style='width:50px;height:80px;' src='image/"+re+"' />");
			//$('#showFileName').append(re);
			var a = $('#item_image1').val("image/"+re);
			console.log($('#allShape .model .modal-content #shape_image')[0]);
		
			for(var i = 0;i<$('#allShape .model').length;i++){
				$('#allShape .model .modal-content #shape_image')[i].setAttribute('name','shapeList['+i+'].shape_image');
				console.log("what fuck");
				$('#allShape .model .modal-content #shape_amount')[i].setAttribute('name','shapeList['+i+'].shape_amount');
				$('#allShape .model .modal-content #shape_name2')[i].setAttribute('name','shapeList['+i+'].item_shape');
				$('#allShape .model .modal-content #shape_price')[i].setAttribute('name','shapeList['+i+'].shape_price');
				$('#allShape .model .modal-content #shape_describle')[i].setAttribute('name','shapeList['+i+'].shape_describle');
			};
			console.log(a);
			addItem();
			
			},
			error:function(re){
			layer.alert('上传商品失败！',{icon:2});
			}
			});
				}
			});	
			
       			
			
		$("#addShape").click(function(){
			
			$('#showFileName').html("");
			
		});
			
        $("#myModal .modal-dialog .modal-content .modal-header .close,#myModal .modal-dialog .modal-footer .close").click(function(){
        	console.log("you click close");
        	console.log($('#shape_amount:last'));
			if($('.model')[4]){
				$('#addShape').remove();
			}
			
			
		});
		
		$("#allShape").on("click",".model .modal-content .close",function(e){
			var a = e.target;
			a.parentNode.parentNode.remove();
		});
		});
		</script>
</head>
<body>
<center>
<div class="container zhu">
			
			<div class="row">
				<div class="col-lg-2">
					<h1>上架商品</h1>
				</div>
				<div class="col-lg-10">
				</div>
			</div>







           <form class="form-group" id="add">
					<div class="form-group">
						<label for="item_name">商品名称</label> 
						<input type="text" class="form-control" id="item_name"  placeholder="请输入商品名称" value="" name="item_name" />
					</div>
					<div class="form-group">
						<label for="customerFrom">商品类别</label> 
						<select	class="form-control" id="item_category" name="item_category">
							<option value="">--请选择--</option>
							<c:forEach items="${categoryList }" var="item_category">
							<option value='${item_category.category_name }'>${item_category.category_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="customerFrom">商品类别详细</label> 
						<select	class="form-control" id="categorydetail_name" name="item_categorydetail">
							<option value="">--请选择--</option>
							
						</select>
					</div>
						<div class="form-group">
						<label  for="custIndustry">商品口味(最多可上传5种口味)</label><br>
						<center>
						<div id="allShape" style="width:35%;height:105px;border:1px solid black;">
						
						<a href="#" id="addShape" data-toggle="modal" data-target="#myModal"><img alt="添加商品" style="float:left" src="image/add.jpg" width="20%" height="100%" title="添加口味 "></a>
						</div><br>
					</center>
						<div class="form-group">
						
						
						
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel">
											添加口味
										</h4>
									</div>
									<div class="modal-body">
										<div class="form-horizontal">
										<form class="form-horizontal" id="login" method="post">
											<div class="form-group">
												<label class="control-label col-lg-3">口味名称：</label>
												<div class="col-lg-6">
													<input type="text" id="item_shape" class="form-control" placeholder="请输入口味名称,例如原味" value=""/>
												</div>
											</div>
											<div class="form-group">
						<label for="custIndustry">商品价格</label> 
						<input type="text" class="form-control" id="shape_price1" value="" name="shape_price" placeholder="请输入该食品口味的价格" />
					</div>
											<div class="form-group">
												<label class="control-label col-lg-3">库存量：：</label>
												<div class="col-lg-6">
													<input type="text" id="shape_amount1" name="shape_amount" class="form-control" placeholder="请输入该食品口味的库存量" value=""/>
												</div>
											</div>
											 <div class="form-group">
                    <label for="custIndustry">商品描述</label> 
					<textarea style="width:300px" class="form-control" autofocus="autofocus" rows="3" cols="100" id="shape_describle1"  name="shape_describle" maxlength="300" placeholder="请输入商品描述">
					
					</textarea>
					</div>
											<div class="form-group">
						<label for="custIndustry">口味图片</label> 
						<input type="file" multiple="multiple" id="file" />
					     
					     <input type="hidden" id="shape_image" name="shape_image" value="">
					</div>
					
                   <div id="showFileName" style="width:50px;height:100px">

                    </div>
					
					<button id="upload" type="button" class="btn btn-primary">添加该口味</button>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" id="over" class="close" data-dismiss="modal" aria-hidden="true">
											完成
										</button>
										
									</div>
								</div>
							</div>
						</div>
						
						
						
						
						
						
					<br>
					
					
					<div class="form-group">
						<label for="custIndustry">商品图片</label> 
						<input type="file" multiple="multiple" id="file1" />
					     
					     <input type="hidden" id="item_image1" name="item_image" value="">
					</div>
					
                   <div id="showFileName1" style="width:50px;height:100px">

                    </div>
                   
					<button id="upload1" type="button" class="btn btn-primary">添加该商品</button>
					
				</form>








			</center>

		
</body>
</html>