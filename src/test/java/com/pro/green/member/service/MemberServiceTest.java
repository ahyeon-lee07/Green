package com.pro.green.member.service;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pro.green.member.controller.MemberControllerImpl;
import com.pro.green.member.dao.MemberDAO;
import com.pro.green.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml",
     	"file:src/main/webapp/WEB-INF/spring/action-mybatis.xml",
     	"file:src/main/webapp/WEB-INF/spring/spring-security.xml"
		})
@WebAppConfiguration

public class MemberServiceTest {

	@Autowired
	MemberVO memberVO;

	@Autowired
	MemberDAO memberDAO;
	
	@Mock
	MemberServiceImpl memberServiceImpl;
	
    @InjectMocks
    private MemberControllerImpl memberControllerImpl;


    private MockMvc mockMvc;
    
    @BeforeClass
	public String setUp() throws Exception {
		MemberVO memver = new MemberVO();
		memver.setId("admin");
		
		String id = memver.getId();
		String chan = memberDAO.selectOverlappedID(id);
		
		return chan;
	}
    
    @Before
	public void beforeClass() {
		System.out.println("-----테스트 시작-----");
	}
	
	@After
	public void afterClass() {
		System.out.println("-----테스트 종료-----");
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testOverlapped() throws Exception {;
		

		assertNotNull(setUp());
	}

}
