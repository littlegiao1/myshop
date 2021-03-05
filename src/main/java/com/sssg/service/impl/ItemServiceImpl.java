package com.sssg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;







import org.springframework.transaction.annotation.Transactional;

import com.sssg.dao.ItemDao;
import com.sssg.po.Item;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.service.ItemService;
import com.sssg.utils.Page;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao; 
	public Page<Item> findAllItem(Integer page,Integer rows) {
		         Item item = new Item();
		        // 当前页
		         item.setStart((page-1) * rows) ;
				// 每页数
		        item.setRows(rows);
				// 查询商品列表
				List<Item> items = itemDao.findAllItem(item);
				// 查询商品列表总记录数
				Integer count = itemDao.selectItemListCount();
				// 创建Page返回对象
				Page<Item> result = new Page<Item>();
				result.setPage(page);
				result.setRows(items);
				result.setSize(rows);
				result.setTotal(count);
		//List<Item> items = itemDao.findAllItem();
		return result;
	}

	
	public Page<Item> findItemByCategory(Integer page,Integer rows,String item_categorydetail){
		  Item item = new Item();
	        // 当前页
	         item.setStart((page-1) * rows) ;
			// 每页数
	        item.setRows(rows);
			// 查询商品列表
			List<Item> items = itemDao.findItemByCategory(item,item_categorydetail);
			// 查询商品列表总记录数
			Integer count = itemDao.selectItemListCountByCategory(item_categorydetail);
			// 创建Page返回对象
			Page<Item> result = new Page<Item>();
			result.setPage(page);
			result.setRows(items);
			result.setSize(rows);
			result.setTotal(count);
	        return result;
		
	}

	public int findItemAmountByName(int shape_id) {
		int amount = itemDao.findItemAmountByName(shape_id);
		return amount;
	}

	public int updateItemAmountByName(String cartItem_name, int currentamount) {
		int result = itemDao.updateItemAmountByName(cartItem_name, currentamount);
		return result;
	}


	public Page<Item> findItemByName(Integer page,Integer rows,String item_name) {
	      Item item = new Item();
	        // 当前页
	         item.setStart((page-1) * rows) ;
			// 每页数
	        item.setRows(rows);
			// 查询商品列表
	        System.out.println("参数列表"+item+item_name);
			List<Item> items = itemDao.findItemByName(item, item_name);
			// 查询商品列表总记录数
			Integer count = itemDao.selectItemNameListCount(item_name);
			// 创建Page返回对象
			Page<Item> result = new Page<Item>();
			result.setPage(page);
			result.setRows(items);
			result.setSize(rows);
			result.setTotal(count);
			System.out.println("这是第"+item.getStart()+"页");
			System.out.println("共"+item.getRows()+"条数据");
			System.out.println("查到"+items.size()+"条记录");
			System.out.println(result.getTotal());
	return result;
		
	}


	public List<Shape> selectItemDetailByItemId(int item_id) {
		List<Shape> shapeList = itemDao.selectItemDetailByItemId(item_id);
		System.out.println("service"+shapeList);
		return shapeList;
	}


	public List<item_category> selectCategoryAndDetail() {
		List<item_category> item_categoryList = itemDao.selectCategoryAndDetail();
		return item_categoryList;
	}


	public List selectAllItemName() {
		
		return itemDao.selectAllItemName();
	}







	
}
