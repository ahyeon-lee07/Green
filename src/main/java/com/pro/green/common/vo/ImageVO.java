package com.pro.green.common.vo;

public class ImageVO {

	private String ImageId;
	private String productId;
	private String imgType;
	private String imgURL;
	
	public String getImageId() {
		return ImageId;
	}
	public void setImageId(String imageId) {
		ImageId = imageId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
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
