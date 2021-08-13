package com.pro.green.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 구매내역 조회 목록
	@Override
	public List<OrderVO> selectAllOrdersList(String userId) throws DataAccessException {
		List<OrderVO> listOrder = sqlSession.selectList("mapper.order.selectAllOrdersList", userId);
		return listOrder;
	}

}
