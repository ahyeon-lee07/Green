package com.pro.green.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.product_M.vo.Criteria;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.order.service.OrderService;
import com.pro.green.order.vo.OrderVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private OrderService orderService;

	// 구매내역 조회
	@Override
	@RequestMapping(value = "/myPage/purchaseList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView OrderList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		List<Map<String, Object>> selectOrderList = new ArrayList<Map<String,Object>>();

		selectOrderList = orderService.selectOrderList(user.getId());

		mav.addObject("stockSum", selectOrderList);
		mav.addObject("selectOrderList", selectOrderList);		
		mav.setViewName("purchaseList");

		return mav;
	}

	// 구매내역 상세조회

	@Override
	@RequestMapping(value = "/myPage/purchaseDetails.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView OrderDetail(@RequestParam("orderNum") String orderNum, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		List<OrderVO> selectOrderDetail = new ArrayList<OrderVO>();
		
		selectOrderDetail = orderService.selectOrderDetail(orderNum);
		
		mav.addObject("selectOrderDetail", selectOrderDetail);		
		mav.setViewName("purchaseDetails");
		
		return mav;

	}
	
}
