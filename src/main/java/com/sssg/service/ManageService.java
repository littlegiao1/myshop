package com.sssg.service;

import java.util.List;

import com.sssg.po.Cart;
import com.sssg.po.Item;
import com.sssg.po.Order;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.po.item_category_detail;
import com.sssg.utils.Page;

public interface ManageService {
	public Page<Item> MerchantFindAllItem(Integer page, Integer rows);

	public int updateItem(Shape shape);

	public int deleteItem(int shape_id);

	public int merchantAddItem(Item item);
	
	public Page<Order> merchantFindAllOrders(Integer page, Integer rows);

	public List<item_category> selectItemCategory();

	public List<item_category_detail> selectCategoryDetailByItemCategory(
			String item_category);

	public Page<Item> findItemByCondition(Integer page, Integer rows,
			Item item, String item_category);

	public int recoverItem(int shape_id);

}
