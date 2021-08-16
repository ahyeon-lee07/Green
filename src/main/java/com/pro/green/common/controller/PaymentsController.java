package com.pro.green.common.controller;

import java.io.Console;
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
import com.pro.green.IamportRestHttpClientJava.request.CancelData;
import com.pro.green.IamportRestHttpClientJava.response.IamportResponse;
import com.pro.green.IamportRestHttpClientJava.response.Payment;
import com.pro.green.Master.service.MasterService;
import com.pro.green.Master.vo.CouponVO;
import com.pro.green.common.vo.Order;
import com.pro.green.common.vo.OrderSheet;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product.service.MypageProductService;
import com.pro.green.product.vo.MemberHasCouponVO;
import com.pro.green.product_M.vo.CartAddVO;
import com.pro.green.product_M.vo.ProductVO2;
import com.siot.IamportRestClient.exception.IamportResponseException;


@Controller("payments")
public class PaymentsController {

	@Autowired
	private OrderSheet orderSheet;
	
	@Autowired
	private Order order;
	
	@Autowired
	private ProductVO2 productVO2;
	
	@Autowired
	private CouponVO couponVO;
	
	@Autowired
	private MypageProductService mypageProductService;
	
	@Autowired
	private MasterService masterService;

	private IamportClient client;
	
	public PaymentsController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.client = new IamportClient("3587947840482236","f9804b6fba39003e31390c989c52a9b26e2c7d50f75f37890848d2391b059526372f3c84301e9295");
	}
	
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
		
		int dbPrice = mypageProductService.dbPrice(orderSheet);
		
		//배송비
		int shipTotal_O = 2500;
		int userMileage = orderSheet.getMileageUse();
		int userCoupon = 0;
		
		if(orderSheet.getUseCouponId() != "") {
			String couponId = orderSheet.getUseCouponId();
			
			//쿠폰 정보 조회
			CouponVO couponInf = masterService.selectCoupon(couponId);
			System.out.println(couponInf.getDiscountType());
			if(couponInf.getDiscountType().equals("normal")) {
				userCoupon = couponInf.getCouponPay();
			}else if (couponInf.getDiscountType().equals("percent")) {
				int couponPay = couponInf.getCouponPay();
				userCoupon = dbPrice * couponPay / 100;
			}
		}
		
		dbPrice = dbPrice + shipTotal_O - userMileage - userCoupon;

		BigDecimal order = paymentByimpuid.getResponse().getAmount();
		BigDecimal amountToBePaid  = new BigDecimal(dbPrice);

		Map<String, Object> result = new HashMap<String, Object>();
	
		if(order.equals(amountToBePaid)) {
			Map<String, Object> insertBox = new HashMap<String, Object>();

			Order orderBox = new Order();
			orderBox.setOrderNum(paymentByimpuid.getResponse().getMerchantUid());
			orderBox.setId(user.getId());
			orderBox.setImpUid(paymentByimpuid.getResponse().getImpUid());
			orderBox.setRecipient(paymentByimpuid.getResponse().getBuyerName());
			orderBox.setOrder_zipCode(paymentByimpuid.getResponse().getBuyerPostcode());
			orderBox.setOrder_addr1(orderSheet.getOrder_addr1());
			orderBox.setOrder_addr2(orderSheet.getOrder_addr2());
			orderBox.setOrder_addr3(orderSheet.getOrder_addr3());
			orderBox.SetSplitPhone(paymentByimpuid.getResponse().getBuyerTel());
			orderBox.SetSplitEmail(paymentByimpuid.getResponse().getBuyerEmail());
			orderBox.setShipMsg(orderSheet.getShipMsg());
			orderBox.setMileageUse(orderSheet.getMileageUse());
			orderBox.setUseCouponId(orderSheet.getUseCouponId());
			orderBox.setPayMethod(paymentByimpuid.getResponse().getPayMethod());
			orderBox.setDuePayment((paymentByimpuid.getResponse().getAmount()).intValue());
			orderBox.setStatus(paymentByimpuid.getResponse().getStatus());
			orderBox.setTotalMileage(orderSheet.getTotalMileage());
			
			insertBox.put("orderBox", orderBox);
			insertBox.put("orderSheet", orderSheet);
			
			//주문서 작성
			int insertOrder = mypageProductService.insertOrder(insertBox);
			
//			CancelData cancel1 = new CancelData(imp_uid, true);
//			IamportResponse<Payment> cancelpayment2 = client.cancelPayment(cancel1);
			
			result.put( "status", "success");
			result.put( "message", "일반 결제 성공");
			result.put("paymentByimpuid", paymentByimpuid);
			resEntity = new ResponseEntity(result, HttpStatus.OK);
		}else {
			//취소 처리
			CancelData cancel1 = new CancelData(imp_uid, true);
			IamportResponse<Payment> cancelpayment2 = client.cancelPayment(cancel1);
			
			result.put( "status", "forgery");
			result.put( "message", "위조된 결제시도");
			resEntity = new ResponseEntity(result, HttpStatus.OK);
		}

		
		return resEntity;
	}
	
	// 구매 내역 상세
	@RequestMapping(value = "/purchaseDetails.do", method = RequestMethod.GET)
	public ModelAndView purchaseDetails(@RequestParam("orderNum") String merchantUid ,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		mav.setViewName("purchaseDetails");
		return mav;
	}
}
