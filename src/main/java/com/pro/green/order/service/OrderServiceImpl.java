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

	// ���ų��� ��ȸ
	@Override
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException {
		List<Map<String, Object>> selectOrder = orderDAO.selectOrderList(id);
		return selectOrder;
	}

	// ���ų��� ����ȸ
	@Override
	public Map<String, Object> selectOrderDetail(String orderNum) throws DataAccessException {
		Map<String, Object> selectOrderDetail = orderDAO.selectOrderDetail(orderNum);
		return selectOrderDetail;
	}

	// �ֹ��� ��ȸ
	public OrderVO selectOrder(String orderNum) throws DataAccessException {
		OrderVO selectOrder = orderDAO.selectOrder(orderNum);
		return selectOrder;
	}

	// �ֹ��� �ɼ� ����Ʈ ��ȸ
	public List<Map<String, Object>> optionList(String orderNum) throws DataAccessException {
		List<Map<String, Object>> optionList = orderDAO.optionList(orderNum);
		return optionList;
	}

	// ���� ���� �ݾ� ����
	public Map<String, Object> useCoupon(String useCouponId) throws DataAccessException {
		Map<String, Object> useCoupon = orderDAO.useCoupon(useCouponId);
		return useCoupon;
	}

}