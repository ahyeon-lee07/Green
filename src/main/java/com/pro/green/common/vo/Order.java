package com.pro.green.common.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.w3c.dom.Text;

@Component("order")
public class Order {
	
	private String orderNum;
	private String id;
	private String impUid;
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
	private int mileageUse;
	private String useCouponId;
	private String payMethod;
	private int duePayment;
	private String shipStatus;
	private String status;
	private int totalMileage;
	
	public void SetSplitPhone(String phone) {
		String[] phoneList = phone.split("-");
		this.order_phone = phoneList[0]+phoneList[1]+phoneList[2];
	}
	
	public void SetSplitEmail(String email) {
		String[] emailList = email.split("@");
		this.order_email1 = emailList[0];
		this.order_email2 = emailList[1];
		
	}
	
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
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
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
	public int getMileageUse() {
		return mileageUse;
	}
	public void setMileageUse(int mileageUse) {
		this.mileageUse = mileageUse;
	}
	public String getUseCouponId() {
		return useCouponId;
	}
	public void setUseCouponId(String useCouponId) {
		this.useCouponId = useCouponId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotalMileage() {
		return totalMileage;
	}
	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}
	
	
}
