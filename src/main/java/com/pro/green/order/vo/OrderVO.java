package com.pro.green.order.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	
	// order
	private String orderNum; // �ֹ���ȣ
	private String id; // ȸ�� ���̵�
	private String impUid; // �����ý���
	private String recipient; // ������
	private String order_zipCode; // �ֹ�_�����ȣ
	private String order_addr1; // �ֹ�_�⺻ �ּ�
	private String order_addr2; // �ֹ�_�� �ּ�
	private String order_addr3; // �ֹ�_���� �ּ�
	private String order_phone; // �ֹ�_��ȭ��ȣ
	private String order_email1; // �ֹ�_�̸��� ����
	private String order_email2; // �ֹ�_�̸��� ����
	private String shipMsg; // ��� �޸�
	private Date orderDate; // �ֹ��� �ۼ���
	private int mileageUse; // ����� ���ϸ���
	private String useCouponId; // ����� ���� ���̵�
	private String payMethod; // �������
	private int duePayment; // ���� �����ݾ�
	private String shipStatus; // ��� ����
	private String orderStatus; // �ֹ�ó�� ����
	private int totalMileage; // ���� ���� ���ϸ���
	
	// order_has_product
	private int num; // ��ȣ
	private String productId; // ��ǰ ���̵�
	private String s_optionId; // ���� �ɼ� ���̵�
	private String s_stock; // ���� ����
	
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
