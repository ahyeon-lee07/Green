package com.pro.green.product_M.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.ProductVO2;

@Repository("productDAO_M")
public class ProductDAOImpl2 implements ProductDAO2 {
	@Autowired
	private SqlSession sqlSession;

	// 회원 가입
	@Override
	public int insertProduct(ProductVO2 product) throws DataAccessException {
		int result = sqlSession.insert("mapper.product.insertProduct", product);
		return result;
	}

	// 등록한 상품 아이디 가져오기
	public String selectProductId(ProductVO2 product) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.product.selectProductId", product);
		return result;
	}

	// 상품 옵션등록
	public int insertProductOption(Map<String, Object> paramMap) throws DataAccessException {
		int result = sqlSession.insert("mapper.product.insertProductOption", paramMap);
		return result;
	}

	// 상품 이미지 등록
	public int insertProductImg(Map<String, Object> imageMap) throws DataAccessException {
		int result = sqlSession.insert("mapper.product.insertProductImg", imageMap);
		return result;
	}

	// 관리자 상품 리스트 조회
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.selectBoardList", cri);
		return result;
	}

	// 관리자 리스트에서 활성화 여부 변경
	public int showYNChk(Map<String, Object> paramMap) throws DataAccessException {
		int result = sqlSession.update("mapper.product.showYNChk", paramMap);
		return result;
	}

	// 관리자 상품 리스트 조회 (필터)
	public List<Map<String, Object>> selectFilterBoardList(Map<String, Object> paramMap) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.selectFilterBoardList", paramMap);
		return result;
	}

	// 관리자 상품 리스트 개수 조회
	public int countBoardListTotal() throws DataAccessException {
		int result = sqlSession.selectOne("mapper.product.countBoardList");
		return result;
	}

	public int filterCountBoardListTotal(String options) throws DataAccessException {
		int result = sqlSession.selectOne("mapper.product.filterCountBoardListTotal", options);
		return result;
	}

	// 관리자 상품 리스트 옵션 조회
	public List<Map<String, Object>> selectOptionList(String productId) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.selectOptionList", productId);
		return result;
	}

	public ProductVO2 viewProductDetail(String productId) throws DataAccessException {
		ProductVO2 result = sqlSession.selectOne("mapper.product.selectProduct", productId);
		return result;
	}

	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws DataAccessException {
		Map<String, Object> result = sqlSession.selectMap(null, null);
		return result;
	}

	public int updateProduct(ProductVO2 product) throws DataAccessException {
		int result = sqlSession.update("mapper.product.updateProduct", product);
		return result;
	}

	public int deleteProductOption(String productId) throws DataAccessException {
		int result = sqlSession.delete("mapper.product.deleteProductOption", productId);
		return result;
	}

	public int deleteProductImge(Map<String, Object> imageMap) throws DataAccessException {
		int result = sqlSession.delete("mapper.product.deleteProductImge", imageMap);
		return result;
	}

	// 관리자 상품 삭제
	public int deleteProduct(String productId) throws DataAccessException {
		int result = sqlSession.delete("mapper.product.deleteProduct", productId);
		return result;
	}

	// 상품 이미지 조회
	public List<Map<String, Object>> selectProductImg(String productId) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.selectProductImg", productId);
		return result;
	}

	// 관리자 상품 리스트 검색
	public List<Map<String, Object>> searchSelectBoardList(Map<String, Object> paramMap) throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.searchSelectBoardList", paramMap);
		return result;
	}

	public List<Map<String, Object>> searchSelectFilterBoardList(Map<String, Object> paramMap)
			throws DataAccessException {
		List<Map<String, Object>> result = sqlSession.selectList("mapper.product.searchSelectFilterBoardList",
				paramMap);
		return result;
	}
}