package com.pro.green.order.service;

import java.util.List;
import java.util.Map;

import com.pro.green.order.vo.OrderVO;

public interface OrderService {
	
	// ���ų��� ��ȸ
	public List<OrderVO> listOrder(String userId) throws Exception; // ���ų��� ���

}
