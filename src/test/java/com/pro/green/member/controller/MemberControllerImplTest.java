package com.pro.green.member.controller;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.member.service.MemberService;
import com.pro.green.member.vo.MemberVO;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/action-mybatis.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@TestPropertySource(locations = "classpath:jdbc.properties")

public class MemberControllerImplTest {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@Test
	public void 태스트() throws Exception {
		MemberVO member = new MemberVO();

		member.setName("운영자");
		member.setEmail1("admin");
		member.setEmail2("naver.com");

		String id = "admin";

		String result = memberService.overlapped(id);

		assertEquals("admin", result);
	}
	
	@Test
	public void testLogin() throws Exception {

		MemberVO member = new MemberVO();
		member.setPw("123456789qw");
		member.setId("admin");

		MemberVO login = memberService.login(member); // login() 메서드를 호출하면서 로그인 정보를 전달한다.
		
		boolean passMatch = passEncoder.matches(member.getPw(), login.getPw());
		
		assertTrue(passMatch);
	}

}
