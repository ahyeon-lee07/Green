package com.pro.green.product.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberHasCouponVO")
public class MemberHasCouponVO {

	private int hasCouponNum;
	private String id;
	private String couponId;
	private String couponYN;
	private Date couponUseDate;
	
	public int getHasCouponNum() {
		return hasCouponNum;
	}
	public void setHasCouponNum(int hasCouponNum) {
		this.hasCouponNum = hasCouponNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponYN() {
		return couponYN;
	}
	public void setCouponYN(String couponYN) {
		this.couponYN = couponYN;
	}
	public Date getCouponUseDate() {
		return couponUseDate;
	}
	public void setCouponUseDate(Date couponUseDate) {
		this.couponUseDate = couponUseDate;
	}
	
	
}
