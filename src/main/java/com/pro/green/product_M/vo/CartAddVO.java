package com.pro.green.product_M.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("cartAddVO")
public class CartAddVO {
	
	private String productName;
	private String productId;
	private int discount;
	private int price;
	private int shipTotal;
	private List<String> p_optionId;
	private List<String> option;
	private List<Integer> stock;
	private int priceTotal;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShipTotal() {
		return shipTotal;
	}
	public void setShipTotal(int shipTotal) {
		this.shipTotal = shipTotal;
	}
	public List<String> getP_optionId() {
		return p_optionId;
	}
	public void setP_optionId(List<String> p_optionId) {
		this.p_optionId = p_optionId;
	}
	public List<String> getOption() {
		return option;
	}
	public void setOption(List<String> option) {
		this.option = option;
	}
	public List<Integer> getStock() {
		return stock;
	}
	public void setStock(List<Integer> stock) {
		this.stock = stock;
	}
	public int getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(int priceTotal) {
		this.priceTotal = priceTotal;
	}
	
}
