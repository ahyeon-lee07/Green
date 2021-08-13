package com.pro.green.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.order.dao.OrderDAO;
import com.pro.green.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDAO orderDAO;
	
	// 구매내역 조회 목록
	public List<OrderVO> listOrder(String userId) throws Exception {
		List<OrderVO> listOrder = orderDAO.selectAllOrdersList(userId);
		return listOrder;
	}
		
}
