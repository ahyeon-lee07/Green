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

}
