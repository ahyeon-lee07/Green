package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.product.vo.CartVO;

public interface MypageProductService {

	//관심상품 리스트
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException;

	//관심상품 삭제
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException;

	//관심테이블에 등록 여부
	public int wishYN(Map<String, Object> addOption) throws DataAccessException;

	//장바구니 등록
	public int cartAdd(Map<String, Object> option) throws DataAccessException;

	//장바구니 리스트 조회
	public List<Map<String, Object>> cartList(String id) throws DataAccessException;

	//장바구니 삭제
	public int cartDelete(Map<String, Object> option) throws DataAccessException;

	//장바구니 수량 변경
	public int stockChange(Map<String, Object> option) throws DataAccessException;

	//비회원 장바구니 조회
	public Map<String, Object> nonmemberCartList(String productId) throws DataAccessException;


}
