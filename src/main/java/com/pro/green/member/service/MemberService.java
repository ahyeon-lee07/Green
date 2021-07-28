package com.pro.green.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

public interface MemberService {
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public String findId(MemberVO member) throws Exception;
	public String findPw(MemberVO member) throws Exception;
	public String memberPwChk(MemberVO member) throws Exception;
	public int memeberDelete(MemberVO member) throws Exception;
	public int editMember(MemberVO member) throws Exception;
	
	public int memberCount() throws Exception;
	public List<Map<String, Object>> selectMemberList(Criteria cri) throws Exception;
	public List<Map<String, Object>> searchMemberList(Map<String, Object> searchOption) throws Exception;
	public MemberVO memberDetail(String productId) throws Exception;
	
	public int editMember_master(MemberVO memberInf) throws Exception;
}
