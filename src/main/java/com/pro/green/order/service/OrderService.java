package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.order.vo.OrderVO;

public interface OrderService {

	// 구매내역 조회
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException;
	
	// 구매내역 상세조회
	public Map<String, Object> selectOrderDetail(String orderNum) throws DataAccessException;

	//주문서 조회
	public OrderVO selectOrder(String orderNum) throws DataAccessException;

	//주문서 옵션 리스트 조회
	public List<Map<String, Object>> optionList(String orderNum) throws DataAccessException;

	//쿠폰 할인 금액 정보
	public Map<String, Object> useCoupon(String useCouponId) throws DataAccessException;


}
