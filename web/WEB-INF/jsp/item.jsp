<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sssg" uri="http://sssg.com/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<style type="text/css">
		.container{
			width:100%;
				float:left;
				
			}
			.main{
				
				width:100%;
				height:600px;
				float:left;
			}
			.main1{
				
				width: 17.5%;
				height:280px;
				margin:10px;
				float:left;
			}
			
		</style>
		<script type="text/javascript">
		window.onload = function(){
			$('.container .main #maindiv .thumbnail,.btn.btn-xs.btn-success').click(function(e){
				console.log("下面")
				console.log( $(e.target.parentNode).find("#spid").val())
				 $(e.target.parentNode).find("#spid").val()
				var item_id = $(e.target.parentNode).find("#spid").val();
				window.parent.showItemDetail(e,item_id);
			});
			
			}
		
	
		
		
		 function addItem(id,name,user_id){
			 var amount = $("#"+name+"").val();
			 console.log(amount);
			 if(amount>0){
				 $.post("${pageContext.request.contextPath }/addItem.action",{"cartitem_amount":amount,"item_name":name,"item_id":id,"user_id":user_id},function(data){
						if(data =="OK"){
							alert("成功添加商品到购物车");
						}else if(data=="FAIL"){
							alert("添加商品到购物车失败");
						}else if(data=="WARNING"){
							alert("抱歉，库存不足");
						}else{
							alert("请先登录再购买商品");
						}
					});
			 }else{
				 alert("请选择商品数量")
			 }
			
		 }
		
		 

    function min1(amount1){
		 if($("#"+amount1+"").val()>0){
		    $("#"+amount1+"").val(parseInt($("#"+amount1+"").val())-1);
		    console.log($("#"+amount1+"").val());
		   }else{
		    $("#"+amount1+"").val(0);
		    console.log($("#"+amount1+"").val());
		   }
		    		 
    }
		 
	function add(amount){
		 $("#"+amount+"").val(parseInt($("#"+amount+"").val())+1);
		  console.log($("#"+amount+"").val());
	}
		
	

	
	
		</script>
</head>
<body>
<div class="container">
<div class="main">
		<c:forEach items="${page.rows }" var="item">
				<div id="maindiv" class="main1 panel panel-default">
				<center>
					<a href="JavaScript:void(0)" class="thumbnail" style="width:100%">
						<img src="${pageContext.request.contextPath }/${item.item_image }" title="查看商品详细"  alt="" style="height:100px"/>
						<input type="hidden" id="spid" value="${item.item_id }">
					</a>
				
					<div class="caption">
					<input type="hidden" id="spid" value="${item.item_id }">
						<h3 id="name">${item.item_name }</h3>
						<h5 id="price">¥&nbsp;${item.item_price }</h5>
						<p id="amount">
						<c:if test="${item.item_amount>0 }">
						库存：${item.item_amount }
						</c:if>
						<c:if test="${item.item_amount==0 }">
						库存：已售罄
						</c:if>
						</p>
						
							<!-- <input id="${item.item_name }min" type="button" name="" value="-" onclick="min1('${item.item_name }')" />
                            <input id="${item.item_name }" type="text" value="0" style="width:40px;" />
                            <input id="${item.item_name }add" type="button" name=""  value="+" onclick="add('${item.item_name }')" />
                               -->





							<button class="btn btn-xs btn-success" onclick="">查看商品详情</button>
						
					</div>
					</center>
				</div>
		
				</c:forEach>
	</div>
				
		      
		    <c:choose>
                 <c:when test="${category>0 }"> 
                           <div class="text-right" style="margin-top:880px">
						      <sssg:page url="${pageContext.request.contextPath }/findAllItem.action" />
				           </div>                                
                  </c:when>
                   <c:otherwise>
                      <div class="text-right" style="margin-top:880px">
						      <sssg:page url="${pageContext.request.contextPath }/findItemByCategory.action" />
				      </div>     
                   </c:otherwise>
            </c:choose>
</div>	























<script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
</body>
</html>