package com.pro.green.common.controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.IamportRestHttpClientJava.IamportClient;
import com.pro.green.IamportRestHttpClientJava.response.IamportResponse;
import com.pro.green.IamportRestHttpClientJava.response.Payment;
import com.pro.green.common.vo.OrderSheet;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product.vo.MemberHasCouponVO;
import com.pro.green.product_M.vo.CartAddVO;
import com.siot.IamportRestClient.exception.IamportResponseException;


@Controller("payments")
public class PaymentsController {

	@Autowired
	private OrderSheet orderSheet;

	private IamportClient client;
	
	public PaymentsController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.client = new IamportClient("3587947840482236","f9804b6fba39003e31390c989c52a9b26e2c7d50f75f37890848d2391b059526372f3c84301e9295");
	}
	
	// 결제정보 받기
	//@RequestMapping(value = "/payments/complete.do", method = RequestMethod.POST)
	/*
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute OrderSheet orderSheet
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws Exception
	{	
		
			String token = client.getToken();
			System.out.println("token : " + token);
			
			IamportResponse<Payment> paymentByimpuid = client.paymentByImpUid(imp_uid);
			System.out.println(paymentByimpuid.getResponse().getImpUid());
			
			BigDecimal order = paymentByimpuid.getResponse().getAmount();
			BigDecimal amountToBePaid  = orderSheet.getAmount();
			
			System.out.println(paymentByimpuid.getMessage());
			
			
			if(order == amountToBePaid) {
				
			}else {
				
			}
			
			return paymentByimpuid;
	}
	*/
	
	@RequestMapping(value = "/verifyIamport", method = RequestMethod.POST)
	public ResponseEntity productOrder(@ModelAttribute OrderSheet orderSheet, 
			@RequestParam(value= "impUid") String imp_uid,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ResponseEntity resEntity = null;

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		String token = client.getToken();
		
		IamportResponse<Payment> paymentByimpuid = client.paymentByImpUid(imp_uid);
		
		BigDecimal order = paymentByimpuid.getResponse().getAmount();
		BigDecimal amountToBePaid  = orderSheet.getAmount();
				
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(order.equals(amountToBePaid)) {
			result.put( "status", "success");
			result.put( "message", "일반 결제 성공");
			result.put("paymentByimpuid", paymentByimpuid);
			resEntity = new ResponseEntity(result, HttpStatus.OK);
		}else {
			result.put( "status", "forgery");
			result.put( "message", "위조된 결제시도");
			resEntity = new ResponseEntity(result, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return resEntity;
	}
}
