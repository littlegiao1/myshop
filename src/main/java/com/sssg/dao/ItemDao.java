package com.sssg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sssg.po.Item;
import com.sssg.po.Shape;
import com.sssg.po.item_category;

public interface ItemDao {
 public List<Item> findItemByCategory(@Param("item") Item item,@Param("item_categorydetail") String item_categorydetail);
 
 public int selectItemListCountByCategory(String item_categorydetail);
 

public int findItemAmountByName(int shape_id);

public int updateItemAmountByName(@Param("cartItem_name") String cartItem_name,@Param("currentamount") int currentamount);

public List<Item> findAllItem(Item item);

public Integer selectItemListCount();

public List<Item> findItemByName(@Param("item") Item item,@Param("item_name") String item_name);

public Integer selectItemNameListCount(String item_name);

public List<Shape> selectItemDetailByItemId(int item_id);

public List<item_category> selectCategoryAndDetail();

public List selectAllItemName();


}
