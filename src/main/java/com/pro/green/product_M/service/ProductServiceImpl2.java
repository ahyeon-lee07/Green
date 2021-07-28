package com.pro.green.product_M.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.product_M.dao.ProductDAO2;
import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.ProductVO2;

@Service("productService_M")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl2 implements ProductService2 {

	@Autowired
	private ProductDAO2 productDAO;

	// 상품등록
	@Override
	public int addProductEdit(ProductVO2 product) throws DataAccessException {
		return productDAO.insertProduct(product);
	}

	// 등록한 상품 아이디 가져오기
	public String selectProductId(ProductVO2 product) throws DataAccessException {
		return productDAO.selectProductId(product);
	}

	// 옵션 등록
	public int addProductOption(Map<String, Object> paramMap) throws DataAccessException {
		return productDAO.insertProductOption(paramMap);
	}

	// 상품 이미지 등록
	public int addProductImg(Map<String, Object> imageMap) throws DataAccessException {
		return productDAO.insertProductImg(imageMap);
	}

	// 관리자 상품 리스트 조회
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws DataAccessException {
		return productDAO.selectBoardList(cri);
	}

	// 관리자 리스트에서 활성화 여부 변경
	public int showYNChk(Map<String, Object> paramMap) throws DataAccessException {
		return productDAO.showYNChk(paramMap);
	}

	// 관리자 상품 리스트 조회 (필터)
	public List<Map<String, Object>> selectFilterBoardList(Map<String, Object> paramMap) throws DataAccessException {
		return productDAO.selectFilterBoardList(paramMap);
	}

	// 관리자 상품 리스트 개수
	public int countBoardListTotal() throws DataAccessException {
		return productDAO.countBoardListTotal();
	}

	public int filterCountBoardListTotal(String options) throws DataAccessException {
		return productDAO.filterCountBoardListTotal(options);
	}

	// 관리자 상품 리스트 옵션
	public List<Map<String, Object>> selectOptionList(String productId) throws DataAccessException {
		return productDAO.selectOptionList(productId);
	}

	// 관리자 상품 상세페이지
	public ProductVO2 viewProductDetail(String productId) throws DataAccessException {
		return productDAO.viewProductDetail(productId);
	}

	// 관리자 상품 상세페이지
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws DataAccessException {
		return productDAO.selectProductDetail(map);
	}

	public int updateProduct(ProductVO2 product) throws DataAccessException {
		return productDAO.updateProduct(product);
	}

	public int deleteProduct(String productId) throws DataAccessException {
		return productDAO.deleteProduct(productId);
	}

	// 옵션 삭제
	public int deleteProductOption(String productId) throws DataAccessException {
		return productDAO.deleteProductOption(productId);
	}

	// 이미지 삭제
	public int deleteProductImge(Map<String, Object> imageMap) throws DataAccessException {
		return productDAO.deleteProductImge(imageMap);
	}

	// 상품 이미지조회
	public List<Map<String, Object>> selectProductImg(String productId) throws DataAccessException {
		return productDAO.selectProductImg(productId);
	}

	// 관리자 상품 리스트 검색
	public List<Map<String, Object>> searchSelectBoardList(Map<String, Object> paramMap) throws DataAccessException {
		return productDAO.searchSelectBoardList(paramMap);
	}

	// 관리자 상품 리스트 검색
	public List<Map<String, Object>> searchSelectFilterBoardList(Map<String, Object> paramMap)
			throws DataAccessException {
		return productDAO.searchSelectFilterBoardList(paramMap);
	}
}
