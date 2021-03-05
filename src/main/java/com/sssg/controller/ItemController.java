package com.sssg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;








import com.sssg.po.Item;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.service.ItemService;
import com.sssg.utils.Page;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	@RequestMapping("/findItemByCategory.action")
	public String findItemByCategory(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="15") Integer rows, Model model,String item_categorydetail){
		System.out.println(item_categorydetail);
		Page<Item> items = itemService.findItemByCategory(page,rows,item_categorydetail);
		model.addAttribute("page",items);
		return "item";
	}
	
	@RequestMapping("/findAllItem.action")
	public String findAllItem(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="15") Integer rows,Model model){
		System.out.println(page);
		System.out.println(rows);
		// 分页查询所有商品
				Page<Item> items = itemService.findAllItem(page,rows);
				model.addAttribute("category", 1);
				model.addAttribute("page", items);
		//List<Item> items = itemService.findAllItem();
		//model.addAttribute("items",items);
		return "item";
	}
	
	@RequestMapping("/findItemByName.action")
	public String findItemByName(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="15") Integer rows,String item_name,Model model){
		if(item_name==""){
			return "redirect:/findAllItem.action";
		}
		System.out.println(item_name);
		Page<Item> items = itemService.findItemByName(page,rows,item_name);
		System.out.println(items);
		System.out.println("当前页面"+items.getPage());
		System.out.println("size"+items.getSize());
		System.out.println("total"+items.getTotal());
		System.out.println("class"+items.getClass());
		System.out.println("rows"+items.getRows());
		if(items.getRows().size()==0){
			System.out.println("zhanwuu");
			model.addAttribute("msg","抱歉，本店没有该商品");
			System.out.println("what hell");
			return "redirect:/findAllItem.action";
			//return "forward:index.jsp";
		}
		model.addAttribute("page",items);
		
		return "item";
	}
	

	
	@RequestMapping(value="/selectItemDetailByItemId.action",method=RequestMethod.POST)
	@ResponseBody
	public List<Shape> selectItemDetailByItemId(int item_id){
		//int item_id1 = Integer.parseInt(item_id);
		System.out.println(item_id);
		List<Shape> shapeList = itemService.selectItemDetailByItemId(item_id);
		System.out.println("商品详情"+shapeList);
		return shapeList;
	}
	
	
	@RequestMapping(value="/selectCategoryAndDetail.action",method=RequestMethod.GET)
	@ResponseBody
	public List<item_category> selectCategoryAndDetail(){
		//int item_id1 = Integer.parseInt(item_id);
		List<item_category> item_categoryList = itemService.selectCategoryAndDetail();
		System.out.println("商品类别"+item_categoryList);
		return item_categoryList;
	}
	
	
	@RequestMapping(value="/selectAllItemName.action",method=RequestMethod.GET)
	@ResponseBody
	public List selectCategoryAndDetail1(){
		//int item_id1 = Integer.parseInt(item_id);
		List ItemNameList = itemService.selectAllItemName();
		return ItemNameList;
	}
	
	
	
}





