package com.sssg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sssg.po.Cart;
import com.sssg.po.CartItem;

public interface CartDao{

	
	//public int addItem(@Param("cartItem") CartItem cartItem,@Param("cart_id") int id);
    public int addItem(@Param("shape_id") int shape_id,@Param("cartitem_amount") int cartitem_amount,@Param("user_id") int user_id,@Param("cart_id") int cart_id);
	
	//public CartItem findCartItemById(@Param("item_id") int item_id,@Param("cart_id") int cart_id);

	public int updateCartItem(@Param("cartitem_amount") int cartitem_amount, @Param("shape_id") int shape_id, @Param("cart_id") int cart_id);

	public int addCart(int id);
    
	public Cart findCartById(int user_id);
	public CartItem findCartItem(@Param("shape_id") int shape_id,@Param("cart_id") int cart_id);
	public double findItemPriceByItemId(int shape_id);
	
	public int findCartItemAmountById(@Param("shape_id") int shape_id,@Param("cart_id") int cart_id);

	public List<CartItem> findCartItemById(int cart_id);
	public int figureCartItemSum(@Param("shape_price") double shape_price,@Param("amount") int amount,@Param("shape_id") int shape_id,@Param("cart_id") int cart_id);
    public double findCartTotalPrice(int cart_id);
	public int updateCartItemStateByCartId(@Param("cart_id")int cart_id,@Param("totalPrice") double totalPrice);
	public int addCartToOrder(@Param("user_id") int user_id,@Param("cart_id") int cart_id,@Param("create_time") String now);

	public int updateItemAmount(int cart_id);

	public int deleteCartItemById(int cartitem_id);

}
