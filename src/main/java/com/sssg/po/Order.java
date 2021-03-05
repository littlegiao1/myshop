package com.sssg.po;


import java.util.List;

public class Order {
   private int order_id;
   private User user;
   private String create_time;
   private List<Cart> carts;
   private int start;            // 起始行
 	private int rows;             // 所取行数
public int getOrder_id() {
	return order_id;
}
public void setOrder_id(int order_id) {
	this.order_id = order_id;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}

public String getCreate_time() {
	return create_time;
}
public void setCreate_time(String create_time) {
	this.create_time = create_time;
}
public List<Cart> getCarts() {
	return carts;
}
public void setCarts(List<Cart> carts) {
	this.carts = carts;
}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
}
public int getRows() {
	return rows;
}
public void setRows(int rows) {
	this.rows = rows;
}
@Override
public String toString() {
	return "Order [order_id=" + order_id + ", user=" + user + ", create_time="
			+ create_time + ", carts=" + carts + ", start=" + start + ", rows="
			+ rows + "]";
}


}