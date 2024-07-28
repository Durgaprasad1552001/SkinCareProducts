package com.Example.models;

public class CustomerLoginModel {
	private String userId;
	private String passWord;
	public CustomerLoginModel() {}

	public CustomerLoginModel(String uid , String pass ) {
	this.setUserId(uid);
	this.setPassWord(pass);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}