package com.sssg.po;

import java.util.List;

public class Item {
  private int item_id;
  private String item_name;
  private String item_category;
  private String item_categorydetail;
  private double item_price;//该商品的最小价格
  private String item_image;
  private String item_amount; 
  private int item_state;
  private List<Shape> shapeList;
  private List<Cart> cartList;
  private int start;            // 起始行
	private int rows;             // 所取行数                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_categorydetail() {
		return item_categorydetail;
	}
	public void setItem_categorydetail(String item_categorydetail) {
		this.item_categorydetail = item_categorydetail;
	}
	public double getItem_price() {
		return item_price;
	}
	public void setItem_price(double item_price) {
		this.item_price = item_price;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getItem_amount() {
		return item_amount;
	}
	public void setItem_amount(String item_amount) {
		this.item_amount = item_amount;
	}

	public int getItem_state() {
		return item_state;
	}
	public void setItem_state(int item_state) {
		this.item_state = item_state;
	}
	public List<Shape> getShapeList() {
		return shapeList;
	}
	public void setShapeList(List<Shape> shapeList) {
		this.shapeList = shapeList;
	}
	public List<Cart> getCartList() {
		return cartList;
	}
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
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
		return "Item [item_id=" + item_id + ", item_name=" + item_name
				+ ", item_category=" + item_category + ", item_categorydetail="
				+ item_categorydetail + ", item_price=" + item_price
				+ ", item_image=" + item_image + ", item_amount=" + item_amount
				+ ", item_state=" + item_state + ", shapeList=" + shapeList
				+ ", cartList=" + cartList + ", start=" + start + ", rows="
				+ rows + "]";
	}


  
}
