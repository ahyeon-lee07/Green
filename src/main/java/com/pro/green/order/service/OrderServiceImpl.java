package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pro.green.order.dao.OrderDAO;
import com.pro.green.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;

	// 구매내역 조회
	@Override
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException {
		List<Map<String, Object>> selectOrder = orderDAO.selectOrderList(id);
		return selectOrder;
	}

	// 구매내역 상세조회
	@Override
	public Map<String, Object> selectOrderDetail(String orderNum) throws DataAccessException {
		Map<String, Object> selectOrderDetail = orderDAO.selectOrderDetail(orderNum);
		return selectOrderDetail;
	}

}