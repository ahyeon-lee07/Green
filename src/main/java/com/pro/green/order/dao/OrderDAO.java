package com.pro.green.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.order.vo.OrderVO;

public interface OrderDAO {
	// 구매내역 조회
	public List<OrderVO> selectAllOrdersList(String userId) throws DataAccessException; // 구매내역 목록

}
