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

	// 관심상품 리스트
	@Override
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException {
		List<Map<String, Object>> wishList = sqlSession.selectList("mapper.mypageProduct.wishList", selectOption);
		return wishList;
	}

	// 관심상품 삭제
	@Override
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException {
		int wishList = sqlSession.delete("mapper.mypageProduct.wishDelete", selectOption);
		return wishList;
	}

	// 관심테이블에 등록 여부
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

	// 장바구니 등록
	public int cartAdd(Map<String, Object> option) throws DataAccessException {
		int result = 0;
		
		int cartCount = sqlSession.selectOne("mapper.mypageProduct.cartAddChk", option);
		
		if( cartCount == 0 ) {
			result = sqlSession.insert("mapper.mypageProduct.cartAdd", option);
		}else {
			result = sqlSession.update("mapper.mypageProduct.cartUpdate", option);
		}
		
		return result;
	}
	
	// 장바구니 리스트 조회
		public List<Map<String, Object>> cartList(String id) throws DataAccessException{
			List<Map<String, Object> result = null;
			return result;
		}
}
