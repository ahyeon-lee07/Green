package com.pro.green.Master.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.Master.dao.MasterDAO;
import com.pro.green.Master.vo.CouponVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

public interface MasterService {

	public List<Map<String, Object>> selectCouponList(Criteria cri) throws DataAccessException;

	// 쿠폰등록
	public int couponAdd(CouponVO coupon) throws DataAccessException;

	// 리스트 개수
	public int listCount() throws DataAccessException;

	// 쿠폰 사용여부 변경
	public int useYNChk(Map<String, Object> paramMap) throws DataAccessException;

	// 쿠폰 검색
	public List<Map<String, Object>> searchCouponList(Map<String, Object> searchOption) throws DataAccessException;

	// 쿠폰정보 조회
	public CouponVO selectCoupon(String productId) throws DataAccessException;

	// 회원 리스트
	public List<Map<String, Object>> memberList() throws DataAccessException;

	// 쿠폰 보유 리스트 조회
	public List<Map<String, Object>> hasCouponList(String couponId) throws DataAccessException;

	// 회원 등급별로 정렬
	public List<Map<String, Object>> orderByGrade(Map<String, Object> map) throws DataAccessException;

	// 쿠폰 내용 수정
	public int couponUpdate(CouponVO coupon) throws DataAccessException;

	// member_has_coupon 테이블 등록
	public int hasCouponAdd(Map<String, Object> paramMap) throws DataAccessException;

	// member_has_coupon 테이블 삭제
	public int hasCouponDelete(Map<String, Object> paramMap) throws DataAccessException;


}
