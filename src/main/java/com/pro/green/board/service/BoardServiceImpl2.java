package com.pro.green.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.board.dao.BoardDAO2;
import com.pro.green.board.vo.ArticleVO2;

@Service("boardService2")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl2 implements BoardService2 {
	@Autowired
	BoardDAO2 boardDAO;

	public List<ArticleVO2> selectList(Map<String, Object> selectOption) throws Exception {
		return boardDAO.selectList(selectOption);
	}

	// 상품검색
	public List<Map<String, Object>> productSearch(String keyWord) throws Exception {
		return boardDAO.productSearch(keyWord);
	}

	// 글 등록
	public int insertArticle(Map<String, Object> selectOption) throws Exception {
		return boardDAO.insertArticle(selectOption);
	}

	// 글조회
	public ArticleVO2 selectCommunity(Map<String, Object> selectOption) throws Exception {
		return boardDAO.selectCommunity(selectOption);
	}

	// 글 수정
	public int updateArticle(Map<String, Object> selectOption) throws Exception {
		return boardDAO.updateArticle(selectOption);
	}

	// 글 삭제
	public int deleteArticle(Map<String, Object> selectOption) throws Exception {
		return boardDAO.deleteArticle(selectOption);
	}

	// 댓글
	public List<Map<String, Object>> commentList(Map<String, Object> paramMap) throws Exception {
		return boardDAO.commentList(paramMap);
	}

	// 댓글 조회
	public List<Map<String, Object>> selectComment(Map<String, Object> paramMap) throws Exception {
		return boardDAO.selectComment(paramMap);
	}

	// 댓글 삭제
	public List<Map<String, Object>> DelectComment(Map<String, Object> paramMap) throws Exception {
		return boardDAO.DelectComment(paramMap);
	}

	// 검색
	public List<ArticleVO2> searchList(Map<String, Object> selectOption) throws Exception {
		return boardDAO.searchList(selectOption);
	}

	// 메인화면 공지사항 조회
	public List<ArticleVO2> mainSeletNotice(Map<String, Object> selectOption) throws Exception{
		return boardDAO.mainSeletNotice(selectOption);
	}
	
	// 메인화면 이벤트 조회
	public List<ArticleVO2> mainSeletEvent(Map<String, Object> selectOption2) throws Exception{
		return boardDAO.mainSeletEvent(selectOption2);
	}

}
