package com.pro.green.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {

	// 공지사항
	private int noticeNum;
	private String id;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;

	// 이벤트 게시판
	private int eventNum;
	private String eventTitle;
	private String eventContent;
	private Date eventDate;
	private int eventHits;

	// Q&A
	private int questionNum;
	private String productId;
	private String questionTitle;
	private String questionContent;
	private int commentCount;
	private String questionPw;
	private String questionYN;
	private Date questionDate;

	// Review
	private int reviewNum;
	private String imageFileName;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;

	public ArticleVO() {
		System.out.println("articleVO 생성자");
	}

	// 공지사항
	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	// 이벤트 게시판
	public int getEventNum() {
		return eventNum;
	}

	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	
	public int getEventHits() {
		return eventHits;
	}

	public void setEventHits(int eventHits) {
		this.eventHits = eventHits;
	}

	// Q&A
	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getQuestionPw() {
		return questionPw;
	}

	public void setQuestionPw(String questionPw) {
		this.questionPw = questionPw;
	}
	
	public String getQuestionYN() {
		return questionYN;
	}

	public void setQuestionYN(String questionYN) {
		this.questionYN = questionYN;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	// Review
	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	// 이미지
	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

}