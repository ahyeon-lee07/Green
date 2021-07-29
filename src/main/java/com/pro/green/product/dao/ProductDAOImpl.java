package com.pro.green.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.board.dao.BoardDAO;
import com.pro.green.board.vo.ArticleVO;
import com.pro.green.product_M.vo.ProductVO2;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	// 상품 목록
	@Override
	public List<ProductVO2> selectAllProductsList(String p_group) throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.selectAllProductsList", p_group);
		return productsList;
	}

	// 상품 상세페이지

	// 상품명&가격
	@Override
	public ProductVO2 viewProdDetail(String productId) throws DataAccessException {
		ProductVO2 prodDetail = sqlSession.selectOne("mapper.product.selectProduct", productId);
		return prodDetail;
	}

	@Override
	public Map<String, Object> selectProdDetail(Map<String, Object> map) throws DataAccessException {
		Map<String, Object> result = sqlSession.selectMap(null, null);
		return result;
	}

	// 상품 옵션
	@Override
	public List<Map<String, Object>> selectProdOption(String productId) throws DataAccessException {
		List<Map<String, Object>> prodOption = sqlSession.selectList("mapper.product.selectOptionList", productId);
		return prodOption;
	}

	// 상품 이미지
	@Override
	public List<Map<String, Object>> selectProdImg(String productId) throws DataAccessException {
		List<Map<String, Object>> prodImg = sqlSession.selectList("mapper.product.selectProductImg", productId);
		return prodImg;
	}

	// 상품정렬
	public List<ProductVO2> prodArray(Map<String, Object> prodArray) throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.prodArray", prodArray);
		return productsList;
	}

	// 메인화면 신상품 10개
	public List<ProductVO2> newProductList() throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.newProductList");
		return productsList;
	}

	// 메인화면 베스트상품 10개
	public List<ProductVO2> bestProductList() throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.bestProductList");
		return productsList;
	}

	// 할인상품 10개
	public List<ProductVO2> discountProductList() throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.discountProductList");
		return productsList;
	}

	// 추천 상품 5개
	public List<ProductVO2> RecommendProductList() throws DataAccessException {
		List<ProductVO2> productsList = sqlSession.selectList("mapper.product.RecommendProductList");
		return productsList;
	}

}
