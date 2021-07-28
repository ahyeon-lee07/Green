package com.pro.green.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.product_M.vo.ProductVO2;


public interface ProductDAO {
	
	// 상품 목록
	public List<ProductVO2> selectAllProductsList(String p_group) throws DataAccessException;
	
	// 상품 상세페이지
	

	// 상품 이름&가격
	public ProductVO2 viewProdDetail(String productId) throws DataAccessException;

	public Map<String, Object> selectProdDetail(Map<String, Object> map) throws DataAccessException;
	
	// 상품 옵션
	public List<Map<String, Object>> selectProdOption(String productId) throws DataAccessException;

	// 상품 이미지
	public List<Map<String, Object>> selectProdImg(String productId) throws DataAccessException;

	//상품정렬
	public List<ProductVO2> prodArray(Map<String, Object> prodArray) throws DataAccessException;

	// 메인화면 신상품 10개
	public List<ProductVO2> newProductList() throws DataAccessException;

	// 메인화면 베스트상품 10개
	public List<ProductVO2> bestProductList() throws DataAccessException;

	// 할인상품 10개
	public List<ProductVO2> discountProductList() throws DataAccessException;


}