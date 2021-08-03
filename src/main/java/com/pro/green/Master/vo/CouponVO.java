package com.pro.green.Master.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class CouponVO {

	private String couponId;
	private String couponName;
	private String couponContent;
	private Integer couponPay;
	private String couponPeriod_start;
	private String couponPeriod_end;
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
	public String getCouponPeriod_start() {
		return couponPeriod_start;
	}
	public void setCouponPeriod_start(String couponPeriod_start) {
		this.couponPeriod_start = couponPeriod_start;
	}
	public String getCouponPeriod_end() {
		return couponPeriod_end;
	}
	public void setCouponPeriod_end(String couponPeriod_end) {
		this.couponPeriod_end = couponPeriod_end;
	}
	
}