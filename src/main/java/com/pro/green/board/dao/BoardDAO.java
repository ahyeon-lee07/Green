package com.pro.green.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.board.vo.ArticleVO;


public interface BoardDAO {
	// 공지사항
	public List<ArticleVO> selectAllNoticeList() throws DataAccessException; // 글 목록
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException; // 글 상세
	public int insertNewNotice(Map articleMap) throws DataAccessException; // 글 추가
	public void updateNotice(Map articleMap) throws DataAccessException; // 글 수정
	public void deleteNotice(int noticeNum) throws DataAccessException; // 글 삭제
	
	// 이벤트 게시판
	public List<ArticleVO> selectAllEventList() throws DataAccessException; // 글 목록
	public ArticleVO selectEvent(int eventNum) throws DataAccessException; // 글 상세
	public int insertNewEvent(Map articleMap) throws DataAccessException; // 글 추가
	public void updateEvent(Map articleMap) throws DataAccessException; // 글 수정
	public void deleteEvent(int eventNum) throws DataAccessException; // 글 삭제
	
	// Q&A
	public List<ArticleVO> selectAllQnAList() throws DataAccessException; // 글 목록
	public ArticleVO selectQnA(int questionNum) throws DataAccessException; // 글 상세
	public int insertNewQnA(Map articleMap) throws DataAccessException; // 글 추가
	public void updateQnA(Map articleMap) throws DataAccessException; // 글 수정
	public void deleteQnA(int questionNum) throws DataAccessException; // 글 삭제
	
	// Review
	public List<ArticleVO> selectAllReviewList() throws DataAccessException; // 글 목록
	public ArticleVO selectReview(int reviewNum) throws DataAccessException; // 글 상세
	public int insertNewReview(Map articleMap) throws DataAccessException; // 글 추가
	public void updateReview(Map articleMap) throws DataAccessException; // 글 수정
	public void deleteReview(int reviewNum) throws DataAccessException; // 글 삭제
	
}