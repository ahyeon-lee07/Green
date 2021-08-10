package com.pro.green.Master.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.Master.service.MasterService;
import com.pro.green.Master.vo.CouponVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.service.ProductService2;
import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.PageMaker;
import com.pro.green.product_M.vo.ProductVO2;

@Controller("masterController")
public class MasterControllerImpl implements MasterController {

	@Autowired
	private MasterService masterService;

	@Autowired
	private CouponVO couponVO;

	// 쿠폰관리
	@Override
	@RequestMapping(value = "/couponList.do", method = RequestMethod.GET)
	public ModelAndView couponList(@ModelAttribute("member") MemberVO memberInf, HttpServletResponse response,
			HttpServletRequest request, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		MemberVO member = new MemberVO();
		MemberVO sessinLogin = (MemberVO) session.getAttribute("member");

		// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
		sessionChk(mav, sessinLogin, "couponList");

		PageMaker pageMaker = new PageMaker();
		int pageTotal = 0;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		pageTotal = masterService.listCount();
		pageMaker.setCri(cri);

		list = masterService.selectCouponList(cri);

		pageMaker.setTotalCount(pageTotal);

		pageMaker.setCri(cri);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("couponList", list);

		return mav;
	}

	// 쿠폰등록 화면
	@RequestMapping(value = "/couponList/add.do", method = RequestMethod.GET)
	public ModelAndView couponAddPage(HttpServletRequest request, Locale locale, Model model) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		MemberVO member = new MemberVO();
		MemberVO sessinLogin = (MemberVO) session.getAttribute("member");

		// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
		sessionChk(mav, sessinLogin, "redirect:/couponAdd.do");

