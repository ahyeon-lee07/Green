package com.pro.green.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.product.vo.CartVO;

public interface MypageProductDAO {

	// 관심상품 리스트
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException;

	// 관심상품 삭제
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException;

	// 관심테이블에 등록 여부
	public int wishYN(Map<String, Object> addOption) throws DataAccessException;

}
