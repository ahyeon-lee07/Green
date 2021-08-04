package com.pro.green.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.green.member.vo.MemberVO;
import com.pro.green.product.service.MypageProductService;
import com.pro.green.product.service.ProductService;
import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.PageMaker;
import com.pro.green.product_M.vo.ProductVO2;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO2 productVO;
	@Autowired
	private MypageProductService mypageProductService;

	// 상품 목록
	@Override
	@RequestMapping(value = "/prodList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listProduct(@RequestParam("p_group") String p_group, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		List<Map<String, Object>> wishList = new ArrayList<Map<String, Object>>();
		List<ProductVO2> productsList = productService.listProduct(p_group);

		if (user != null) {
			String userId = user.getId();

			Map<String, Object> selectOption = new HashMap<String, Object>();
			selectOption.put("userId", userId);
			selectOption.put("type", "wish");
			wishList = mypageProductService.wishList(selectOption);

			for (int i = 0; i < productsList.size(); i++) {
				String ProductId = productsList.get(i).getProductId();

				for (int j = 0; j < wishList.size(); j++) {
					String wish = (String) wishList.get(j).get("productId");

					if (ProductId.equals(wish)) {
						productsList.get(i).setCartType("wish");
					}

				}
			}

		} else {
			mav.addObject("wishList", "N");
		}

		if (p_group.equals("hard")) {
			mav.addObject("pageTitle", "하드케이스");
		} else if (p_group.equals("gel")) {
			mav.addObject("pageTitle", "젤케이스");
		} else if (p_group.equals("card")) {
			mav.addObject("pageTitle", "카드케이스");
		} else if (p_group.equals("airPods")) {
			mav.addObject("pageTitle", "에어팟케이스");
		} else if (p_group.equals("buds")) {
			mav.addObject("pageTitle", "버즈케이스");
		} else if (p_group.equals("keyRing")) {
			mav.addObject("pageTitle", "키링");
		} else if (p_group.equals("smart")) {
			mav.addObject("pageTitle", "스마트톡");
		} else {
			mav.addObject("pageTitle", "상품");
		}

		PageMaker pageMaker = new PageMaker();

		// int pageTotal = 0;

		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productsList.size());

		mav.setViewName("prodList");
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("p_group", p_group);

		mav.addObject("productsList", productsList);
		return mav;

	}

	// 상품 정렬
	@RequestMapping(value = "/productList/array.do", method = RequestMethod.POST)
	public ResponseEntity prodArray(@RequestParam(value = "p_group") String p_group,
			@RequestParam(value = "keyWord") String keyWord, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ResponseEntity resEntity = null;

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");

		Map<String, Object> wishMap = new HashMap<String, Object>();

		List<Map<String, Object>> wishList = new ArrayList<Map<String, Object>>();

		Map<String, Object> prodArray = new HashMap<String, Object>();
		prodArray.put("p_group", p_group);

		if (keyWord.equals("popular")) {
			prodArray.put("keyWord", "salesSum DESC");
		} else if (keyWord.equals("newProd")) {
			prodArray.put("keyWord", "productDate DESC");
		} else if (keyWord.equals("lowPrice")) {
			prodArray.put("keyWord", "salePrice");
		} else if (keyWord.equals("highPrice")) {
			prodArray.put("keyWord", "salePrice DESC");
		}

		List<ProductVO2> result = productService.prodArray(prodArray);

		if (user != null) {
			String userId = user.getId();

			Map<String, Object> selectOption = new HashMap<String, Object>();
			selectOption.put("userId", userId);
			selectOption.put("type", "wish");
			wishList = mypageProductService.wishList(selectOption);

			for (int i = 0; i < result.size(); i++) {
				String ProductId = result.get(i).getProductId();

				for (int j = 0; j < wishList.size(); j++) {
					String wish = (String) wishList.get(j).get("productId");

					if (ProductId.equals(wish)) {
						result.get(i).setCartType("wish");
					}

				}
			}

		} else {
			wishMap.put("wishList", "N");
		}

		wishMap.put("result", result);

		resEntity = new ResponseEntity(wishMap, HttpStatus.OK);
		return resEntity;
	}

	// 상품 상세페이지
	@Override
	@RequestMapping(value = "/prodList/prodDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewProduct(@RequestParam("productId") String productId, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();
		ProductVO2 prodList = new ProductVO2();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		prodList = productService.viewProdDetail(productId);
		List<Map<String, Object>> prodOption = productService.selectProdOption(productId);
		List<Map<String, Object>> img = productService.selectProdImg(productId);

		mav.setViewName("prodDetail");

		mav.addObject("prodList", prodList);
		mav.addObject("prodOption", prodOption);
		mav.addObject("product_M", img.get(0).get("imgURL"));
		mav.addObject("product_S", img.get(1).get("imgURL"));

		// 추천 상품 5개
		List<ProductVO2> RecommendProduct = new ArrayList<ProductVO2>();
		RecommendProduct = productService.RecommendProductList();
		// 메인페이지 상품 조회 관심상품처리 (ModelAndView, 회원, 관심상품 )
		wishListChk(mav, member, RecommendProduct, "RecommendProductwishList");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		mav.addObject("page", cri.getPage());
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("RecommendProduct", RecommendProduct);
		mav.addObject("member", member);

		return mav;

	}

	// 메인페이지 상품 조회 관심상품처리 (ModelAndView, 회원, 관심상품 )
	private ModelAndView wishListChk(ModelAndView mav, MemberVO member, List<ProductVO2> product,
			String ProductwishList) throws Exception {

		List<Map<String, Object>> wishList = new ArrayList<Map<String, Object>>();

		if (member != null) {
			String userId = member.getId();

			Map<String, Object> selectOption = new HashMap<String, Object>();
			selectOption.put("userId", userId);
			selectOption.put("type", "wish");
			wishList = mypageProductService.wishList(selectOption);

			for (int i = 0; i < product.size(); i++) {
				String ProductId = product.get(i).getProductId();

				for (int j = 0; j < wishList.size(); j++) {
					String wish = (String) wishList.get(j).get("productId");

					if (ProductId.equals(wish)) {
						product.get(i).setCartType("wish");
					}

				}
			}
			return mav;

		} else {
			return mav.addObject(ProductwishList, "N");
		}
	}

}
