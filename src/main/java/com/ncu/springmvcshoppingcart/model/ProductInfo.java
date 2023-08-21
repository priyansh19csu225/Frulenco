package com.ncu.springmvcshoppingcart.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ncu.springmvcshoppingcart.entity.Product;
 
public class ProductInfo {
    private String code;
    private String name;
    private double price;
    private String location;
    private String category;
 
    private boolean newProduct=false;
 
    // Upload file.
    private CommonsMultipartFile fileData;
 
    public ProductInfo() {
    }
 
    public ProductInfo(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.location = product.getLocation();
        this.category = product.getCategory();
    }
    
    public ProductInfo(String code, String name, double price, String location, String category) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.location = location;
        this.category = category;
    }
 
    public ProductInfo(String code, String name, double price) {
        this.code = code;
        this.name = name;
        this.price = price;
    }
 
    public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCode() {
        return code;
    }
 
    public void setCode(String code) {
        this.code = code;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public double getPrice() {
        return price;
    }
 
    public void setPrice(double price) {
        this.price = price;
    }
 
    public CommonsMultipartFile getFileData() {
        return fileData;
    }
 
    public void setFileData(CommonsMultipartFile fileData) {
        this.fileData = fileData;
    }
 
    public boolean isNewProduct() {
        return newProduct;
    }
 
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
 
}