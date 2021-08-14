package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.common.vo.OrderSheet;
import com.pro.green.product.vo.CartVO;
import com.pro.green.product.vo.MemberHasCouponVO;

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
	public List<Map<String, Object>> nonmemberCartList(String productId) throws DataAccessException;

	//비회원 장바구니 추가 시 상품 재고 조회
	public String selectP_stock(String optionId) throws DataAccessException;

	//주문서작성 조회
	public List<Map<String, Object>> productOrderList(String optionId) throws DataAccessException;

	//유저 보유 쿠폰 정보 가져오기
	public List<MemberHasCouponVO> memberHasCoupon(String userId) throws DataAccessException;

	//유저 보유 쿠폰 조회
	public List<Map<String, Object>> hasCouponList(String userId) throws DataAccessException;

	//장바구니 개수 조회
	public int cartCount(String id) throws DataAccessException;

	//디비 기준으로 총 가격 가져오기
	public int dbPrice(OrderSheet orderSheet) throws DataAccessException;

	//주문서 작성
	public int insertOrder(Map<String, Object> insertBox) throws DataAccessException;


}
