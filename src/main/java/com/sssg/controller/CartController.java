package com.sssg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sssg.po.Cart;
import com.sssg.po.CartItem;
import com.sssg.service.CartService;
import com.sssg.service.ItemService;


@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemService itemService;
	
//	@RequestMapping("/addItem.action")
//	@ResponseBody
//	public String addItem(int item_id,int cartitem_amount,String item_name,int user_id){
//		System.out.println("商品id："+item_id);
//		System.out.println(cartitem_amount);
//		System.out.println(item_name);
//		
////	    int itemamount = itemService.findItemAmountByName(cartItem.getCartitem_name());
////	    if(cartItem.getCartitem_amount()>itemamount){
////	    	return "WARNING";
////	    }else{
////            int currentamount = itemamount-cartItem.getCartitem_amount();
////	    	itemService.updateItemAmountByName(cartItem.getCartitem_name(),currentamount);
////			CartItem cartItem1 = cartService.findCartItemByName(cartItem.getCartitem_name(),id);
////			System.out.println(cartItem1);
////			if(cartItem1!=null){
////				int amount = cartItem1.getCartitem_amount()+cartItem.getCartitem_amount();
////				int result = cartService.updateCartItem(cartItem,amount,id);
////				if(result>0){
////					return "OK";
////				}else{
////					return "FAIL";
////				}
////				
////				
////			}else{
////			int result1 = cartService.addItem(cartItem,cartItem.getCartitem_amount(),id);
////			if(result1>0){
////				return "OK";
////			}else{
////				return "FAIL";
////			}
////		}
////		
////	    }
//		int amount = itemService.findItemAmountByName(item_name);
//		if(cartitem_amount>amount){
//			return "WARNING";
//		}
//		int result = cartService.addItem(item_id, cartitem_amount,item_name,user_id);
//		if(result>0) {
//			return "OK";
//		}else {
//			return "FAIL";
//		}
//		
//	} 
	
	@RequestMapping("/addItemToCart.action")
	@ResponseBody
	public String addItemToCart(int shape_id,int cartitem_amount,int user_id){
		System.out.println("商品id："+shape_id);
		System.out.println(cartitem_amount);

		int amount = itemService.findItemAmountByName(shape_id);
		if(cartitem_amount>amount){
			return "WARNING";
		}
		int result = cartService.addItem(shape_id, cartitem_amount,user_id);
		if(result>0) {
			return "OK";
		}else {
			return "FAIL";
		}
		
	} 
	
	
	
	
	@RequestMapping("/showCartList.action")
	public String showCartList(int id,Model model){
		System.out.println("ok");
		Cart cart = cartService.findCartById(id);
		System.out.println("CARTCARTCART:"+cart);
		if(cart==null){
			cartService.addCart(id);
		}
		Cart cart1 = cartService.findCartById(id);
		double totalPrice = 0;
		try{
			totalPrice = cartService.findCartTotalPrice(cart1.getCart_id());
		}catch(Exception e){
			model.addAttribute("totalPrice", 0);
		}
		model.addAttribute("totalPrice",totalPrice);
		List<CartItem> cartitems = cartService.findCartItemById(cart1.getCart_id());
		model.addAttribute("cartitems", cartitems);
		return "cart";
	}
	
	
	@RequestMapping("/showCartList1.action")
	@ResponseBody
	public String showCartList1(int user_id){
		System.out.println("we did it");
		Cart cart = cartService.findCartById(user_id);
		if(cart==null){
			cartService.addCart(user_id);
		}
		List<CartItem> cartitems = cartService.findCartItemById(cart.getCart_id());
		System.out.println("购物车的商品:"+cartitems);
		if(!cartitems.isEmpty()){
			return "OK";
		}else{
			return "FAIL";
		}
		
	}
	
	
	
	@RequestMapping(value="/cartSubmit.action",method=RequestMethod.POST)
	@ResponseBody
	public String cartSubmit(int user_id){
		Cart cart = cartService.findCartById(user_id);
		if(cart==null){
			cartService.addCart(user_id);
		}
		Cart cart1 = cartService.findCartById(user_id);
		List<CartItem> cartitems = cartService.findCartItemById(cart1.getCart_id());
		System.out.println("购物车中的商品数量！！！！！！！！！:"+cartitems.size());
		if(cartitems.isEmpty()){
			return "empty";
		}
		System.out.println("success");
		int result = cartService.cartSubmit(user_id,cart1.getCart_id());
		if(result>0) {
			return "OK";
		}else {
			return "FAIL";
		}
	}
	
	
	@RequestMapping("/deleteCartItem.action")
	@ResponseBody
	public String deleteCartItem(int cartitem_id){
		System.out.println("we did it");
		int result = cartService.deleteCartItem(cartitem_id);
		System.out.println("移除商品的结果："+result);
		
			return "OK";
		
		
	}
	
	
	
	
}
