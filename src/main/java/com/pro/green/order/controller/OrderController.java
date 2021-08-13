package com.pro.green.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {
	
	// 구매내역 조회 목록
	public ModelAndView listOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
