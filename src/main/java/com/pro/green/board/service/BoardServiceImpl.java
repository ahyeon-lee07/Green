package com.pro.green.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.board.dao.BoardDAO;
import com.pro.green.board.vo.ArticleVO;
import com.pro.green.board.vo.ImageVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	// 공지사항 목록
	public List<ArticleVO> listNotice() throws Exception {
		List<ArticleVO> listNotice = boardDAO.selectAllNoticeList();
		return listNotice;
	}

	// 공지사항 상세페이지
	@Override
	public ArticleVO viewNotice(int noticeNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectNotice(noticeNum);
		return articleVO;
	}

	// 공지사항 글쓰기
	@Override
	public int addNewNotice(Map articleMap) throws Exception {
		return boardDAO.insertNewNotice(articleMap);
	}

	// 공지사항 수정하기
	@Override
	public void modNotice(Map articleMap) throws Exception {
		boardDAO.updateNotice(articleMap);
	}
	
	// 공지사항 삭제하기
	@Override
	public void removeNotice(int noticeNum) throws Exception {
		boardDAO.deleteNotice(noticeNum);
	}

	// 이벤트 글 목록
	public List<ArticleVO> eventList() throws Exception {
		List<ArticleVO> eventList = boardDAO.selectAllEventList();
		return eventList;
	}

	// 이벤트 상세페이지
	@Override
	public Map eventView(int eventNum) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectEvent(eventNum);
		articleMap.put("article", articleVO);
		return articleMap;
	}
		
	// 이벤트 글 추가
	@Override
	public int addNewEvent(Map articleMap) throws Exception{
		return boardDAO.insertNewEvent(articleMap);
	}
		
	// 이벤트 글 수정
	@Override
	public void modEvent(Map articleMap) throws Exception {
		boardDAO.updateEvent(articleMap);
	}

	// 이벤트 글 삭제
	@Override
	public void removeEvent(int eventNum) throws Exception {
		boardDAO.deleteEvent(eventNum);
	}

	// QnA 목록
	public List<ArticleVO> listQnA() throws Exception {
		List<ArticleVO> listQnA = boardDAO.selectAllQnAList();
		return listQnA;
	}

	// QnA 상세페이지
	@Override
	public ArticleVO viewQnA(int questionNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectQnA(questionNum);
		return articleVO;
	}
	
	// QnA 글 추가
	@Override
	public int addNewQnA(Map articleMap) throws Exception{
		return boardDAO.insertNewQnA(articleMap);
	}

	// QnA 수정하기
	@Override
	public void modQnA(Map articleMap) throws Exception {
		boardDAO.updateQnA(articleMap);
	}
	
	// QnA 삭제하기
	@Override
	public void removeQnA(int questionNum) throws Exception {
		boardDAO.deleteQnA(questionNum);
	}

	// review 목록
	public List<ArticleVO> listReview() throws Exception {
		List<ArticleVO> listReview = boardDAO.selectAllReviewList();
		return listReview;
	}

	// review 상세페이지
	@Override
	public ArticleVO viewReview(int reviewNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectReview(reviewNum);
		return articleVO;
	}

	// review 글쓰기
	@Override
	public int addNewReview(Map articleMap) throws Exception {
		return boardDAO.insertNewReview(articleMap);
	}

	// review 수정
	@Override
	public void modReview(Map articleMap) throws Exception {
		boardDAO.updateReview(articleMap);
	}
	
	// review 삭제하기
	@Override
	public void removeReview(int reviewNum) throws Exception {
		boardDAO.deleteReview(reviewNum);
	}

}
