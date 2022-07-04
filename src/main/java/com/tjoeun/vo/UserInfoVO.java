package com.tjoeun.vo;

public class UserInfoVO {

	private String userID;
	private String userPassword;
	
	public UserInfoVO() {
		
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	@Override
	public String toString() {
		return "UserInfoVO [userID=" + userID + ", userPassword=" + userPassword + "]";
	}
	
	
	
}