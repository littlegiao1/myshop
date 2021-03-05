package com.sssg.po;

import java.util.Date;
import java.util.List;

public class Cart {

	private int cart_id;
	private User user;
	private List<CartItem> cartitems;
	private int cart_state;
	private double totalprice;
	private Date cart_submittime;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<CartItem> getCartitems() {
		return cartitems;
	}
	public void setCartitems(List<CartItem> cartitems) {
		this.cartitems = cartitems;
	}
	public int getCart_state() {
		return cart_state;
	}
	public void setCart_state(int cart_state) {
		this.cart_state = cart_state;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public Date getCart_submittime() {
		return cart_submittime;
	}
	public void setCart_submittime(Date cart_submittime) {
		this.cart_submittime = cart_submittime;
	}
	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", user=" + user + ", cartitems="
				+ cartitems + ", cart_state=" + cart_state + ", totalprice="
				+ totalprice + ", cart_submittime=" + cart_submittime + "]";
	}

	
}
