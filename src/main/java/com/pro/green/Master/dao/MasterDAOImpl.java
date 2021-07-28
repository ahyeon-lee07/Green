package com.pro.green.Master.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.Master.vo.CouponVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

@Repository("masterDAO")
public class MasterDAOImpl implements MasterDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, Object>> selectCouponList(Criteria cri) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.master.selectCouponList", cri);
		return result;
	}

	// 쿠폰등록
	public int couponAdd(CouponVO coupon) throws DataAccessException {
		int result = sqlSession.insert("mapper.master.couponAdd", coupon);
		return result;
	}

	// 리스트 개수
	public int listCount() throws DataAccessException {
		int result = sqlSession.selectOne("mapper.master.listCount");
		return result;
	}

	// 쿠폰 사용여부 변경
	public int useYNChk(Map<String, Object> paramMap) throws DataAccessException {
		int result = sqlSession.update("mapper.master.useYNChk", paramMap);
		return result;
	}

	// 쿠폰 검색
	public List<Map<String, Object>> searchCouponList(Map<String, Object> searchOption) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.master.searchCouponList", searchOption);
		return result;
	}

	// 쿠폰정보 조회
	public CouponVO selectCoupon(String productId) throws DataAccessException {
		CouponVO result = sqlSession.selectOne("mapper.master.selectCoupon", productId);
		return result;
	}

	// 회원 리스트
	public List<Map<String, Object>> memberList() throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.member.memberList");
		return result;
	}

	// 쿠폰 보유 리스트 조회
	public List<Map<String, Object>> hasCouponList(String couponId) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.master.hasCouponList", couponId);
		return result;
	}

	// 쿠폰 내용 수정
	public int couponUpdate(CouponVO coupon) throws DataAccessException {
		int result = sqlSession.update("mapper.master.couponUpdate", coupon);
		return result;
	}

	// member_has_coupon 테이블 등록
	public int hasCouponAdd(Map<String, Object> paramMap) throws DataAccessException {
		int result = sqlSession.insert("mapper.master.hasCouponAdd", paramMap);
		return result;
	}

	// member_has_coupon 테이블 삭제
	public int hasCouponDelete(Map<String, Object> paramMap) throws DataAccessException {
		int result = sqlSession.delete("mapper.master.hasCouponDelete", paramMap);
		return result;
	}

}
