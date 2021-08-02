package com.pro.green.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.green.board.service.BoardService2;
import com.pro.green.board.vo.ArticleVO2;
import com.pro.green.board.vo.ImageVO;
import com.pro.green.member.vo.MemberVO;
import com.pro.green.product_M.vo.Criteria;
import com.pro.green.product_M.vo.PageMaker;
import com.pro.green.product_M.vo.ProductVO2;

@Controller("boardController2")
public class BoardControllerImpl2 implements BoardController2 {
	@Autowired
	private BoardService2 boardService;
	@Autowired
	private ArticleVO2 articleVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private ProductVO2 product;

	// 커뮤니티 리스트
	@RequestMapping(value = "/community.do", method = RequestMethod.GET)
	public ModelAndView community(@RequestParam String communityType, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);
		List<ArticleVO2> list = new ArrayList<ArticleVO2>();

		int pageTotal = 0;

		if (communityType.equals("qna")) {
			mav.addObject("pageTitle", "QnA");
			selectOption.put("selectOption",
					"questionNum AS num, id AS id,productId AS productId,questionTitle AS title,questionContent AS content,questionHits AS hits,commentCount AS commentCount,questionPw AS questionPw,pwYN AS pwYN,questionDate AS createDate");

		} else if (communityType.equals("notice")) {
			mav.addObject("pageTitle", "공지사항");
			selectOption.put("selectOption",
					"noticeNum AS num, id AS id,noticeTitle AS title,noticeContent AS content,noticeHits AS hits, noticeDate AS createDate");

		} else if (communityType.equals("event")) {
			mav.addObject("pageTitle", "이벤트");
			selectOption.put("selectOption",
					"eventNum AS num, id AS id,eventTitle AS title,eventContent AS content,eventHits AS hits, eventDate AS createDate");

		} else if (communityType.equals("review")) {
			mav.addObject("pageTitle", "리뷰");
			selectOption.put("selectOption",
					"reviewNum AS num, id AS id,productId AS productId,reviewTitle AS title,reviewContent AS content,reviewHits AS hits,reviewDate AS createDate");

		}

		list = boardService.selectList(selectOption);

		pageMaker.setCri(cri);

