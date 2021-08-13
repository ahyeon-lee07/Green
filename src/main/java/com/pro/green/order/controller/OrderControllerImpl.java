package com.pro.green.order.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.green.order.service.OrderService;
import com.pro.green.order.vo.OrderVO;
import com.pro.green.member.vo.MemberVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private MemberVO memberVO;
	
	// 구매내역 조회 목록
	@Override
	@RequestMapping(value = "/purchaseList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();

		MemberVO member = new MemberVO();
		MemberVO sessinLogin = (MemberVO) session.getAttribute("member");
		
		String userId = sessinLogin.getId();
		
		List<OrderVO> listOrder = orderService.listOrder(userId);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("listOrder", listOrder);
		return mav;
	}

}
