package com.tjoeun.vo;

public class ReservationParam {

	private int startNo;
	private int endNo;
	private String resID;
	private String contentOwner;
	private int idx;
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
	public String getResID() {
		return resID;
	}
	public void setResID(String resID) {
		this.resID = resID;
	}
	public String getContentOwner() {
		return contentOwner;
	}
	public void setContentOwner(String contentOwner) {
		this.contentOwner = contentOwner;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	@Override
	public String toString() {
		return "ReservationParam [startNo=" + startNo + ", endNo=" + endNo + ", resID=" + resID + ", contentOwner="
				+ contentOwner + ", idx=" + idx + "]";
	}
	


}
