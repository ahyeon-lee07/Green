package com.pro.green.product_M.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO2 {

	// 상품 관련
	private String productId;
	private String p_group;
	private String productName;
	private int price;
	private int discount;
	private int productMileage;
	private int salesSum;
	private String discountYN;
	private Date productDate;
	private String showYN;

	// 상품 옵션 관련
	private String p_optionId;
	private String p_option;
	private int p_stock;

	// 이미지 관려
	private String ImageId;
	private String imgType;
	private String imgURL;
	
	private String cartType;
	
	public String getCartType() {
		return cartType;
	}

	public void setCartType(String cartType) {
		this.cartType = cartType;
	}

	private List<ProductVO2> productVOList;
	

	public List<ProductVO2> getProductVOList() {
		return productVOList;
	}

	public void setProductVOList(List<ProductVO2> productVOList) {
		this.productVOList = productVOList;
	}

	public ProductVO2() {

	}
	

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getP_group() {
		return p_group;
	}

	public void setP_group(String p_group) {
		this.p_group = p_group;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getProductMileage() {
		return productMileage;
	}

	public void setProductMileage(int productMileage) {
		this.productMileage = productMileage;
	}

	public int getSalesSum() {
		return salesSum;
	}

	public void setSalesSum(int salesSum) {
		this.salesSum = salesSum;
	}

	public String getDiscountYN() {
		return discountYN;
	}

	public void setDiscountYN(String discountYN) {
		this.discountYN = discountYN;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public String getShowYN() {
		return showYN;
	}

	public void setShowYN(String showYN) {
		this.showYN = showYN;
	}

	public String getProduct_optionId() {
		return p_optionId;
	}

	public void setProduct_optionId(String p_optionId) {
		this.p_optionId = p_optionId;
	}

	public String getOption() {
		return p_option;
	}

	public void setOption(String p_option) {
		this.p_option = p_option;
	}

	public int getStock() {
		return p_stock;
	}

	public void setStock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getImageId() {
		return ImageId;
	}

	public void setImageId(String imageId) {
		ImageId = imageId;
	}

	public String getImgType() {
		return imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	
}
