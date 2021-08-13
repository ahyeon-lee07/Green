package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import com.pro.green.order.vo.OrderVO;

public interface OrderService {
	
	// 구매내역 조회
	public List<OrderVO> listOrder(String userId) throws Exception; // 구매내역 목록

}
