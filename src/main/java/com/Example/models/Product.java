package com.Example.models;

public class Product {
    private String imagePath;
    private String productName;
    private double productPrice;
    
    public Product(String imagePath, String productName, double productPrice) {
        this.imagePath = imagePath;
        this.productName = productName;
        this.productPrice = productPrice;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public double getProductPrice() {
        return productPrice;
    }
}
