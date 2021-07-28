package com.pro.green.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;

public interface MemberController {
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findId(@ModelAttribute("member") MemberVO member) throws Exception;
	public ModelAndView findPw(@ModelAttribute("member") MemberVO member) throws Exception;
	public ModelAndView memberPwChk(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request) throws Exception;
	public ModelAndView memberEdit(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberDelete(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberEditOk(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView memberList(@ModelAttribute("member") MemberVO member, HttpServletRequest request, Criteria cri) throws Exception;
}


