package com.pro.green.product.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {

	private int cartNum;
	private String id;
	private String productId;
	private String s_optionId;
	private String s_stock;
	private String cartType;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getS_option() {
		return s_optionId;
	}
	public void setS_option(String s_optionId) {
		s_optionId = s_optionId;
	}
	public String getS_stock() {
		return s_stock;
	}
	public void setS_stock(String s_stock) {
		s_stock = s_stock;
	}
	public String getCartType() {
		return cartType;
	}
	public void setCartType(String cartType) {
		this.cartType = cartType;
	}
	
}
