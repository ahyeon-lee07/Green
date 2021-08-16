package com.pro.green.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.order.vo.OrderVO;

public interface OrderDAO {

	// ���ų��� ��ȸ
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException;
	
	// ���ų��� ����ȸ
	public List<OrderVO> selectOrderDetail(String orderNum) throws DataAccessException;
}
