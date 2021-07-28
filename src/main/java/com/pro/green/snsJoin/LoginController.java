package com.pro.green.snsJoin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.pro.green.member.service.MemberService;
import com.pro.green.member.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/snsJoin/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		// 2. String형식인 apiResult를 json형태로 바꿈parser
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		
		String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String mobile = (String) response_obj.get("mobile");
		String name = (String) response_obj.get("name");
		String birthday = (String) response_obj.get("birthday");
		String birthyear = (String) response_obj.get("birthyear");
		
		String[] emailList = email.split("@");
		String[] mobileList = mobile.split("-");
		String[] birthdayList = birthday.split("-");
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(name);
		member.setEmail1(emailList[0]);
		member.setEmail2(emailList[1]);
		member.setPhone(mobileList[0]+mobileList[1]+mobileList[2]);
		member.setBirth(birthyear+birthdayList[0]+birthdayList[1]);
		
		//아이디 체크
		String result = memberService.overlapped(id);
		
		if(result.equals("true")) {
			//등록된 회원
			member.setPw("SNSJoin");
			memberVO = memberService.login(member); 
			if (memberVO != null) {
				HttpSession SnsSession = request.getSession();
				SnsSession.setAttribute("member", memberVO); 
				SnsSession.setAttribute("isLogOn", true); 
				return "main";
			} else {
				model.addAttribute("result", "loginFailed");
				return "main";
			}
		}else {
			//신규 접속 회원
			model.addAttribute("memberInf", response_obj);
			return "normalJoin";
		}
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

}
