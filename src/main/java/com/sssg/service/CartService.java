package com.sssg.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sssg.po.Cart;
import com.sssg.po.CartItem;

public interface CartService {
	//public int addItem(CartItem cartItem,int amount,int id);
	//public CartItem findCartItemByName(String CartItem_name, int id);
	//public int updateCartItem(CartItem cartItem, int amount, int id);
	//public CartItem findCartItemById(int item_id,int cart_id);
	public Cart findCartById(int user_id);
	public int addCart(int id);
	public List<CartItem> findCartItemById(int id);
	public int addItem(int shape_id, int cartitem_amount, int user_id);
	public double findCartTotalPrice(int cart_id);
	//public int figureCartItemSum(@Param("cartItem") CartItem cartitem,@Param("amount") int amount,@Param("cart_id") int id);
	public int cartSubmit(int user_id,int cart_id);
	public int deleteCartItem(int cartitem_id);
}
