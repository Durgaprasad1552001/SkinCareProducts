package com.Example.models;

public class ActiveProducts {
    private String productName;
    private String productPrice;
    private String productImage;
    private int product_id;
    public ActiveProducts() {}
    
    public ActiveProducts(int pid , String pn , String pp , String pi) {
    	product_id = pid;
    	productName = pn ;
    	productPrice = pp;
    	productImage = pi;	
    }

    // Getters and setters
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }
    public String getProductImage() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	
	}

