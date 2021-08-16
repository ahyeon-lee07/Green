package com.pro.green.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO2")
public class ArticleVO2 {

	// Ä¿¹Â´ÏÆ¼
	private int num;
	private String id;
	private String productId;
	private String title;
	private String content;
	private Date createDate;
	private int hits;
	private int commentCount;
	private String questionPw;
	private String pwYN;
	private String p_option;
	private String imgType;
	private String imgURL;
	private String productName;
	private String masterYN;
	
	
	
	
	public String getMasterYN() {
		return masterYN;
	}
	public void setMasterYN(String masterYN) {
		this.masterYN = masterYN;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getP_group() {
		return p_group;
	}
	public void setP_group(String p_group) {
		this.p_group = p_group;
	}
	private String p_group;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return createDate;
	}
	public void setDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	public String getPwYN() {
		return pwYN;
	}
	public void setPwYN(String pwYN) {
		this.pwYN = pwYN;
	}
	public String getP_option() {
		return p_option;
	}
	public void setP_option(String p_option) {
		this.p_option = p_option;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}


}