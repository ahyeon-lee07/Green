package com.pro.green.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.product.vo.CartVO;

@Repository("mypageProductDAO")
public class MypageProductDAOImpl implements MypageProductDAO {

	@Autowired
	private SqlSession sqlSession;

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

	// �ֹ����ۼ� ��ȸ selectProduct  =sqlSession.selectList("mapper.mypageProduct.selectProduct", productId);
	public List<Map<String, Object>> productOrderList(String optionId) throws DataAccessException {

		List<Map<String, Object>> result = sqlSession.selectList("mapper.mypageProduct.productOrderList", optionId);
		String productId = (String) result.get(0).get("productId");
		
		result.get(0).put("product", sqlSession.selectList("mapper.mypageProduct.selectProduct", productId));
		return result;
	}

}
