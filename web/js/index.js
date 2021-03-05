$(function(){
		$("#add").validate({
         rules:{
        	 item_name:"required",
		      item_category:"required",
		      item_image:"required",
		      item_price:"required",
		      item_amount:"required",
			 	 
		
		   },
		
			
			messages:{
				 item_name:"商品名不能为空",
			      item_category:"商品类别不能为空",
			      item_image:"商品图片需上传",
			      item_price:"商品价格不能为空",
			      item_amount:"商品数量不能为空",
			}
			
			
			
		});
		
});
	
		

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

