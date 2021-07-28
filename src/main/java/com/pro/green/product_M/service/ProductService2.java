package com.pro.green.product_M.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.ProductVO2;

public interface ProductService2 {
	public int addProductEdit(ProductVO2 product) throws DataAccessException;
	public String selectProductId(ProductVO2 product) throws DataAccessException;
	public int addProductOption(Map<String, Object> paramMap) throws DataAccessException;
	public int addProductImg(Map<String, Object> imageMap) throws DataAccessException;
	
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws DataAccessException;
	public List<Map<String, Object>> selectFilterBoardList(Map<String, Object> paramMap) throws DataAccessException;
	
	//조회 총개수
	public int countBoardListTotal() throws DataAccessException;
	public int filterCountBoardListTotal(String options) throws DataAccessException;
	
	public List<Map<String,Object>> selectOptionList(String productId) throws DataAccessException;
	
	public ProductVO2 viewProductDetail(String productId) throws DataAccessException;
	public List<Map<String,Object>> selectProductImg(String productId) throws DataAccessException;
	public int updateProduct(ProductVO2 product) throws DataAccessException;
	
	public int deleteProduct(String productId) throws DataAccessException;
	public int deleteProductOption(String productId) throws DataAccessException;
	public int deleteProductImge(Map<String, Object> imageMap) throws DataAccessException;
	//관리자 상품 리스트 검색
	public List<Map<String, Object>> searchSelectBoardList(Map<String, Object> paramMap) throws DataAccessException;
	public List<Map<String, Object>> searchSelectFilterBoardList(Map<String, Object> paramMap) throws DataAccessException;
	//관리자 리스트에서 활성화 여부 변경
	public int showYNChk(Map<String, Object> paramMap) throws DataAccessException;

	
}
