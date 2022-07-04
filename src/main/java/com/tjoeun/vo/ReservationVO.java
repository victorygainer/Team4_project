package com.tjoeun.vo;

import java.util.Date;

public class ReservationVO {
	private int resIdx; // 예약번호 
	private int idx; // 콘텐츠번호
	private	String resID; // 예약자ID
	private Date writeDate; // 예약일자
	private int resHit; // 예약횟수	
	private String subject; // 콘텐츠 이름
	private String contentOwner; // 콘텐츠 소유자
	public int getResIdx() {
		return resIdx;
	}
	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getResID() {
		return resID;
	}
	public void setResID(String resID) {
		this.resID = resID;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getResHit() {
		return resHit;
	}
	public void setResHit(int resHit) {
		this.resHit = resHit;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContentOwner() {
		return contentOwner;
	}
	public void setContentOwner(String contentOwner) {
		this.contentOwner = contentOwner;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [resIdx=" + resIdx + ", idx=" + idx + ", resID=" + resID + ", writeDate=" + writeDate
				+ ", resHit=" + resHit + ", subject=" + subject + ", contentOwner=" + contentOwner + ", getResIdx()="
				+ getResIdx() + ", getIdx()=" + getIdx() + ", getResID()=" + getResID() + ", getWriteDate()="
				+ getWriteDate() + ", getResHit()=" + getResHit() + ", getSubject()=" + getSubject()
				+ ", getContentOwner()=" + getContentOwner() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
