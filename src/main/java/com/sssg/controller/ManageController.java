package com.sssg.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sssg.po.Cart;
import com.sssg.po.Item;
import com.sssg.po.Order;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.po.item_category_detail;
import com.sssg.service.ManageService;
import com.sssg.utils.Page;

@Controller
public class ManageController {

	@Autowired
	private ManageService manageService;
	
	@RequestMapping("MerchantFindAllItem.action")
	public String MerchantFindAllItem(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="7") Integer rows,Model model) {
		Page<Item> items = manageService.MerchantFindAllItem(page,rows);
		model.addAttribute("page", items);
		List<item_category> categoryList =  manageService.selectItemCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("all", 1);
		return "itemManage";
	}
	
	@RequestMapping(value="findItemByCondition.action",method=RequestMethod.GET)
	public String findItemByCondition(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="7") Integer rows,Item item,String item_category,Model model) {
		System.out.println("进入条件查询方法");
		System.out.println("输入的信息为:"+item);
		Page<Item> items = manageService.findItemByCondition(page,rows,item,item_category);
		model.addAttribute("page", items);
		List<item_category> categoryList =  manageService.selectItemCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("item", item);
		System.out.println(items.getSize());
		System.out.println(items.getTotal());
		System.out.println(items.getRows());
		
		
		return "itemManage";
	}
	
	
	
	@RequestMapping("updateItem.action")
	@ResponseBody
	public String updateItem(Shape shape){
		int result = manageService.updateItem(shape);
		if(result>0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping("deleteItem.action")
	@ResponseBody
	public String deleteItem(int shape_id) {
		int result = manageService.deleteItem(shape_id);
		System.out.println("删除商品id"+shape_id);
		if(result>0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	
	@RequestMapping("recoverItem.action")
	@ResponseBody
	public String recoverItem(int shape_id) {
		int result = manageService.recoverItem(shape_id);
		System.out.println("上架商品id"+shape_id);
		if(result>0){
			return "OK";
		}else{
			return "FAIL";
		}
	}

@RequestMapping("/toitemManage.action")
public String toitemManage(){
	return "itemManage";
	
}

@RequestMapping(value="changeCategoryDetail.action",method=RequestMethod.POST)
@ResponseBody
public List<item_category_detail> changeCategoryDetail(String item_category){
	System.out.println(item_category);
List<item_category_detail> categoryDetailList =  manageService.selectCategoryDetailByItemCategory(item_category);
return categoryDetailList;

	
}

@RequestMapping("/toaddItem.action")
public String toaddItem(Model model){
	List<item_category> categoryList =  manageService.selectItemCategory();
	model.addAttribute("categoryList", categoryList);
	return "addItem";
	
}

	
	
	
	
	@RequestMapping("Upload.action")
	@ResponseBody
	public String Upload(HttpServletRequest request) throws Exception{
		 String savePath = request.getServletContext().getRealPath("/image");
			DiskFileItemFactory factory = new DiskFileItemFactory();
		   ServletFileUpload upload = new ServletFileUpload(factory);
		  
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			FileItem item = items.get(0);
			String fileName = item.getName();
			String prefix = fileName.substring(fileName.lastIndexOf("."));
			fileName = new Date().getTime()+prefix;
			item.write(new File(savePath+"/"+fileName));
			return fileName;
			
		
	}
	
	
	
	@RequestMapping(value="merchantAddItem.action",method=RequestMethod.POST)
	@ResponseBody
	public String merchantAddItem(Item item) {
		System.out.println("kuolieyagatong");
		System.out.println(item);
		int result = manageService.merchantAddItem(item); 
		if(result>0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	
	@RequestMapping("toItemManage.action")
	public String toItemManage() {
		System.out.println("smsgui");
		return "itemManage";
	}
	
	@RequestMapping("toItemCategory.action")
	public String toItemCategory() {
		return "item_category";
	}
	
	
	
	@RequestMapping("toOrders.action")
	public String toOrders(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="5") Integer rows,Model model) {
		Page<Order> orders = manageService.merchantFindAllOrders(page,rows);
		System.out.println("商家查询订单"+orders);
		//for(int i=0;i<orders.size();i++){
			//System.out.println(orders.get(i));
		//}
		//System.out.println("订单数量"+orders.size());
		model.addAttribute("page",orders);
		return "orders";
	}
	

}