		pageMaker.setTotalCount(list.size());

		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("communityType", communityType);
		mav.setViewName("communityList");
		return mav;
	}

	// 커뮤니티 검색
	@RequestMapping(value = "/community/search.do", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam(value = "searchKeyWordOption") String searchKeyWordOption,
									@RequestParam(value = "keyWord") String keyWord,
									@RequestParam(value = "communityType") String communityType, 
									HttpServletRequest request, Criteria cri) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);
		selectOption.put("keyWord", keyWord);
		List<ArticleVO2> list = new ArrayList<ArticleVO2>();

		int pageTotal = 0;

		if (communityType.equals("qna")) {
			mav.addObject("pageTitle", "QnA");
			
			if(searchKeyWordOption.equals("title")) {
				selectOption.put("keyWordOption", "questionTitle");
			}else if (searchKeyWordOption.equals("content")) {
				selectOption.put("keyWordOption", "questionContent");
			}
			
			selectOption.put("selectOption",
					"questionNum AS num, id AS id,productId AS productId,questionTitle AS title,questionContent AS content,questionHits AS hits,commentCount AS commentCount,questionPw AS questionPw,pwYN AS pwYN,questionDate AS createDate");

		} else if (communityType.equals("notice")) {
			mav.addObject("pageTitle", "공지사항");
			
			if(searchKeyWordOption.equals("title")) {
				selectOption.put("keyWordOption", "noticeTitle");
			}else if (searchKeyWordOption.equals("content")) {
				selectOption.put("keyWordOption", "noticeContent");
			}
			
			selectOption.put("selectOption",
					"noticeNum AS num, id AS id,noticeTitle AS title,noticeContent AS content,noticeHits AS hits, noticeDate AS createDate");

		} else if (communityType.equals("event")) {
			mav.addObject("pageTitle", "이벤트");
			
			if(searchKeyWordOption.equals("title")) {
				selectOption.put("keyWordOption", "eventTitle");
			}else if (searchKeyWordOption.equals("content")) {
				selectOption.put("keyWordOption", "eventContent");
			}
			
			selectOption.put("selectOption",
					"eventNum AS num, id AS id,eventTitle AS title,eventContent AS content,eventHits AS hits, eventDate AS createDate");

		} else if (communityType.equals("review")) {
			mav.addObject("pageTitle", "리뷰");
			
			if(searchKeyWordOption.equals("title")) {
				selectOption.put("keyWordOption", "reviewTitle");
			}else if (searchKeyWordOption.equals("content")) {
				selectOption.put("keyWordOption", "reviewContent");
			}
			
			selectOption.put("selectOption",
					"reviewNum AS num, id AS id,productId AS productId,reviewTitle AS title,reviewContent AS content,reviewHits AS hits,reviewDate AS createDate");

		}

		list = boardService.searchList(selectOption);

		pageMaker.setCri(cri);

		pageMaker.setTotalCount(list.size());

		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("communityType", communityType);
		mav.setViewName("communityList");

		return mav;
	}

	// 커뮤니티 등록화면
	@RequestMapping(value = "/community/communityAdd.do", method = RequestMethod.GET)
	public ModelAndView communityAddForm(@RequestParam String communityType, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);
		List<ArticleVO2> list = new ArrayList<ArticleVO2>();

		if (communityType.equals("qna")) {
			mav.addObject("pageTitle", "QnA 등록");

			// 주소로 접근 방지
			loginChk(mav, member, "communityAdd");

		} else if (communityType.equals("notice")) {
			mav.addObject("pageTitle", "공지사항 등록");

			// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
			sessionChk(mav, member, "communityAdd");

		} else if (communityType.equals("event")) {
			mav.addObject("pageTitle", "이벤트 등록");

			// 관리자 세션 체크 (ModelAndView, 세션정보, "접속화면이름")
			sessionChk(mav, member, "communityAdd");

		} else if (communityType.equals("review")) {
			mav.addObject("pageTitle", "리뷰 등록");

			// 주소로 접근 방지
			loginChk(mav, member, "communityAdd");

		}

		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.addObject("communityType", communityType);

		return mav;
	}

	// 커뮤니티 등록
	@RequestMapping(value = "/community/add.do", method = RequestMethod.POST)
	public ModelAndView communityAdd(@RequestParam(value = "communityType") String communityType,
			@ModelAttribute("community") ArticleVO2 articleVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();
		int result = 0;

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);

		if (communityType.equals("qna")) {

			String productId = articleVO.getProductId();
			String pwYN = articleVO.getPwYN();

			if (!productId.equals("") && pwYN.equals("Y")) {
				selectOption.put("selectOption", "id, productId, questionTitle, questionContent, questionPw, pwYN");
				selectOption.put("value",
						"'" + articleVO.getId() + "','" + articleVO.getProductId() + "','" + articleVO.getTitle()
								+ "','" + articleVO.getContent() + "','" + articleVO.getQuestionPw() + "','"
								+ articleVO.getPwYN() + "'");

			} else if (!productId.equals("") && pwYN.equals("N")) {
				selectOption.put("selectOption", "id, productId, questionTitle, questionContent, pwYN");
				selectOption.put("value", "'" + articleVO.getId() + "','" + articleVO.getProductId() + "','"
						+ articleVO.getTitle() + "','" + articleVO.getContent() + "','" + articleVO.getPwYN() + "'");

			} else if (productId.equals("") && pwYN.equals("Y")) {
				selectOption.put("selectOption", "id, questionTitle, questionContent, questionPw, pwYN");
				selectOption.put("value",
						"'" + articleVO.getId() + "','" + articleVO.getTitle() + "','" + articleVO.getContent() + "','"
								+ articleVO.getQuestionPw() + "','" + articleVO.getPwYN() + "'");

			} else if (productId.equals("") && pwYN.equals("N")) {
				selectOption.put("selectOption", "id, questionTitle, questionContent, pwYN");
				selectOption.put("value", "'" + articleVO.getId() + "','" + articleVO.getTitle() + "','"
						+ articleVO.getContent() + "','" + articleVO.getPwYN() + "'");
			}

		} else if (communityType.equals("notice")) {
			selectOption.put("selectOption", "id, noticeTitle, noticeContent");
			selectOption.put("value",
					"'" + articleVO.getId() + "','" + articleVO.getTitle() + "','" + articleVO.getContent() + "'");

		} else if (communityType.equals("event")) {
			selectOption.put("selectOption", "id, eventTitle, eventContent");
			selectOption.put("value",
					"'" + articleVO.getId() + "','" + articleVO.getTitle() + "','" + articleVO.getContent() + "'");

		} else if (communityType.equals("review")) {
			selectOption.put("selectOption", "id, productId, reviewTitle, reviewContent");
			selectOption.put("value", "'" + articleVO.getId() + "','" + articleVO.getProductId() + "','"
					+ articleVO.getTitle() + "','" + articleVO.getContent() + "'");

		}

		result = boardService.insertArticle(selectOption);

		mav.addObject("member", member);
		mav.addObject("communityType", communityType);
		mav.setViewName("redirect:/community.do");

		return mav;
	}

	// 상품검색 창
	@RequestMapping(value = "/productSearch.do", method = RequestMethod.GET)
	public String productSearch(Locale locale, Model model) {
		return "productSearch";
	}

	// 상품검색
	@RequestMapping(value = "/productSearch/search.do", method = RequestMethod.POST)
	public ResponseEntity productSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String keyWord = request.getParameter("keyWord");

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		result = boardService.productSearch(keyWord);

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	// 페이지상세
	@RequestMapping(value = "/communityDerail/derailPage.do", method = RequestMethod.GET)
	public ModelAndView communityDerail(@RequestParam(value = "communityNum") String communityNum,
			@RequestParam(value = "communityType") String communityType, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		ArticleVO2 community = new ArticleVO2();
		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);
		List<Map<String, Object>> commentList = new ArrayList<Map<String, Object>>();

		if (communityType.equals("qna")) {
			mav.addObject("pageTitle", "QnA");
			selectOption.put("communityNum", "questionNum='" + communityNum + "'");
			selectOption.put("hits", "questionHits = questionHits + 1");
			selectOption.put("value",
					"questionNum AS num, id AS id, productId AS productId, questionTitle AS title, questionContent AS content, questionHits AS hits, questionPw AS questionPw, pwYN AS pwYN");

			community = boardService.selectCommunity(selectOption);

			Map<String, Object> paramMap = new HashMap<String, Object>();

			
			
			if(member != null) {
				if(member.getMasterYN().equals("M") || community.getPwYN().equals("N")){
					mav.addObject("pageTitle", "QnA");

					paramMap.put("qnANum", communityNum);
					commentList = boardService.selectComment(paramMap);

					mav.setViewName("communityDerail");
				}else if (community.getPwYN().equals("Y")) {
					mav.setViewName(
							"redirect:/communityChk.do?communityNum=" + communityNum + "&communityType=" + communityType);
				}
			}else {
				if (community.getPwYN().equals("Y")) {
					mav.setViewName(
							"redirect:/communityChk.do?communityNum=" + communityNum + "&communityType=" + communityType);

				} else if(community.getPwYN().equals("N")){
					mav.addObject("pageTitle", "QnA");

					paramMap.put("qnANum", communityNum);
					commentList = boardService.selectComment(paramMap);

					mav.setViewName("communityDerail");
				}
			}
			
			

		} else if (communityType.equals("notice")) {
			mav.addObject("pageTitle", "공지사항");
			selectOption.put("communityNum", "noticeNum='" + communityNum + "'");
			selectOption.put("hits", "noticeHits = noticeHits + 1");
			selectOption.put("value",
					"noticeNum AS num, id AS id, noticeTitle AS title, noticeContent AS content, noticeHits AS hits");

			community = boardService.selectCommunity(selectOption);

			mav.setViewName("communityDerail");
		} else if (communityType.equals("event")) {
			mav.addObject("pageTitle", "이벤트");
			selectOption.put("communityNum", "eventNum='" + communityNum + "'");
			selectOption.put("hits", "eventHits = eventHits + 1");
			selectOption.put("value",
					"eventNum AS num, id AS id, eventTitle AS title, eventContent AS content, eventHits AS hits");

			community = boardService.selectCommunity(selectOption);

			mav.setViewName("communityDerail");
		} else if (communityType.equals("review")) {
			mav.addObject("pageTitle", "리뷰");
			selectOption.put("communityNum", "reviewNum='" + communityNum + "'");
			selectOption.put("hits", "reviewHits = reviewHits + 1");
			selectOption.put("value",
					"reviewNum AS num, id AS id, productId AS productId, reviewTitle AS title, reviewContent AS content, reviewHits AS hits");

			community = boardService.selectCommunity(selectOption);

			mav.setViewName("communityDerail");
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("page", cri.getPage());
		mav.addObject("communityType", communityType);
		mav.addObject("community", community);
		mav.addObject("member", member);
		mav.addObject("commentList", commentList);
		return mav;
	}

	// 커뮤니티 수정
	@RequestMapping(value = "/community/edit.do", method = RequestMethod.POST)
	public ModelAndView communityEdit(@RequestParam(value = "communityType") String communityType,
			@RequestParam(value = "communityNum") String communityNum,
			@ModelAttribute("community") ArticleVO2 articleVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();
		int result = 0;

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);

		if (communityType.equals("qna")) {

			String productId = articleVO.getProductId();
			String pwYN = articleVO.getPwYN();

			selectOption.put("communityNum", "questionNum='" + communityNum + "'");
			if (!productId.equals("") && pwYN.equals("Y")) {
				selectOption.put("value", "id='" + articleVO.getId() + "',productId='" + articleVO.getProductId()
						+ "',questionTitle='" + articleVO.getTitle() + "',questionContent='" + articleVO.getContent()
						+ "',questionPw='" + articleVO.getQuestionPw() + "',pwYN='" + articleVO.getPwYN() + "'");

			} else if (!productId.equals("") && pwYN.equals("N")) {
				selectOption.put("value",
						"id='" + articleVO.getId() + "',productId='" + articleVO.getProductId() + "',questionTitle='"
								+ articleVO.getTitle() + "',questionContent='" + articleVO.getContent() + "',pwYN='"
								+ articleVO.getPwYN() + "'");

			} else if (productId.equals("") && pwYN.equals("Y")) {
				selectOption.put("value",
						"id='" + articleVO.getId() + "',questionTitle='" + articleVO.getTitle() + "',questionContent='"
								+ articleVO.getContent() + "',questionPw='" + articleVO.getQuestionPw() + "',pwYN='"
								+ articleVO.getPwYN() + "'");

			} else if (productId.equals("") && pwYN.equals("N")) {
				selectOption.put("value", "id='" + articleVO.getId() + "',questionTitle='" + articleVO.getTitle()
						+ "',questionTitle='" + articleVO.getContent() + "',pwYN='" + articleVO.getPwYN() + "'");
			}

		} else if (communityType.equals("notice")) {
			selectOption.put("communityNum", "noticeNum='" + communityNum + "'");
			selectOption.put("value", "id='" + articleVO.getId() + "',noticeTitle='" + articleVO.getTitle()
					+ "',noticeContent='" + articleVO.getContent() + "'");

		} else if (communityType.equals("event")) {
			selectOption.put("communityNum", "eventNum='" + communityNum + "'");
			selectOption.put("value", "id='" + articleVO.getId() + "',eventTitle='" + articleVO.getTitle()
					+ "',eventContent='" + articleVO.getContent() + "'");

		} else if (communityType.equals("review")) {
			selectOption.put("communityNum", "reviewNum='" + communityNum + "'");
			selectOption.put("value", "id='" + articleVO.getId() + "',productId='" + articleVO.getProductId()
					+ "',reviewTitle='" + articleVO.getTitle() + "',reviewContent='" + articleVO.getContent() + "'");

		}

		result = boardService.updateArticle(selectOption);

		if (result == 0) {
			mav.addObject("joinMas", "실패 하였습니다. 잠시후에 시도해 주시면 감사하겠습니다.");
		} else {
			mav.addObject("joinMas", "수정되었습니다.");
		}

		mav.addObject("member", member);
		mav.addObject("communityType", communityType);
		mav.setViewName("redirect:/community.do");

		return mav;
	}

	// 커뮤니티 삭제
	@RequestMapping(value = "/community/delete.do", method = RequestMethod.GET)
	public ModelAndView communityDelete(@RequestParam(value = "communityType") String communityType,
			@RequestParam(value = "communityNum") String communityNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		PageMaker pageMaker = new PageMaker();
		int result = 0;

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);

		if (communityType.equals("qna")) {

			selectOption.put("communityNum", "questionNum='" + communityNum + "'");
			selectOption.put("QnANum", communityNum);

		} else if (communityType.equals("notice")) {

			selectOption.put("communityNum", "noticeNum='" + communityNum + "'");

		} else if (communityType.equals("event")) {

			selectOption.put("communityNum", "eventNum='" + communityNum + "'");

		} else if (communityType.equals("review")) {

			selectOption.put("communityNum", "reviewNum='" + communityNum + "'");

		}

		result = boardService.deleteArticle(selectOption);

		if (result == 0) {
			mav.addObject("joinMas", "실패 하였습니다. 잠시후에 시도해 주시면 감사하겠습니다.");
		} else {
			mav.addObject("joinMas", "삭제되었습니다.");
		}

		mav.addObject("member", member);
		mav.addObject("communityType", communityType);
		mav.setViewName("redirect:/community.do");

		return mav;
	}

	// 게시물 비번체크
	@RequestMapping(value = "/communityChk.do", method = RequestMethod.POST)
	public ModelAndView communityChk(@RequestParam(value = "communityNum") String communityNum,
			@RequestParam(value = "communityType") String communityType, @RequestParam(value = "pw") String pw,
			HttpServletRequest request, HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		Map<String, Object> selectOption = new HashMap<String, Object>();
		selectOption.put("type", communityType);
		ArticleVO2 community = new ArticleVO2();

		selectOption.put("communityNum", "questionNum='" + communityNum + "'");
		selectOption.put("value",
				"questionNum AS num, id AS id, productId AS productId, questionTitle AS title, questionContent AS content, questionHits AS hits, questionPw AS questionPw, pwYN AS pwYN");

		selectOption.put("hitsChk", "hitsChk");
		community = boardService.selectCommunity(selectOption);

		String communitypw = community.getQuestionPw();
		List<Map<String, Object>> commentList = new ArrayList<Map<String, Object>>();
		Map<String, Object> paramMap = new HashMap<String, Object>();

		if (communitypw.equals(pw)) {
			mav.addObject("community", community);
			mav.setViewName("communityDerail");

			mav.addObject("pageTitle", "QnA");
			mav.setViewName("communityDerail");

			paramMap.put("qnANum", communityNum);
			commentList = boardService.selectComment(paramMap);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("page", cri.getPage());
			mav.addObject("communityType", communityType);
			mav.addObject("community", community);
			mav.addObject("member", member);
			mav.addObject("commentList", commentList);

		} else {
			mav.addObject("joinMas", "비밀번호가 틀렸습니다.");
			mav.setViewName("redirect:/community.do?communityType=" + communityType);
		}

		return mav;
	}

	// 댓글 추가
	@RequestMapping(value = "/communityDerail/commentAdd.do", method = RequestMethod.POST)
	public ResponseEntity commentAdd(@RequestParam(value = "id") String id,
			@RequestParam(value = "qnANum") String qnANum,
			@RequestParam(value = "commentContent") String commentContent, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ResponseEntity resEntity = null;
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("qnANum", qnANum);
		paramMap.put("commentContent", commentContent);

		List<Map<String, Object>> commentList = new ArrayList<Map<String, Object>>();

		commentList = boardService.commentList(paramMap);

		resEntity = new ResponseEntity(commentList, HttpStatus.OK);
		return resEntity;
	}

	// 댓글 삭제
	@RequestMapping(value = "/communityDerail/commentDelete.do", method = RequestMethod.POST)
	public ResponseEntity commentDelete(@RequestParam(value = "num") String num,
			@RequestParam(value = "qnANum") String qnANum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ResponseEntity resEntity = null;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("qnANum", qnANum);

		List<Map<String, Object>> commentList = new ArrayList<Map<String, Object>>();

		commentList = boardService.DelectComment(paramMap);

		resEntity = new ResponseEntity(commentList, HttpStatus.OK);
		return resEntity;
	}

	// 로그인 상테 체크 (ModelAndView, 세션정보, 접속할 화면 )
	private ModelAndView loginChk(ModelAndView mav, MemberVO sessinLogin, String view) throws Exception {
		if (sessinLogin != null) {
			mav.setViewName(view);
			return mav;
		} else {
			mav.addObject("joinMas", "잘못된 경로로 접속하셨습니다.");
			mav.setViewName("redirect:/main.do");
			return mav;
		}
	}

	// 관리자 세션 체크 (ModelAndView, 세션정보, 접속할 화면 )
	private ModelAndView sessionChk(ModelAndView mav, MemberVO sessinLogin, String view) throws Exception {
		if (sessinLogin != null) {
			String rightChk = (String) sessinLogin.getMasterYN();
			if (rightChk.equals("M")) {
				mav.addObject("member", sessinLogin);
				mav.setViewName(view);
				return mav;
			} else {
				mav.addObject("joinMas", "잘못된 경로로 접속하셨습니다.");
				mav.setViewName("redirect:/main.do");
				return mav;
			}
		} else {
			mav.addObject("joinMas", "잘못된 경로로 접속하셨습니다.");
			mav.setViewName("redirect:/main.do");
			return mav;
		}
	}

}
