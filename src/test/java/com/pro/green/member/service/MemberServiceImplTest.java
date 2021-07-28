package com.pro.green.member.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro.green.member.dao.MemberDAO;
import com.pro.green.member.vo.MemberVO;

public class MemberServiceImplTest {

	@Autowired
	private MemberVO memberVO;

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void testFindMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setName("¿î¿µÀÚ");
		memberVO.setEmail1("admin");
		memberVO.setEmail2("naver.com");

		memberDAO.selectFindId(memberVO);
		assertNotNull(memberVO);
	}

}
