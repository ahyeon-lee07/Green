package com.pro.green.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

public interface MemberDAO {
	public int insertMember(MemberVO memberVO) throws DataAccessException ;
	public String selectOverlappedID(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVo)throws DataAccessException;
	public String selectFindId(MemberVO memberVO) throws DataAccessException;
	public String selectFindPw(MemberVO memberVO) throws DataAccessException;
	public String selectPwChk(MemberVO memberVO) throws DataAccessException;
	public int memberDelete(MemberVO member);
	public int editMember(MemberVO member) throws DataAccessException;
	
	public int memberCount() throws DataAccessException;
	public List<Map<String, Object>> selectMemberList(Criteria cri) throws DataAccessException;
	public List<Map<String, Object>> searchMemberList(Map<String, Object> searchOption) throws DataAccessException;
	public MemberVO memberDetail(String productId) throws DataAccessException;
	
	public int editMember_master(MemberVO memberInf) throws DataAccessException;
	
	
	public List<MemberVO> selectRetireUsers() throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
}
