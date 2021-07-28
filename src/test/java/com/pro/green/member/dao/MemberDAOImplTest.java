package com.pro.green.member.dao;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro.green.member.vo.MemberVO;

public class MemberDAOImplTest {
	
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SqlSession sqlSession;

	@Test
	public void testSelectOverlappedID() {

		MemberVO member = new MemberVO();
		
		String id = "admin";
		
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		
		assertEquals("admin",  result);
	}

}
