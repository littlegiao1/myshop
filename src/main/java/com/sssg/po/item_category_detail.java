package com.sssg.po;

public class item_category_detail {
	private int categorydetail_id;
	private String categorydetail_name;
	public int getCategorydetail_id() {
		return categorydetail_id;
	}
	public void setCategorydetail_id(int categorydetail_id) {
		this.categorydetail_id = categorydetail_id;
	}
	public String getCategorydetail_name() {
		return categorydetail_name;
	}
	public void setCategorydetail_name(String categorydetail_name) {
		this.categorydetail_name = categorydetail_name;
	}
	@Override
	public String toString() {
		return "item_category_detail [categorydetail_id=" + categorydetail_id
				+ ", categorydetail_name=" + categorydetail_name + "]";
	}
	

}
