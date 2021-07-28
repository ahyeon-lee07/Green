package com.pro.green.product.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {

	private int cartNum;
	private String id;
	private String productId;
	private String S_option;
	private String S_stock;
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
		return S_option;
	}
	public void setS_option(String s_option) {
		S_option = s_option;
	}
	public String getS_stock() {
		return S_stock;
	}
	public void setS_stock(String s_stock) {
		S_stock = s_stock;
	}
	public String getCartType() {
		return cartType;
	}
	public void setCartType(String cartType) {
		this.cartType = cartType;
	}
	
}
