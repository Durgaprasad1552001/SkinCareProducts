package com.Example.models;

public class AdminModel {
	private String adminName;
	private String adminPass;
	 public AdminModel(){}
	 public AdminModel(String an , String ap){
		 this.setAdminName(an);
		 this.setAdminName(ap);
	 }
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
}
