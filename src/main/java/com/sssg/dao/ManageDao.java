package com.sssg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.sssg.po.Cart;
import com.sssg.po.Item;
import com.sssg.po.Order;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.po.item_category_detail;

public interface ManageDao {
	public List<Item> MerchantFindAllItem(Item item);

	public int updateItem(Shape shape);

	public int deleteItem(int shape_id);

	public int merchantAddItem(Item item);
	
	public List<Order> findAllOrders(Order order);

	public Integer selectOrderListCount();

	public List<item_category> selectItemCategory();

	public List<item_category_detail> selectCategoryDetailByItemCategory(
			String item_category);

	public int merchantAddItemShape(@Param("shape") Shape shape,@Param("item_name") String item_name);

	public List<Item> findItemByCondition(@Param("item1") Item item1,@Param("item") Item item,@Param("item_category") String item_category);

	public Integer selectItemListCount();

	public int recoverItem(int shape_id);

	public int setItemMinPriceAndSumAmount(@Param("item_id") int item_id,@Param("item_name") String item_name);

	public int selectItemIdByItemName(String item_name);

	public Integer selectItemByConditionListCount(@Param("item1") Item item1,@Param("item") Item item,@Param("item_category") String item_category);


	
}
