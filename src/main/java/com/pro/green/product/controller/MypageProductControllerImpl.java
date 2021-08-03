package com.pro.green.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product.service.MypageProductService;
import com.pro.green.product.service.ProductService;
import com.pro.green.product.vo.CartVO;
import com.pro.green.product_M.service.ProductService2;
import com.pro.green.product_M.vo.CartAddVO;
import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.PageMaker;
import com.pro.green.product_M.vo.ProductVO2;

@Controller("mypageProductController")
public class MypageProductControllerImpl implements MypageProductController {

	@Autowired
	private MypageProductService mypageProductService;

	@Autowired
	private CartVO cartVO;

	@Autowired
	private ProductService2 productService;

	// 관심상품 리스트
	@RequestMapping(value = "/wish_list.do", method = RequestMethod.GET)
	public ModelAndView productList(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		String userId = user.getId();

		List<Map<String, Object>> wishList = new ArrayList<Map<String, Object>>();
		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("userId", userId);
		selectOption.put("type", "wish");

		wishList = mypageProductService.wishList(selectOption);

		List optionList = new ArrayList();

		for (int i = 0; i < wishList.size(); i++) {
			String productId = (String) wishList.get(i).get("productId");
			List<Map<String, Object>> option = productService.selectOptionList(productId);
			optionList.add(option);
		}

		mav.addObject("wishCount", wishList.size());
		mav.addObject("wishList", wishList);
		mav.addObject("userId", userId);
		mav.addObject("optionList", optionList);

		mav.setViewName("wishList");
		return mav;
	}

	// 관심상품에서 삭제
	@RequestMapping(value = "/wish_list/delete.do", method = RequestMethod.POST)
	public ResponseEntity wishDelete(@RequestParam(value = "productIdList[]") List<String> productIdList,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		String userId = user.getId();

		List<Map<String, Object>> wishList = new ArrayList<Map<String, Object>>();
		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("userId", userId);
		selectOption.put("type", "wish");

		int result = 0;

		for (int i = 0; i < productIdList.size(); i++) {
			String productId = productIdList.get(i);

			selectOption.put("productId", productId);
			result = mypageProductService.wishDelete(selectOption);
			selectOption.remove("productId");

			if (result == 0) {
				break;
			}
		}
		wishList = mypageProductService.wishList(selectOption);

		List optionList = new ArrayList();

		for (int i = 0; i < wishList.size(); i++) {
			String productId = (String) wishList.get(i).get("productId");
			List<Map<String, Object>> option = productService.selectOptionList(productId);
			optionList.add(option);
		}

		Map<String, Object> list = new HashMap();
		list.put("wishCount", wishList.size());
		list.put("wishList", wishList);
		list.put("optionList", optionList);

		resEntity = new ResponseEntity(list, HttpStatus.OK);
		return resEntity;
	}

	// 관심상품에서 등록
	@RequestMapping(value = "/wish_list/wishAdd.do", method = RequestMethod.POST)
	public ResponseEntity wishAdd(@RequestParam("productId") String productId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		String userId = user.getId();

		Map<String, Object> addOption = new HashMap<String, Object>();
		addOption.put("userId", userId);
		addOption.put("productId", productId);
		addOption.put("type", "wish");

		int result = 0;

		// 관심테이블에 등록 여부
		result = mypageProductService.wishYN(addOption);

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	// 장바구니조회
	@RequestMapping(value = "/cartList.do", method = RequestMethod.GET)
	public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		ModelAndView mav = new ModelAndView();

		PageMaker pageMaker = new PageMaker();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		List<Map<String, Object>> cartList = new ArrayList<Map<String, Object>>();

		if (user != null) {
			cartList = mypageProductService.cartList(user.getId());
		}

		pageMaker.setCri(cri);

		pageMaker.setTotalCount(cartList.size());

		mav.addObject("cartList", cartList);
		mav.addObject("cartCount", cartList.size());
		mav.setViewName("cart");

		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	// 장바구니추가
	@RequestMapping(value = "/prodList/prodDetail/cartAdd.do", method = RequestMethod.POST)
	public ModelAndView cartAdd(@ModelAttribute CartAddVO product, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		Map<String, Object> option = new HashMap<String, Object>();

		int result = 0;

		if (user != null) {

			option.put("userId", user.getId());
			option.put("cartType", "cart");
			option.put("productId", product.getProductId());

			for (int i = 0; i < product.getOption().size(); i++) {
				option.put("option", product.getP_optionId().get(i));
				option.put("stock", product.getStock().get(i));

				result = mypageProductService.cartAdd(option);
			}

		}

		mav.setViewName("redirect:/cartList.do");
		return mav;
	}

	// 장바구니삭제
	@RequestMapping(value = "/cartList/cartDelete.do", method = RequestMethod.GET)
	public ModelAndView cartDelete(@ModelAttribute(value = "optionId") String optionId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		Map<String, Object> option = new HashMap<String, Object>();

		int result = 0;
		
		if (user != null) {
			option.put("userId", user.getId());
			option.put("cartType", "cart");
			option.put("optionId", optionId);
			
			result = mypageProductService.cartDelete(option);
		}


		mav.setViewName("redirect:/cartList.do");
		return mav;
	}

}
