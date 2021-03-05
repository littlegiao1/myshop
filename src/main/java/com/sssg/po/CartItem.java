package com.sssg.po;

public class CartItem {
private int cartitem_id;
private Shape shape;
 private int cartitem_amount;
private double sum;;
 private int cartitem_state;
 private Cart cart;
 private int cart_id;
 public Cart getCart() {
	return cart;
}
public void setCart(Cart cart) {
	this.cart = cart;
}

public int getCartitem_id() {
	return cartitem_id;
}
public void setCartitem_id(int cartitem_id) {
	this.cartitem_id = cartitem_id;
}


public Shape getShape() {
	return shape;
}
public void setShape(Shape shape) {
	this.shape = shape;
}
public int getCartitem_amount() {
	return cartitem_amount;
}
public void setCartitem_amount(int cartitem_amount) {
	this.cartitem_amount = cartitem_amount;
}
public double getSum() {
	return sum;
}
public void setSum(double sum) {
	this.sum = sum;
}
public int getCartitem_state() {
	return cartitem_state;
}
public void setCartitem_state(int cartitem_state) {
	this.cartitem_state = cartitem_state;
}
public int getCart_id() {
	return cart_id;
}
public void setCart_id(int cart_id) {
	this.cart_id = cart_id;
}
@Override
public String toString() {
	return "CartItem [cartitem_id=" + cartitem_id + ", shape=" + shape
			+ ", cartitem_amount=" + cartitem_amount + ", sum=" + sum
			+ ", cartitem_state=" + cartitem_state + ", cart=" + cart
			+ ", cart_id=" + cart_id + "]";
}

}
