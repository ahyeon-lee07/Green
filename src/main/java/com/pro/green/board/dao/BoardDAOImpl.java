package com.pro.green.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pro.green.board.vo.ArticleVO;
import com.pro.green.board.vo.ImageVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	// 공지사항 글 목록
	@Override
	public List<ArticleVO> selectAllNoticeList() throws DataAccessException {
		List<ArticleVO> listNotice = sqlSession.selectList("mapper.board.selectAllNoticeList");
		return listNotice;
	}

	// 공지사항 상세페이지
	@Override
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNotice", noticeNum);
	}

	// 공지사항 글쓰기
	@Override
    public int insertNewNotice(Map articleMap) throws DataAccessException {
        int result = sqlSession.insert("mapper.board.insertNewNotice", articleMap);
        return result;
    }
	
	// 공지사항 새 글 번호
	private int selectNewNoticeNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewNoticeNum");
	}

	// 공지사항 수정
	@Override
	public void updateNotice(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateNotice", articleMap);
	}
	
	// 공지사항 삭제
	@Override
	public void deleteNotice(int noticeNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteNotice", noticeNum);
	}

	// 이벤트 게시판 글 목록
	@Override
	public List<ArticleVO> selectAllEventList() throws DataAccessException {
	List<ArticleVO> eventList = sqlSession.selectList("mapper.board.selectAllEventList");
		return eventList;
	}

	// 이벤트 게시판 글 상세페이지
	@Override
	public ArticleVO selectEvent(int eventNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectEvent", eventNum);
	}
		
	// 이벤트 게시판 글 추가
	@Override
    public int insertNewEvent(Map articleMap) throws DataAccessException {
        int result = sqlSession.insert("mapper.board.insertNewEvent", articleMap);
        return result;
    }
		
	// 이벤트 게시판 새 글 번호
	private int selectNewEventNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewEventNum");
	}
		
	// 이벤트 게시판 글 수정
	@Override
	public void updateEvent(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateEvent", articleMap);
	}

	// 이벤트 게시판 글 삭제
	@Override
	public void deleteEvent(int eventNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteEvent", eventNum);
	}

	// Q&A 글 목록
	@Override
	public List<ArticleVO> selectAllQnAList() throws DataAccessException {
		List<ArticleVO> listQnA = sqlSession.selectList("mapper.board.selectAllQnAList");
		return listQnA;
	}

	// Q&A 상세페이지
	@Override
	public ArticleVO selectQnA(int questionNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectQnA", questionNum);
	}
	
	// Q&A 글 추가
	@Override
    public int insertNewQnA(Map articleMap) throws DataAccessException {
        int result = sqlSession.insert("mapper.board.insertNewQnA", articleMap);
        return result;
    }
			
	// Q&A 새 글 번호
	private int selectNewQnANum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewQnANum");
	}
	
	// Q&A 수정
	@Override
	public void updateQnA(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateQnA", articleMap);
	}

	// Q&A 삭제
	@Override
	public void deleteQnA(int questionNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteQnA", questionNum);

	}

	// Review 글 목록
	@Override
	public List<ArticleVO> selectAllReviewList() throws DataAccessException {
		List<ArticleVO> listReview = sqlSession.selectList("mapper.board.selectAllReviewList");
		return listReview;
	}

	// Review 상세페이지
	@Override
	public ArticleVO selectReview(int reviewNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectReview", reviewNum);
	}

	// Review 글쓰기
	@Override
    public int insertNewReview(Map articleMap) throws DataAccessException {
        int result = sqlSession.insert("mapper.board.insertNewReview", articleMap);
        return result;
    }
	
	// Review 새 글 번호
	private int selectNewReviewNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewReviewNum");
	}

	// Review 수정
	@Override
	public void updateReview(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateReview", articleMap);
	}
	
	// Review 삭제
	@Override
	public void deleteReview(int reviewNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteReview", reviewNum);
	}

}
