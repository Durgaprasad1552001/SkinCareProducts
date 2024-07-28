package com.Example.models;

public class CustomerModel {
	private String fullName;
	private String userId;
	private String gmail;
	private String phoneno ;
	private String passWord;

	public CustomerModel() {}
	public CustomerModel (String fn, String ui , String gm, String pn ,String pw) {
		this.fullName = fn ;
		this.userId = ui;
		this.gmail = gm;
		this.phoneno = pn ;
		this.passWord = pw;	
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	}	
	