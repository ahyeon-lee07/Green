package com.pro.green.board.service;

import java.util.List;
import java.util.Map;

import com.pro.green.board.vo.ArticleVO;

public interface BoardService {
	// 공지사항
	public List<ArticleVO> listNotice() throws Exception; // 글 목록
	public ArticleVO viewNotice(int noticeNum) throws Exception; // 글 상세
	public int addNewNotice(Map articleMap) throws Exception; // 글 추가
	public void modNotice(Map articleMap) throws Exception; // 글 수정
	public void removeNotice(int noticeNum) throws Exception; // 글 삭제
	
	// 이벤트
	public List<ArticleVO> eventList() throws Exception; // 글 목록
	public Map eventView(int eventNum) throws Exception; // 글 상세
	public int addNewEvent(Map articleMap) throws Exception; // 글 추가
	public void modEvent(Map articleMap) throws Exception; // 글 수정
	public void removeEvent(int eventNum) throws Exception; // 글 삭제
	
	// QnA
	public List<ArticleVO> listQnA() throws Exception; // 글 목록
	public ArticleVO viewQnA(int questionNum) throws Exception; // 글 상세
	public int addNewQnA(Map articleMap) throws Exception; // 글 추가
	public void modQnA(Map articleMap) throws Exception; // 글 수정
	public void removeQnA(int questionNum) throws Exception; // 글 삭제
	
	// Review
	public List<ArticleVO> listReview() throws Exception; // 글 목록
	public ArticleVO viewReview(int reviewNum) throws Exception; //글 상세
	public int addNewReview(Map articleMap) throws Exception; // 글 추가
	public void modReview(Map articleMap) throws Exception; // 글 수정
	public void removeReview(int reviewNum) throws Exception; // 글 삭제
	
}