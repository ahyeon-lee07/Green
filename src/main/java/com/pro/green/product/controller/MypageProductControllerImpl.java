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

}
