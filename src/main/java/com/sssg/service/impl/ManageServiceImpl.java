package com.sssg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sssg.dao.ItemDao;
import com.sssg.dao.ManageDao;
import com.sssg.po.Cart;
import com.sssg.po.Item;
import com.sssg.po.Order;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.po.item_category_detail;
import com.sssg.service.ManageService;
import com.sssg.utils.Page;
@Service("manageServiceImpl")
public class ManageServiceImpl implements ManageService {

	@Autowired
	private ManageDao manageDao;
	@Autowired
	private ItemDao itemDao;
	
	public Page<Item> MerchantFindAllItem(Integer page, Integer rows) {
	    Item item = new Item();
        // 当前页
         item.setStart((page-1) * rows) ;
		// 每页数
        item.setRows(rows);
		// 查询商品列表
		List<Item> items = manageDao.MerchantFindAllItem(item);
		System.out.println("商家查询所有商品"+items);
		// 查询商品列表总记录数
		Integer count = manageDao.selectItemListCount();
		// 创建Page返回对象
		Page<Item> result = new Page<Item>();
		result.setPage(page);
		result.setRows(items);
		result.setSize(rows);
		result.setTotal(count);
        return result;
	
	}
	
	public int updateItem(Shape shape) {
		int result = manageDao.updateItem(shape);
		return result;
	}

	public int deleteItem(int shape_id) {
		int result = manageDao.deleteItem(shape_id);
		return result;
	}

	public int merchantAddItem(Item item) {
		int result = manageDao.merchantAddItem(item);
		for(Shape shape:item.getShapeList()){
			manageDao.merchantAddItemShape(shape,item.getItem_name());
		}
		int item_id = manageDao.selectItemIdByItemName(item.getItem_name());
		manageDao.setItemMinPriceAndSumAmount(item_id,item.getItem_name());
		return result;
	}

	public Page<Order> merchantFindAllOrders(Integer page, Integer rows) {
		
	    Order order= new Order();
        // 当前页
	    order.setStart((page-1) * rows) ;
		// 每页数
	    order.setRows(rows);
		// 查询商品列表
		List<Order> orders = manageDao.findAllOrders(order);
		// 查询商品列表总记录数
		Integer count = manageDao.selectOrderListCount();
		// 创建Page返回对象
		Page<Order> result = new Page<Order>();
		result.setPage(page);
		result.setRows(orders);
		result.setSize(rows);
		result.setTotal(count);
           return result;
		
	}

	public List<item_category> selectItemCategory() {
		List<item_category> categoryList = manageDao.selectItemCategory();
		return categoryList;
	}

	public List<item_category_detail> selectCategoryDetailByItemCategory(
			String item_category) {
		List<item_category_detail> categoryDetailList = manageDao.selectCategoryDetailByItemCategory(item_category);
		return categoryDetailList;
	}

	public Page<Item> findItemByCondition(Integer page, Integer rows,
			Item item, String item_category) {
		 Item item1 = new Item();
	        // 当前页
	         item1.setStart((page-1) * rows) ;
	         System.out.println("当前页面："+page);
			// 每页数
	        item1.setRows(rows);
			// 查询商品列表
			List<Item> items = manageDao.findItemByCondition(item1,item,item_category);
			System.out.println("条件查询到的商品数量为"+items.size());
			
			// 查询商品列表总记录数
			Integer count = manageDao.selectItemByConditionListCount(item1,item,item_category);
			System.out.println("查询出来的总商品数量为+"+count);
			// 创建Page返回对象
			Page<Item> result = new Page<Item>();
			result.setPage(page);
			result.setRows(items);
			result.setSize(rows);
			result.setTotal(count);
	        return result;
	}

	public int recoverItem(int shape_id) {
		int result = manageDao.recoverItem(shape_id);
		return result;
	}



}
