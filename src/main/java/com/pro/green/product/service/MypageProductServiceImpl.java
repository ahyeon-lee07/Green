package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.product.dao.MypageProductDAO;
import com.pro.green.product.vo.CartVO;

@Service("mypageProductService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageProductServiceImpl implements MypageProductService {

	@Autowired
	private MypageProductDAO mypageProductDAO;

	// 관심상품 리스트
	@Override
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException {
		return mypageProductDAO.wishList(selectOption);
	}

	// 관심상품 삭제
	@Override
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException {
		return mypageProductDAO.wishDelete(selectOption);
	}

	// 관심테이블에 등록 여부
	public int wishYN(Map<String, Object> addOption) throws DataAccessException {
		return mypageProductDAO.wishYN(addOption);
	}

	// 장바구니 등록
	public int cartAdd(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.cartAdd(option);
	}

	// 장바구니 리스트 조회
	public List<Map<String, Object>> cartList(String id) throws DataAccessException {
		return mypageProductDAO.cartList(id);
	}

	// 장바구니 삭제
	public int cartDelete(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.cartDelete(option);
	}

	// 장바구니 수량 변경
	public int stockChange(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.stockChange(option);
	}
}
