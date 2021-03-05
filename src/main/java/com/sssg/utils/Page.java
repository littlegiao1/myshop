package com.sssg.utils;
import java.util.List;
public class Page<T> {   
	private int total;   //总条数    要利用dao层查询
	private int page;     //当前页面     由前端页面传过来
	private int size;     //每页显示的客户信息数量，使用者自己定义
	private List<T> rows; //分页后的结果集         要利用dao层查询
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}  
}
