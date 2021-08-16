package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.order.vo.OrderVO;

public interface OrderService {

	// ���ų��� ��ȸ
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException;
	
	// ���ų��� ����ȸ
	public List<OrderVO> selectOrderDetail(String orderNum) throws DataAccessException;

}
