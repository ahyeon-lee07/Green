package com.pro.green.common.vo;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("orderSheet")
public class OrderSheet {

	private String imp_uid;
	private String pay_method;
	private String merchant_uid;
	private String name;
	private int amount;
	private String buyer_email;
	private String buyer_name;
	private String buyer_tel;
	private String buyer_addr;
	private String buyer_postcode;
	private String shipMsg;
	private List<Map<String, Object>> optionList;

	public List<Map<String, Object>> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<Map<String, Object>> optionList) {
		this.optionList = optionList;
	}
	public String getShipMsg() {
		return shipMsg;
	}
	public void setShipMsg(String shipMsg) {
		this.shipMsg = shipMsg;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getBuyer_addr() {
		return buyer_addr;
	}
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	public String getBuyer_postcode() {
		return buyer_postcode;
	}
	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}
}
