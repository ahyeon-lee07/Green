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
import com.pro.green.product_M.vo.ProductVO2;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	// ���ų��� ��ȸ
	@Override
	public List<Map<String, Object>> selectOrderList(String id) throws DataAccessException {
		List<Map<String, Object>> selectOrderList = new ArrayList<Map<String, Object>>();

		List<OrderVO> orderList = sqlSession.selectList("mapper.order.selectOrderList", id);

		for (int i = 0; i < orderList.size(); i++) {
			List<Map<String, Object>> hasProduct = new ArrayList<Map<String, Object>>();

			Map<String, Object> orderInf = new HashMap<String, Object>();

			String orderNum = orderList.get(i).getOrderNum();

			hasProduct = sqlSession.selectList("mapper.order.orderHasProduct", orderNum);

			int totalCnt = 0;
			for (int k = 0; k < hasProduct.size(); k++) {
				totalCnt += (Integer) hasProduct.get(k).get("s_stock");
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

	// ���ų��� ����ȸ
	@Override
	public Map<String, Object> selectOrderDetail(String orderNum) throws DataAccessException {

		Map<String, Object> selectOrderDetail = new HashMap<String, Object>();

		List<OrderVO> orderInfo = sqlSession.selectList("mapper.order.selectOrderInf", orderNum);

		List<Map<String, Object>> prod = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < orderInfo.size(); i++) {
			String optId = (String) orderInfo.get(i).getS_optionId();
			Map<String, Object> prodInf = sqlSession.selectOne("mapper.product.selectProdInf", optId);
			prod.add(prodInf);
		}

		selectOrderDetail.put("orderInfo", orderInfo);
		selectOrderDetail.put("prod", prod);

		return selectOrderDetail;
	}

	// �ֹ��� ��ȸ
	public OrderVO selectOrder(String orderNum) throws DataAccessException {

		OrderVO selectOrder = sqlSession.selectOne("mapper.order.selectOrder", orderNum);
		return selectOrder;
	}

	// �ֹ��� �ɼ� ����Ʈ ��ȸ
	public List<Map<String, Object>> optionList(String orderNum) throws DataAccessException {
		List<Map<String, Object>> optionList = sqlSession.selectList("mapper.order.optionList", orderNum);
		return optionList;
	}

	// ���� ���� �ݾ� ����
	public Map<String, Object> useCoupon(String useCouponId) throws DataAccessException {
		List < Map < String, Object >> useCouponList = sqlSession.selectList("mapper.order.useCoupon", useCouponId);
		Map<String, Object> useCoupon = useCouponList.get(0);
		return useCoupon;
	}

}
