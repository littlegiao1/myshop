package com.sssg.po;

public class Shape {
	private int shape_id;
	private String  item_shape;
	private String shape_image;
	private String shape_amount;
	private String shape_price;
	private String shape_sale;
	private String shape_describle;
	private String categorydetail_name;
	private int shape_state;
	
	public int getShape_id() {
		return shape_id;
	}
	public void setShape_id(int shape_id) {
		this.shape_id = shape_id;
	}
	public String getItem_shape() {
		return item_shape;
	}
	public void setItem_shape(String item_shape) {
		this.item_shape = item_shape;
	}

	public String getShape_image() {
		return shape_image;
	}
	public void setShape_image(String shape_image) {
		this.shape_image = shape_image;
	}
	public String getShape_amount() {
		return shape_amount;
	}
	public void setShape_amount(String shape_amount) {
		this.shape_amount = shape_amount;
	}
	
	public String getShape_price() {
		return shape_price;
	}
	public void setShape_price(String shape_price) {
		this.shape_price = shape_price;
	}
	
	public String getShape_sale() {
		return shape_sale;
	}
	public void setShape_sale(String shape_sale) {
		this.shape_sale = shape_sale;
	}
	public String getShape_describle() {
		return shape_describle;
	}
	public void setShape_describle(String shape_describle) {
		this.shape_describle = shape_describle;
	}
	public int getShape_state() {
		return shape_state;
	}
	public void setShape_state(int shape_state) {
		this.shape_state = shape_state;
	}
	public String getCategorydetail_name() {
		return categorydetail_name;
	}
	public void setCategorydetail_name(String categorydetail_name) {
		this.categorydetail_name = categorydetail_name;
	}
	@Override
	public String toString() {
		return "Shape [shape_id=" + shape_id + ", item_shape=" + item_shape
				+ ", shape_image=" + shape_image + ", shape_amount="
				+ shape_amount + ", shape_price=" + shape_price
				+ ", shape_sale=" + shape_sale + ", shape_describle="
				+ shape_describle + ", shape_state=" + shape_state + "]";
	}


	
	
}
