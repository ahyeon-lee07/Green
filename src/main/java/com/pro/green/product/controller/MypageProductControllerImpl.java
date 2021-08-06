package com.pro.green.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

		List<CartAddVO> nonmemberCart = (List<CartAddVO>) session.getAttribute("nonmemberCart");

		pageMaker.setCri(cri);

		if (user != null) {

			cartList = mypageProductService.cartList(user.getId());

			pageMaker.setTotalCount(cartList.size());

			mav.addObject("cartCount", cartList.size());

		} else if (user == null && nonmemberCart != null) {

			int nonmemberCartSize = 0;

			for (int i = 0; i < nonmemberCart.size(); i++) {
				for (int y = 0; y < nonmemberCart.get(i).getP_optionId().size(); y++) {
					Map<String, Object> cart = new HashMap<String, Object>();

					String optionId = nonmemberCart.get(i).getP_optionId().get(y);

					String p_stock = mypageProductService.selectP_stock(optionId);

					String productId = nonmemberCart.get(i).getProductId();

					cart.put("productId", nonmemberCart.get(i).getProductId());
					cart.put("s_optionId", nonmemberCart.get(i).getP_optionId().get(y));
					cart.put("s_stock", nonmemberCart.get(i).getStock().get(y));
					cart.put("p_option", nonmemberCart.get(i).getOption().get(y));
					cart.put("p_stock", p_stock);
					cart.put("product", mypageProductService.nonmemberCartList(productId));
					cartList.add(y, cart);

					nonmemberCartSize += 1;
				}
			}
			pageMaker.setTotalCount(nonmemberCartSize);
			mav.addObject("cartCount", nonmemberCartSize);
		}

		mav.setViewName("cart");
		mav.addObject("cartList", cartList);
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

		List<CartAddVO> nonmemberCartList = new ArrayList<CartAddVO>();

		List<CartAddVO> nonmemberCart = (List<CartAddVO>) session.getAttribute("nonmemberCart");

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

		} else if (user == null) {

			if (nonmemberCart == null) {
				session.setAttribute("nonmemberCart", nonmemberCartList);
				nonmemberCartList.add(product);
			} else {

				// 받은 상품 정보의 아이디를 가지고 nonmemberCart안에 상품 아이디가 있는지 확인
				// 반은 상품 아이디를 inputProductId 변수 명에 저장
				String inputProductId = product.getProductId();
				List<String> nonmemberCartProductIdList = new ArrayList<String>();

				// nonmemberCart안 내용 만큼 반봅
				for (int i = 0; i < nonmemberCart.size(); i++) {
					nonmemberCartProductIdList.add(nonmemberCart.get(i).getProductId());
				}

				if (nonmemberCartProductIdList.contains(inputProductId)) {
					// nonmemberCart안 내용 만큼 반봅
					for (int i = 0; i < nonmemberCart.size(); i++) {
						// nonmemberCart 안에 상품아이디와 새로 등록한 product 상품아이디가 같다면
						if (nonmemberCart.get(i).getProductId().equals(inputProductId)) {

							// product의 옵션 아이디 만틈 반복
							for (int k = 0; k < product.getP_optionId().size(); k++) {
								// product 옵션 아이디의 k번째 아이디를 optionId로 저장
								String optionId = (String) product.getP_optionId().get(k);

								List<String> nonmemberCartOptionIdList = new ArrayList<String>();

								// nonmemberCart 안 옵션 아이디 만큼 반복한다.
								for (int y = 0; y < nonmemberCart.get(i).getP_optionId().size(); y++) {
									// nonmemberCart i번째 옵션아이디 y번째 옵션 아이디를 cartOptionId 저장
									String cartOptionId = nonmemberCart.get(i).getP_optionId().get(y);

									if (cartOptionId.equals(optionId)) {
										nonmemberCart.get(i).getStock().set(y, product.getStock().get(k));
									}

									nonmemberCartOptionIdList.add(nonmemberCart.get(i).getP_optionId().get(y));
								}

								if (!nonmemberCartOptionIdList.contains(optionId)) {
									nonmemberCart.get(i).getOption().add(product.getOption().get(k));
									nonmemberCart.get(i).getP_optionId().add(product.getP_optionId().get(k));
									nonmemberCart.get(i).getStock().add(product.getStock().get(k));
								}
							}

						}
					}
				} else {
					nonmemberCart.add(product);
				}

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

		List<CartAddVO> nonmemberCart = (List<CartAddVO>) session.getAttribute("nonmemberCart");

		int result = 0;

		if (user != null) {
			option.put("userId", user.getId());
			option.put("cartType", "cart");
			option.put("optionId", optionId);

			result = mypageProductService.cartDelete(option);

		} else if (user == null) {

			for (int i = 0; i < nonmemberCart.size(); i++) {
				for (int y = 0; y < nonmemberCart.get(i).getP_optionId().size(); y++) {

					if (nonmemberCart.get(i).getP_optionId().get(y).equals(optionId)) {
						nonmemberCart.get(i).getOption().remove(y);
						nonmemberCart.get(i).getP_optionId().remove(y);
						nonmemberCart.get(i).getStock().remove(y);
					}
				}

				if (nonmemberCart.get(i).getP_optionId().size() == 0) {
					nonmemberCart.remove(i);
				}
			}

		}

		mav.setViewName("redirect:/cartList.do");
		return mav;
	}

	// 장바구니 수량 변경
	@RequestMapping(value = "/cartList/stockChange.do", method = RequestMethod.POST)
	public ResponseEntity stockChange(@RequestParam(value = "optionId") String optionId,
			@RequestParam(value = "stockCount") String stockCount, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ResponseEntity resEntity = null;

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		List<CartAddVO> nonmemberCart = (List<CartAddVO>) session.getAttribute("nonmemberCart");

		int result = 0;

		Map<String, Object> option = new HashMap<String, Object>();

		if (user != null) {
			option.put("userId", user.getId());
			option.put("stock", stockCount);
			option.put("optionId", optionId);
			result = mypageProductService.stockChange(option);

		} else if (user == null) {
			for (int i = 0; i < nonmemberCart.size(); i++) {
				for (int y = 0; y < nonmemberCart.get(i).getP_optionId().size(); y++) {
					if (nonmemberCart.get(i).getP_optionId().get(y).equals(optionId)) {
						nonmemberCart.get(i).getStock().set(y, Integer.parseInt(stockCount));
					}
				}
			}
		}

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	// 주문하기 @RequestParam("choiceProductList") List<Map<String, Object>> choiceProductList
	@RequestMapping(value = "/product/productOrder.do", method = RequestMethod.POST)
	public ModelAndView productOrder(@RequestParam(value = "productId[]") List<String> productId,
			@RequestParam(value = "s_stock[]") List<String> s_stock,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");


		mav.setViewName("redirect:/orderList.do");
		return mav;
	}

}
