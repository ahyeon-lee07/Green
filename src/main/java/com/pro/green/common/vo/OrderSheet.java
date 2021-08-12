package com.pro.green.common.vo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("orderSheet")
public class OrderSheet {

	private String impUid;
	private BigDecimal amount;
	private String shipMsg;
	private List<Map<String, Object>> optionList;
	
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
