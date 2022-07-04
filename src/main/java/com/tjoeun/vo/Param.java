package com.tjoeun.vo;

public class Param {

	private int startNo;
	private int endNo;
	private String category;
	private String item;
	
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	@Override
	public String toString() {
		return "Param [startNo=" + startNo + ", endNo=" + endNo + ", category=" + category + ", item=" + item + "]";
	}
	
}
