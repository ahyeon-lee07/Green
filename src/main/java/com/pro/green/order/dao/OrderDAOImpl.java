package com.pro.green.order.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	// 구매내역 조회
	@Override
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException {
		List<Map<String, Object>> selectOrderList = new ArrayList<Map<String, Object>>();

		List<OrderVO> orderList = sqlSession.selectList("mapper.order.selectOrder", id);


		for (int i = 0; i < orderList.size(); i++) {
			List<Map<String, Object>> hasProduct = new ArrayList<Map<String, Object>>();

			Map<String, Object> orderInf = new HashMap<String, Object>();

			String orderNum = orderList.get(i).getOrderNum();

			hasProduct = sqlSession.selectList("mapper.order.orderHasProduct", orderNum);
			
			int totalCnt = 0;
			for (int k=0; k<hasProduct.size(); k++) {
				totalCnt += (Integer)hasProduct.get(k).get("s_stock");
			}
			String productId = (String) hasProduct.get(0).get("productId");


			orderInf.put("orderHasProduct", hasProduct.get(0));
			orderInf.put("order", orderList.get(i));
			orderInf.put("productCount", hasProduct.size());
			orderInf.put("totalCnt", totalCnt);
			orderInf.put("productImg", sqlSession.selectOne("mapper.order.selectProductImg", productId));
			orderInf.put("p_group", sqlSession.selectOne("mapper.order.selectProductGroup", productId));
			orderInf.put("productName", sqlSession.selectOne("mapper.order.selectProductName", productId));

			selectOrderList.add(i, orderInf);

		}

		return selectOrderList;
	}
	
	// 구매내역 상세조회
	@Override
	public List<OrderVO> selectOrderDetail(String orderNum) throws DataAccessException {
		
		List<OrderVO> selectOrderDetail = sqlSession.selectList("mapper.order.selectOrderDetail", orderNum);
		return selectOrderDetail;
		
	}

}
