package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.product_M.vo.ProductVO2;

public interface ProductService {
	
	// 상품 목록
	public List<ProductVO2> listProduct(String p_group) throws Exception;
	

	// 상품 옵션
	public List<Map<String, Object>> selectProdOption(String productId) throws DataAccessException;
	
	// 상품 이름&가격
	public ProductVO2 viewProdDetail(String productId) throws DataAccessException;
	
	public Map<String, Object> selectProdDetail(Map<String, Object> map) throws DataAccessException;
	
	public List<Map<String, Object>> selectProdImg(String productId) throws DataAccessException;


	//상품정렬
	public List<ProductVO2> prodArray(Map<String, Object> prodArray) throws DataAccessException;


	//메인화면 신상품 10개
	public List<ProductVO2> newProductList() throws DataAccessException;

	// 베스트상품 10개
	public List<ProductVO2> bestProductList() throws DataAccessException;

	// 할인상품 10개
	public List<ProductVO2> discountProductList() throws DataAccessException;

	
}