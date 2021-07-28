package com.pro.green.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String birth;
	private String phone;
	private String email1;
	private String email2;
	private String zipCode;
	private String addr1;
	private String addr2;
	private String addr3;
	private String grade;
	private Integer mileage;
	private String masterYN;
	private Date joinDate;
	private Integer orderPriceSum;
	private String useYN;
	
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public Integer getOrderPriceSum() {
		return orderPriceSum;
	}
	public void setOrderPriceSum(Integer orderPriceSum) {
		this.orderPriceSum = orderPriceSum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Integer getMileage() {
		return mileage;
	}
	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}
	public String getMasterYN() {
		return masterYN;
	}
	public void setMasterYN(String masterYN) {
		this.masterYN = masterYN;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
