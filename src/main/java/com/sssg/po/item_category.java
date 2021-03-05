package com.sssg.po;

import java.util.List;

public class item_category {

	private int category_id;
	private String category_name;
	private List<item_category_detail> categoryDetailList;
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public List<item_category_detail> getCategoryDetailList() {
		return categoryDetailList;
	}
	public void setCategoryDetailList(List<item_category_detail> categoryDetailList) {
		this.categoryDetailList = categoryDetailList;
	}
	@Override
	public String toString() {
		return "item_category [category_id=" + category_id + ", category_name="
				+ category_name + ", categoryDetailList=" + categoryDetailList
				+ "]";
	}
	
	
}
