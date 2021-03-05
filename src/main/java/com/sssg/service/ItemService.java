package com.sssg.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sssg.po.Item;
import com.sssg.po.Shape;
import com.sssg.po.item_category;
import com.sssg.utils.Page;

public interface ItemService {
	 public Page<Item> findItemByCategory(Integer page,Integer rows,String item_categorydetail);

	public int findItemAmountByName(int shape_id);

	public int updateItemAmountByName(String cartItem_name,int currentamount);

	public Page<Item> findAllItem(Integer page, Integer rows);


	public Page<Item> findItemByName(Integer page, Integer rows,String item_name);

	public List<Shape> selectItemDetailByItemId(int item_id1);

	public List<item_category> selectCategoryAndDetail();

	public List selectAllItemName();
}
