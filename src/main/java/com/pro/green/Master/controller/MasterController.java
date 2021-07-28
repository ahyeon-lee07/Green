package com.pro.green.Master.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.Master.vo.CouponVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

public interface MasterController {
	public ModelAndView couponList(@ModelAttribute("member") MemberVO memberInf, HttpServletResponse response, HttpServletRequest request, Criteria cri) throws Exception;
	public ModelAndView couponAdd(@ModelAttribute("coupon") CouponVO coupon, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
