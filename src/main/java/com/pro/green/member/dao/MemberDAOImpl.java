package com.pro.green.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	// 회원 가입
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}

	// 아이디 찾기
	@Override
	public String selectFindId(MemberVO memberVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectFindId", memberVO);
		return result;
	}

	// 비번 찾기
	@Override
	public String selectFindPw(MemberVO memberVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectFindPw", memberVO);
		return result;
	}

	// 회원정수 수정 비번체크
	@Override
	public String selectPwChk(MemberVO memberVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectPwChk", memberVO);
		return result;
	}

	// 로그인
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}
	
	// 회원 탈퇴
	public int memberDelete(MemberVO member) {
		int result = sqlSession.delete("mapper.member.memeberDelete", member);
		return result;
	}
	
	//회원 수정
	public int editMember(MemberVO member) throws DataAccessException {
		int result = sqlSession.update("mapper.member.editMember", member);
		return result;
	}
	
	//회원수 조회
	public int memberCount() throws DataAccessException {
		int result = sqlSession.selectOne("mapper.member.memberCount");
		return result;
	}
	
	//회원리스트 조회
	public List<Map<String, Object>> selectMemberList(Criteria cri) throws DataAccessException{
		List<Map<String, Object>> result = sqlSession.selectList("mapper.member.selectMemberList", cri);
		return result;
	}
	
	//회원 검색
	public List<Map<String, Object>> searchMemberList(Map<String, Object> searchOption) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.member.searchMemberList", searchOption);
		return result;
	}
	
	//회원상세
	public MemberVO memberDetail(String productId) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.memberDetail", productId);
		return vo;
	}
	
	//회원관리 수정
	public int editMember_master(MemberVO memberInf) throws DataAccessException {
		int result = sqlSession.update("mapper.member.editMember_master", memberInf);
		return result;
	}
	
	
	
	
	//배치프로그램 테스트
	public List<MemberVO> selectRetireUsers() throws DataAccessException{
		List<MemberVO> result = sqlSession.selectList("mapper.member.selectRetireUsers");
		return result;
	}
	
	public int addMember(MemberVO member) throws DataAccessException{
		int result = sqlSession.update("mapper.member.addMember", member);
		return result;
	}

}