package com.pro.green.order.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	
	// order
	private String orderNum; // 주문번호
	private String id; // 회원 아이디
	private String impUid; // 결제시스템
	private String recipient; // 수령인
	private String order_zipCode; // 주문_우편번호
	private String order_addr1; // 주문_기본 주소
	private String order_addr2; // 주문_상세 주소
	private String order_addr3; // 주문_참조 주소
	private String order_phone; // 주문_전화번호
	private String order_email1; // 주문_이메일 계정
	private String order_email2; // 주문_이메일 서버
	private String shipMsg; // 배송 메모
	private Date orderDate; // 주문서 작성일
	private int mileageUse; // 사용한 마일리지
	private String useCouponId; // 사용한 쿠폰 아이디
	private String payMethod; // 결제방법
	private int duePayment; // 결제 예정금액
	private String shipStatus; // 배송 상태
	private String orderStatus; // 주문처리 상태
	private int totalMileage; // 적립 예정 마일리지
	
	// order_has_product
	private int num; // 번호
	private String productId; // 상품 아이디
	private String s_optionId; // 선택 옵션 아이디
	private String s_stock; // 선택 수량
	
	// order
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
	public void setMilageUse(int milageUse) {
		this.mileageUse = milageUse;
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
	
	// order_has_product
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getS_optionId() {
		return s_optionId;
	}
	public void setS_optionId(String s_optionId) {
		this.s_optionId = s_optionId;
	}
	
	public String getS_stock() {
		return s_stock;
	}
	public void setS_stock(String s_stock) {
		this.s_stock = s_stock;
	}

}
