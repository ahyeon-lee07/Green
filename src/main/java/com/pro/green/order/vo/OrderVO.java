package com.pro.green.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	
	private String orderNum;
	private String id;
	private String recipient;
	private String order_zipCode;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String order_phone;
	private String order_email1;
	private String order_email2;
	private String shipMsg;
	private Date orderDate;
	private String payId;
	private int milageUse;
	private int total;
	private int shipTotal;
	private int priceTotal;
	private int discountTotal;
	private int duePayment;
	private String shipStatus;
	private String orderStatus;
	private int totalMileage;
	
	
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	
	public String getOrder_zipCode() {
		return order_zipCode;
	}
	public void setOrder_zipCode(String order_zipCode) {
		this.order_zipCode = order_zipCode;
	}
	
	public String getOrder_addr1() {
		return order_addr1;
	}
	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}
	
	public String getOrder_addr2() {
		return order_addr2;
	}
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	
	public String getOrder_addr3() {
		return order_addr3;
	}
	public void setOrder_addr3(String order_addr3) {
		this.order_addr3 = order_addr3;
	}
	
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;	
	}
	
	public String getOrder_email1() {
		return order_email1;
	}
	public void setOrder_email1(String order_email1) {
		this.order_email1 = order_email1;	
	}
	
	public String getOrder_email2() {
		return order_email2;
	}
	public void setOrder_email2(String order_email2) {
		this.order_email2 = order_email2;	
	}
	
	public String getShipMsg() {
		return shipMsg;
	}
	public void setShipMsg(String shipMsg) {
		this.shipMsg = shipMsg;	
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;	
	}
	
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	
	public int getMilageUse() {
		return milageUse;
	}
	public void setMilageUse(int milageUse) {
		this.milageUse = milageUse;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getShipTotal() {
		return shipTotal;
	}
	public void setShipTotal(int shipTotal) {
		this.shipTotal = shipTotal;
	}
	
	public int getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(int priceTotal) {
		this.priceTotal = priceTotal;
	}
	
	public int getDiscountTotal() {
		return discountTotal;
	}
	public void setDiscountTotal(int discountTotal) {
		this.discountTotal = discountTotal;
	}
	
	public int getDuePayment() {
		return duePayment;
	}
	public void setDuePayment(int duePayment) {
		this.duePayment = duePayment;
	}
	
	public String getShipStatus() {
		return shipStatus;
	}
	public void setShipStatus(String shipStatus) {
		this.shipStatus = shipStatus;
	}
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public int getTotalMileage() {
		return totalMileage;
	}
	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}
	
}
