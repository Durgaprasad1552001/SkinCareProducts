package com.Example.models;

public class LikedProductModel {
private String productname;
private int productid;
public  LikedProductModel() {}
public LikedProductModel(String s , int k) {
	this.productname = s;
	this.productid = k ;
	
}

public String getProductname() {
	return productname;
}
public void setProductname(String productname) {
	this.productname = productname;
}
public int getProductid() {
	return productid;
}
public void setProductid(int  productid2) {
	this.productid = productid2;
}
}