		return mav;
	}

	// 쿠폰등록
	@Override
	@RequestMapping(value = "/couponList/couponAdd.do", method = RequestMethod.POST)
	public ModelAndView couponAdd(@ModelAttribute("coupon") CouponVO coupon, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		int result = 0;
		ModelAndView mav = new ModelAndView();

		result = masterService.couponAdd(coupon);

		if (result == 0) {
			mav.addObject("addMsg", "쿠폰등록에 실패 했습니다. 다시 시도해 주세요.");
		} else {
			mav.addObject("addMsg", "쿠폰이 등록되었습니다.");
		}

		mav.setViewName("redirect:/couponList.do");

		return mav;
	}

	// 관리자 쿠폰 사용 여부 변경
	@RequestMapping(value = "/couponList/useYNChk.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String id = request.getParameter("id");
		String value = request.getParameter("value");

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("value", value);

		int result = masterService.useYNChk(paramMap);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	// 쿠폰리스트 검색 검색
	@RequestMapping(value = "/couponList/search.do", method = RequestMethod.GET)
	public ModelAndView couponListSearch(@RequestParam(value = "searchKeyWordOption") String searchKeyWordOption,
			@RequestParam(value = "keyWord") String keyWord, HttpServletRequest request, Criteria cri)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();

		int pageTotal = 0;

		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pageTotal);

		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("cri", cri);
		searchOption.put("searchKeyWordOption", searchKeyWordOption);
		searchOption.put("keyWord", keyWord);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = masterService.searchCouponList(searchOption);

		mav.addObject("couponList", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("couponList");

		return mav;
	}

	// 쿠폰상세
	@RequestMapping(value = "/couponList/couponDetail.do", method = RequestMethod.GET)
	public ModelAndView couponDetail(@RequestParam("couponId") String couponId, HttpServletRequest request,
			Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		HttpSession session = request.getSession();

		MemberVO sessinLogin = (MemberVO) session.getAttribute("member");

		// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
		sessionChk(mav, sessinLogin, "couponDetail");

		// 쿠폰정보
		CouponVO couponInf = new CouponVO();
		couponInf = masterService.selectCoupon(couponId);

		List<Map<String, Object>> memberList = masterService.memberList();
		List<Map<String, Object>> hasCoupon = masterService.hasCouponList(couponId);

		for (int i = 0; i < hasCoupon.size(); i++) {

			String userId = hasCoupon.get(i).get("id").toString();
			for (int j = 0; j < memberList.size(); j++) {

				String memberId = memberList.get(j).get("id").toString();
				if (userId.equals(memberId)) {
					memberList.get(j).put("hasCoupon", "Y");
				}
			}
		}

		pageMaker.setCri(cri);
		mav.addObject("page", cri.getPage());
		mav.addObject("couponInf", couponInf);
		mav.addObject("memberList", memberList);
		mav.addObject("hasCoupon", hasCoupon);

		return mav;
	}

	// 쿠폰 보유 정보 변경
	@RequestMapping(value = "/couponList/hasCouponYN.do", method = RequestMethod.POST)
	public ResponseEntity hasCouponYN(@RequestParam(value = "couponId") String couponId,
			@RequestParam(value = "value") String value, @RequestParam(value = "userId[]") List<String> userId,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("couponId", couponId);

		int result;

		for (int i = 0; i < userId.size(); i++) {

			paramMap.put("userId", userId.get(i));

			if (value.equals("Y")) {
				result = masterService.hasCouponAdd(paramMap);
			} else {
				result = masterService.hasCouponDelete(paramMap);
			}
		}

		List<Map<String, Object>> memberList = masterService.memberList();
		List<Map<String, Object>> hasCoupon = masterService.hasCouponList(couponId);

		for (int i = 0; i < hasCoupon.size(); i++) {

			String couponid = hasCoupon.get(i).get("id").toString();
			for (int j = 0; j < memberList.size(); j++) {

				String memberid = memberList.get(j).get("id").toString();
				if (couponid.equals(memberid)) {
					memberList.get(j).put("hasCoupon", "Y");
				}
			}
		}

		Map<String, Object> list = new HashMap();
		list.put("memberList", memberList);
		list.put("hasCoupon", hasCoupon);

		resEntity = new ResponseEntity(list, HttpStatus.OK);

		return resEntity;
	}

	// 회원 등급별 정렬
	@RequestMapping(value = "/couponList/orderByGrade.do", method = RequestMethod.POST)
	public ResponseEntity orderByGrade(@RequestParam(value = "couponId") String couponId,
			@RequestParam(value = "grade") String grade, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("couponId", couponId);
		
		ResponseEntity resEntity = null;
		
		Map<String, Object> map = new HashMap<String, Object>();		

		if (grade.equals("new")) {
			map.put("grade", "where grade='new'");
		} else if (grade.equals("general")) {
			map.put("grade", "where grade='general'");
		} else if (grade.equals("vip")) {
			map.put("grade", "where grade='vip'");
		} else if (grade.equals("All")) {
			map.put("grade", "");
		}
		
		List<Map<String, Object>> memberList = masterService.orderByGrade(map);
		List<Map<String, Object>> hasCoupon = masterService.hasCouponList(couponId);

		for (int i = 0; i < hasCoupon.size(); i++) {

			String couponid = hasCoupon.get(i).get("id").toString();
			for (int j = 0; j < memberList.size(); j++) {

				String memberid = memberList.get(j).get("id").toString();
				if (couponid.equals(memberid)) {
					memberList.get(j).put("hasCoupon", "Y");
				}
			}
		}

		Map<String, Object> list = new HashMap();
		list.put("memberList", memberList);
		list.put("hasCoupon", hasCoupon);

		resEntity = new ResponseEntity(list, HttpStatus.OK);
		return resEntity;
	}

	// 쿠폰내용 수정
	@RequestMapping(value = "/couponList/couponUpdate.do", method = RequestMethod.POST)
	public ModelAndView couponUpdate(@RequestParam(value = "couponId") String couponId,
			@ModelAttribute("coupon") CouponVO coupon, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		HttpSession session = request.getSession();

		MemberVO sessinLogin = (MemberVO) session.getAttribute("member");

		// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
		sessionChk(mav, sessinLogin, "redirect:/couponList.do");

		// 수정
		int result = masterService.couponUpdate(coupon);

		return mav;
	}

	// 관리자 세션 체크 (ModelAndView, 세션정보, 접속할 화면 )
	private ModelAndView sessionChk(ModelAndView mav, MemberVO sessinLogin, String view) throws Exception {
		if (sessinLogin != null) {
			String rightChk = (String) sessinLogin.getMasterYN();
			if (rightChk.equals("M")) {
				mav.addObject("member", sessinLogin);
				mav.setViewName(view);
				return mav;
			} else {
				mav.addObject("joinMas", "잘못된 경로로 접속하셨습니다.");
				mav.setViewName("redirect:/main.do");
				return mav;
			}
		} else {
			mav.addObject("joinMas", "잘못된 경로로 접속하셨습니다.");
			mav.setViewName("redirect:/main.do");
			return mav;
		}
	}
}
