<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<script type="text/javascript" src="js/jquery.validate.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			body{
				
				width:100%;
			
				
			}
			.zhu{
				background-color: white;
				height:540px;
				width:100%;
					
			}
			.main1{
				height: 70px;
				
			}
			
			.footer{
				background-color: white;
				width:100%;
				height:60px;
			}
			.form-control{
			    width:200px;
			}
			
		</style>
		<script type="text/javascript">
		
		function addItem(){
			 $.post("${pageContext.request.contextPath }/merchantAddItem.action",$("#add").serialize(),function(data){
					if(data =="OK"){
						alert("成功添加商品");
					
					}else{
						alert("添加商品失败");
					}
				});
		}
		
		
		$(function(){
			$('#upload').click(function(){
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
			console.log(a);
			addItem();
			},
			error:function(re){
			alert('上传图片失败！');
			}
			});
			});
			});
		</script>
</head>
<body>
<div class="container zhu">
			
			<div class="row">
				<div class="col-lg-2">
					<h1>管理类别</h1>
				</div>
				<div class="col-lg-10">
				</div>
			</div>







</body>
</html>