package com.pro.green.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.pro.green.IamportRestHttpClientJava.IamportClient;
import com.pro.green.IamportRestHttpClientJava.response.IamportResponse;
import com.pro.green.IamportRestHttpClientJava.response.Payment;
import com.pro.green.Master.service.MasterService;
import com.pro.green.Master.vo.CouponVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.order.service.OrderService;
import com.pro.green.order.vo.OrderVO;
import com.pro.green.product.service.MypageProductService;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderVO orderVO;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MypageProductService mypageProductService;
	
	@Autowired
	private MasterService masterService;
	
	private IamportClient client;
	
	public OrderControllerImpl() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다. 
		this.client = new IamportClient("3587947840482236","f9804b6fba39003e31390c989c52a9b26e2c7d50f75f37890848d2391b059526372f3c84301e9295");
	}

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
		
		
		//주문서 조회
		OrderVO order = orderService.selectOrder(orderNum);
		
		//주문서 옵션 리스트 조회
		List<Map<String, Object>> optionList = new ArrayList<Map<String,Object>>();
		optionList = orderService.optionList(orderNum);
		
		 
		String token = client.getToken();
		IamportResponse<Payment> paymentByMerchantUid = client.paymentByMerchantUid(orderNum);
		
		int dbPrice = mypageProductService.dbPrice(optionList);
		
		//배송비
		int shipTotal_O = 2500;
		int userMileage = order.getMileageUse();
		int userCoupon = 0;
		int discount = 0;
				
		if(!order.getUseCouponId().equals("")) {
			String couponId = order.getUseCouponId();
			
			//쿠폰 정보 조회
			CouponVO couponInf = masterService.selectCoupon(couponId);
			
			if(couponInf.getDiscountType().equals("normal")) {
				userCoupon = couponInf.getCouponPay();
			}else if (couponInf.getDiscountType().equals("percent")) {
				int couponPay = couponInf.getCouponPay();
				userCoupon = dbPrice * couponPay / 100;
			}
		}
		
		discount = userMileage + userCoupon;
		
		
		mav.addObject("order", order);
		
		mav.addObject("optionList", optionList);
		mav.addObject("cardName", paymentByMerchantUid.getResponse().getCardName());
		mav.addObject("cardNumber", paymentByMerchantUid.getResponse().getCardNumber());
		
		mav.addObject("dbPrice", dbPrice);
		mav.addObject("shipTotal_O", shipTotal_O);
		mav.addObject("discount", discount);
		mav.setViewName("purchaseDetails");
		
		return mav;

	}
	
}
