package com.pro.green.common.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.common.vo.OrderSheet;
import com.pro.green.member.vo.MemberVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller("payments")
public class PaymentsController {

	@Autowired
	private OrderSheet orderSheet;

	private IamportClient api;
	
	public PaymentsController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("3587947840482236","f9804b6fba39003e31390c989c52a9b26e2c7d50f75f37890848d2391b059526372f3c84301e9295");
	}
	
	// 결제정보 받기
	//@RequestMapping(value = "/payments/complete.do", method = RequestMethod.POST)
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			HttpServletRequest request, HttpServletResponse response
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			api.paymentByImpUid(imp_uid);
			return api.paymentByImpUid(imp_uid);
	}
}
