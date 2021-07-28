package com.pro.green.product_M.vo;

public class Product_optionVO {
	
	private String product_optionId;
	private String productId;
	private String option;
	private int stock;
	
	
	public Product_optionVO() {
		
	}
	
	public String getProduct_optionId() {
		return product_optionId;
	}
	public void setProduct_optionId(String product_optionId) {
		this.product_optionId = product_optionId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
}
