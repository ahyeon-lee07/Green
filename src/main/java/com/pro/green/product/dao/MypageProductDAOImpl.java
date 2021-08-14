package com.pro.green.product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.common.vo.OrderSheet;
import com.pro.green.product.vo.CartVO;
import com.pro.green.product.vo.MemberHasCouponVO;
import com.pro.green.product_M.vo.ProductVO2;

@Repository("mypageProductDAO")
public class MypageProductDAOImpl implements MypageProductDAO {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private OrderSheet orderSheet;

	// ���ɻ�ǰ ����Ʈ
	@Override
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException {
		List<Map<String, Object>> wishList = sqlSession.selectList("mapper.mypageProduct.wishList", selectOption);
		return wishList;
	}

	// ���ɻ�ǰ ����
	@Override
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException {
		int wishList = sqlSession.delete("mapper.mypageProduct.wishDelete", selectOption);
		return wishList;
	}

	// �������̺� ��� ����
	public int wishYN(Map<String, Object> addOption) throws DataAccessException {
		int result = 0;

		int wishchk = sqlSession.selectOne("mapper.mypageProduct.wishchk", addOption);

		if (wishchk == 0) {
			result = sqlSession.insert("mapper.mypageProduct.wishAdd", addOption);
		} else if (wishchk > 0) {
			result = sqlSession.delete("mapper.mypageProduct.wishDelete", addOption);
		}
		return result;
	}

	// ��ٱ��� ���
	public int cartAdd(Map<String, Object> option) throws DataAccessException {
		int result = 0;

		int cartCount = sqlSession.selectOne("mapper.mypageProduct.cartAddChk", option);

		if (cartCount == 0) {
			result = sqlSession.insert("mapper.mypageProduct.cartAdd", option);
		} else {
			result = sqlSession.update("mapper.mypageProduct.cartUpdate", option);
		}

		return result;
	}

	// ��ٱ��� ����Ʈ ��ȸ
	public List<Map<String, Object>> cartList(String id) throws DataAccessException {

		List<Map<String, Object>> result = sqlSession.selectList("mapper.mypageProduct.cartList", id);

		for (int i = 0; i < result.size(); i++) {
			String productId = (String) result.get(i).get("productId");

			result.get(i).put("product", sqlSession.selectList("mapper.mypageProduct.selectProduct", productId));

		}

		return result;
	}

	// ��ȸ�� ��ٱ��� ��ȸ
	public List<Map<String, Object>> nonmemberCartList(String productId) throws DataAccessException {

		List<Map<String, Object>> result = sqlSession.selectList("mapper.mypageProduct.selectProduct", productId);

		return result;
	}

	// ��ٱ��� ����
	public int cartDelete(Map<String, Object> option) throws DataAccessException {
		int result = sqlSession.delete("mapper.mypageProduct.cartDelete", option);
		return result;
	}

	// ��ٱ��� ���� ����
	public int stockChange(Map<String, Object> option) throws DataAccessException {
		int result = sqlSession.update("mapper.mypageProduct.stockChange", option);
		return result;
	}

	// ��ȸ�� ��ٱ��� �߰� �� ��ǰ ��� ��ȸ
	public String selectP_stock(String optionId) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.mypageProduct.selectP_stock", optionId);
		return result;
	}

	// �ֹ����ۼ� ��ȸ selectProduct
	// =sqlSession.selectList("mapper.mypageProduct.selectProduct", productId);
	public List<Map<String, Object>> productOrderList(String optionId) throws DataAccessException {

		List<Map<String, Object>> result = sqlSession.selectList("mapper.mypageProduct.productOrderList", optionId);
		String productId = (String) result.get(0).get("productId");

		result.get(0).put("product", sqlSession.selectList("mapper.mypageProduct.selectProduct", productId));
		return result;
	}

	// ���� ���� ���� ���� ��������
	public List<MemberHasCouponVO> memberHasCoupon(String userId) throws DataAccessException {
		List<MemberHasCouponVO> result = sqlSession.selectList("mapper.mypageProduct.memberHasCoupon", userId);
		return result;
	}

	// ���� ���� ���� ��ȸ
	public List<Map<String, Object>> hasCouponList(String userId) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.mypageProduct.hasCouponList", userId);
		return result;
	}

	// ��ٱ��� ���� ��ȸ
	public int cartCount(String id) throws DataAccessException {
		int result = sqlSession.selectOne("mapper.mypageProduct.cartCount", id);
		return result;
	}

	// ��� �������� �� ���� ��������
	public int dbPrice(OrderSheet orderSheet) throws DataAccessException {
		int result = 0;
		ProductVO2 productList = null;
		
		for (int i = 0; i < orderSheet.getOptionList().size(); i++) {
			String optionId = (String) orderSheet.getOptionList().get(i).get("optionId");
			Object s_stock = orderSheet.getOptionList().get(i).get("s_stock");

			productList = sqlSession.selectOne("mapper.mypageProduct.optionPrice", optionId);

			int optionPrice = 0;
			
			if(productList.getDiscountYN().equals("Y")) {
				optionPrice = productList.getDiscount();
			}else {
				optionPrice = productList.getPrice();
			}
			
			result += (optionPrice * Integer.valueOf((String) s_stock));
		}

		return result;
	}

	// �ֹ��� �ۼ�
	public int insertOrder(Map<String, Object> insertBox) throws DataAccessException {
		int result = 0;

		result = sqlSession.insert("mapper.mypageProduct.insertOrderBox", insertBox.get("orderBox"));

		OrderSheet orderSheet = (OrderSheet) insertBox.get("orderSheet");
		Map<String, Object> option = new HashMap<String, Object>();

		option.put("orderNum", orderSheet.getMerchant_uid());
		for (int i = 0; i < orderSheet.getOptionList().size(); i++) {
			option.put("s_optionId", orderSheet.getOptionList().get(i).get("optionId"));
			option.put("s_stock", orderSheet.getOptionList().get(i).get("s_stock"));

			result = sqlSession.insert("mapper.mypageProduct.insertOrderSheet", option);
		}

		return result;
	}

}
