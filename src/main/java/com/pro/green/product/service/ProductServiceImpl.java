package com.pro.green.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.product.dao.ProductDAO;
import com.pro.green.product_M.vo.ProductVO2;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;

	// 상품 목록
	@Override
	public List<ProductVO2> listProduct(String p_group) throws Exception {
		List<ProductVO2> productsList = productDAO.selectAllProductsList(p_group);
		return productsList;
	}

	// 회원일 경우 관심상품 조회
	public ProductVO2 viewMemberProdDetail(Map<String, Object> selectOption) throws DataAccessException {
		return productDAO.viewMemberProdDetail(selectOption);
	}

	// 상품 상세페이지
	// 상품 옵션
	@Override
	public List<Map<String, Object>> selectProdOption(String productId) throws DataAccessException {
		return productDAO.selectProdOption(productId);
	}

	// 상품명&가격
	@Override
	public ProductVO2 viewProdDetail(String productId) throws DataAccessException {
		return productDAO.viewProdDetail(productId);
	}

	@Override
	public Map<String, Object> selectProdDetail(Map<String, Object> map) throws DataAccessException {
		return productDAO.selectProdDetail(map);
	}

	// 상품 이미지조회
	@Override
	public List<Map<String, Object>> selectProdImg(String productId) throws DataAccessException {
		return productDAO.selectProdImg(productId);
	}

	// 상품정렬
	public List<ProductVO2> prodArray(Map<String, Object> prodArray) throws DataAccessException {
		return productDAO.prodArray(prodArray);
	}

	// 메인화면 신상품 10개
	public List<ProductVO2> newProductList() throws DataAccessException {
		return productDAO.newProductList();
	}

	// 메인화면 베스트상품 10개
	public List<ProductVO2> bestProductList() throws DataAccessException {
		return productDAO.bestProductList();
	}

	// 할인상품 10개
	public List<ProductVO2> discountProductList() throws DataAccessException {
		return productDAO.discountProductList();
	}

	// 추천 상품 5개
	public List<ProductVO2> RecommendProductList(String productId) throws DataAccessException {
		return productDAO.RecommendProductList(productId);
	}

	// 상품 검색
	public List<ProductVO2> productSearch(Map<String, Object> searchOption) throws DataAccessException {
		return productDAO.productSearch(searchOption);
	}

}