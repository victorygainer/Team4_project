package com.tjoeun.vo;

import java.util.Date;

public class ContentVO {
	private int idx;
	private	String userID; 	
	private String password;
	private String subject; // 글제목
	private String content; // 글내용
	private Date writeDate;
	private int hit; // 조회수
	private String ip;
	private boolean contentStatus; // 콘텐츠 상태
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public boolean isContentStatus() {
		return contentStatus;
	}
	public void setContentStatus(boolean contentStatus) {
		this.contentStatus = contentStatus;
	}
	
	@Override
	public String toString() {
		return "ContentVO [idx=" + idx + ", userID=" + userID + ", password=" + password + ", subject=" + subject
				+ ", content=" + content + ", writeDate=" + writeDate + ", hit=" + hit + ", ip=" + ip
				+ ", contentStatus=" + contentStatus + "]";
	}
	
	
	
	
	
	

	
	
}
