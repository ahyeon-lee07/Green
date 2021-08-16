package com.pro.green.order.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.product_M.vo.Criteria;

public interface OrderController {

	// 구매내역 조회
	public ModelAndView OrderList(HttpServletRequest request, HttpServletResponse response, Criteria cri) throws Exception;

	// 구매내역 상세조회
	public ModelAndView OrderDetail(@RequestParam("orderNum") String orderNum, HttpServletRequest request, HttpServletResponse response, Criteria cri) throws Exception;

}
