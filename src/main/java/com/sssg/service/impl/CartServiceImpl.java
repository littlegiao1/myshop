package com.sssg.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sssg.dao.CartDao;
import com.sssg.po.Cart;
import com.sssg.po.CartItem;
import com.sssg.service.CartService;

@Service("cartServiceImpl")
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,readOnly=false)
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;
//	public int addItem(CartItem cartItem,int amount,int id) {
//		Cart cart = cartDao.findCartById(id);
//		if(cart==null){
//			cartDao.addCart(id);
//		}
//		System.out.println("购物车id"+id);
//		int result = cartDao.addItem(cartItem,id);
//		cartDao.figureCartItemSum(cartItem,amount,id);
//		System.out.println("结果"+result);
//		return result;
//	}
//	
	
	public int addItem(int shape_id, int cartitem_amount,int user_id) {
		Cart cart = cartDao.findCartById(user_id);//查找是否有购物车
		if(cart==null){
			cartDao.addCart(user_id);  //若无购物车则新建购物车
	}
		int result;
		int amount = 0;
		Cart cart1 = cartDao.findCartById(user_id);//查询新建的购物车
		CartItem cartitem = cartDao.findCartItem(shape_id,cart1.getCart_id());//查询购物车中是否已经有该商品
		System.out.println(shape_id+""+user_id+"!!!!!");
		double shape_price = cartDao.findItemPriceByItemId(shape_id);//根据item_id查询购买的商品的价格
		if(cartitem!=null){
			int currentamount = cartDao.findCartItemAmountById(shape_id,cart1.getCart_id());//查询已经购买的商品的对应的数量
			 amount = cartitem_amount+currentamount;//需要修改的数量的值
			result = cartDao.updateCartItem(amount,shape_id,cart1.getCart_id());//跟新商品数量
			cartDao.updateCartItem(amount, shape_id, cart1.getCart_id());
			System.out.println("需要计算价格："+ cart1.getCart_id()+""+shape_price+""+amount+""+shape_id);
			cartDao.figureCartItemSum(shape_price,amount,shape_id,cart1.getCart_id());//计算购物车项的价格sum
		}else{
			result = cartDao.addItem(shape_id,cartitem_amount, user_id,cart1.getCart_id());//第一次购买的时候添加商品
			cartDao.figureCartItemSum(shape_price,cartitem_amount,shape_id,cart1.getCart_id());//计算购物车项的价格sum
			
		}
		return result;
		
	}
	
//	public CartItem findCartItemByName(String CartItem_name,int id){
//		System.out.println(CartItem_name);
//		CartItem cartItem = cartDao.findCartItemByName(CartItem_name,id);
//		return cartItem;
//	}
//
//	
//	public int updateCartItem(CartItem cartItem, int amount,int id) {
//		int result = cartDao.updateCartItem(cartItem, amount);
//		cartDao.figureCartItemSum(cartItem,amount,id);
//		return result;
//		
//	}

	public List<CartItem> findCartItemById(int cart_id) {
		//Cart cart = cartDao.findCartById(id);
		List<CartItem> cartitems= cartDao.findCartItemById(cart_id);
		return cartitems;
	}

	public int cartSubmit(int user_id,int cart_id) {
		cartDao.updateItemAmount(cart_id);
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		Date date = new Date();
		String now = sdf1.format(date);
		cartDao.addCartToOrder(user_id,cart_id,now);
		double totalPrice = cartDao.findCartTotalPrice(cart_id);
		int result = cartDao.updateCartItemStateByCartId(cart_id,totalPrice);
		
		
		return result;
	}

	public Cart findCartById(int user_id) {
		Cart cart = cartDao.findCartById(user_id);
		return cart;
	}

	public int addCart(int id) {
		int result = cartDao.addCart(id);
		return result;
	}

	public int deleteCartItem(int cartitem_id) {
		int result = cartDao.deleteCartItemById(cartitem_id);
		return 0;
	}

	public double findCartTotalPrice(int cart_id) {
		double totalPrice = cartDao.findCartTotalPrice(cart_id);
		return totalPrice;
	}







	




	

}
