package com.pro.green.common.vo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.w3c.dom.Text;

@Component("orderSheet")
public class OrderSheet {

	private String impUid;
	private String merchant_uid;
	private BigDecimal amount;
	private String shipMsg;
	private List<Map<String, Object>> optionList;
	private int mileageUse;
	private String useCouponId;
	private int totalMileage;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
	public int getTotalMileage() {
		return totalMileage;
	}
	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getShipMsg() {
		return shipMsg;
	}
	public void setShipMsg(String shipMsg) {
		this.shipMsg = shipMsg;
	}
	public List<Map<String, Object>> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<Map<String, Object>> optionList) {
		this.optionList = optionList;
	}
	
}
