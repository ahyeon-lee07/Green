package com.pro.green.Master.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class CouponVO {

	private String couponId;
	private String couponName;
	private String couponContent;
	private Integer couponPay;
	private String couponPeroid_start;
	private String couponPeroid_end;
	private Date couponDate;
	private String discountType;
	private String useYN;

	public String getDiscountType() {
		return discountType;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public Date getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(Date couponDate) {
		this.couponDate = couponDate;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponContent() {
		return couponContent;
	}
	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}
	public Integer getCouponPay() {
		return couponPay;
	}
	public void setCouponPay(Integer couponPay) {
		this.couponPay = couponPay;
	}
	public String getCouponPeroid_start() {
		return couponPeroid_start;
	}
	public void setCouponPeroid_start(String couponPeroid_start) {
		this.couponPeroid_start = couponPeroid_start;
	}
	public String getCouponPeroid_end() {
		return couponPeroid_end;
	}
	public void setCouponPeroid_end(String couponPeroid_end) {
		this.couponPeroid_end = couponPeroid_end;
	}
	
}