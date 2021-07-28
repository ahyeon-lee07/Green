package com.pro.green.board.service;

import java.util.List;
import java.util.Map;

import com.pro.green.board.vo.ArticleVO;
import com.pro.green.board.vo.ArticleVO2;

public interface BoardService2 {

	public List<ArticleVO2> selectList(Map<String, Object> selectOption) throws Exception;

	//상품검색
	public List<Map<String, Object>> productSearch(String keyWord) throws Exception;

	//글 등록
	public int insertArticle(Map<String, Object> selectOption) throws Exception;

	//글조회
	public ArticleVO2 selectCommunity(Map<String, Object> selectOption) throws Exception;

	//글 수정
	public int updateArticle(Map<String, Object> selectOption) throws Exception;

	//글 삭제
	public int deleteArticle(Map<String, Object> selectOption) throws Exception;

	//댓글
	public List<Map<String, Object>> commentList(Map<String, Object> paramMap) throws Exception;

	//댓글 조회
	public List<Map<String, Object>> selectComment(Map<String, Object> paramMap) throws Exception;

	//댓글 삭제
	public List<Map<String, Object>> DelectComment(Map<String, Object> paramMap) throws Exception;

	//검색
	public List<ArticleVO2> searchList(Map<String, Object> selectOption) throws Exception;

	//메인화면 공지사항 조회
	public List<ArticleVO2> mainSeletNotice(Map<String, Object> selectOption) throws Exception;


	
}