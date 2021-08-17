package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.order.vo.OrderVO;

public interface OrderService {

	// ���ų��� ��ȸ
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException;
	
	// ���ų��� ����ȸ
	public Map<String, Object> selectOrderDetail(String orderNum) throws DataAccessException;

	//�ֹ��� ��ȸ
	public OrderVO selectOrder(String orderNum) throws DataAccessException;

	//�ֹ��� �ɼ� ����Ʈ ��ȸ
	public List<Map<String, Object>> optionList(String orderNum) throws DataAccessException;

	//���� ���� �ݾ� ����
	public Map<String, Object> useCoupon(String useCouponId) throws DataAccessException;


}
