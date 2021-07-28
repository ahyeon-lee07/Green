package com.pro.green.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.green.board.service.BoardService;
import com.pro.green.board.vo.ArticleVO;
import com.pro.green.board.vo.ImageVO;
import com.pro.green.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	// 공지사항 목록
	@Override
	@RequestMapping(value = "/listNotice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> listNotice = boardService.listNotice();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("listNotice", listNotice);
		return mav;
	}

	// 공지사항 상세페이지
	@RequestMapping(value = "/viewNotice.do", method = RequestMethod.GET)
	public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		articleVO = boardService.viewNotice(noticeNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("viewNotice", articleVO);
		return mav;
	}

	// 공지사항 글쓰기
	@Override
	@RequestMapping(value = "/addNewNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("noticeNum", 0);
		articleMap.put("id", id);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int noticeNum = boardService.addNewNotice(articleMap); // 글 정보가 저장된 articleMap을 Service 클래스의 addArticle()
																	// 메서드로 전달한다.
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/listNotice.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); // 새 글을 추가한 후 메시지를 전달한다.
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/addNewNotice.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); // 오류 발생 시 오류 메시지를 전달한다.
			e.printStackTrace();
		}
		return resEnt;
	}

	// 글쓰기창
	@RequestMapping(value = "/board/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 공지사항 수정
	@RequestMapping(value = "/modNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		String noticeNum = (String) articleMap.get("noticeNum");
		articleMap.put("noticeNum", noticeNum);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modNotice(articleMap);

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/viewNotice.do?noticeNum=" + noticeNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?noticeNum="
					+ noticeNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	// 공지사항 삭제
	@Override
	@RequestMapping(value = "/removeNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeNotice(noticeNum);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/listNotice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/viewNotice.do?noticeNum=" + noticeNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 이벤트 게시판 글 목록
	@Override
	@RequestMapping(value = "/eventList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List<ArticleVO> eventList = boardService.eventList(); // 모든 글 정보 조회
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("eventList", eventList);
		return mav;

	}

	// 이벤트 게시판 글 상세페이지
	@RequestMapping(value = "/eventView.do", method = RequestMethod.GET)
	public ModelAndView eventView(@RequestParam("eventNum") int eventNum,
				 HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		Map articleMap = boardService.eventView(eventNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articleMap", articleMap);
		return mav;
	}
	
	
	// 이벤트 게시판 글쓰기 창
	@RequestMapping(value = "/eventWrite.do", method = RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 이벤트 게시판 글 추가
	@Override
	@RequestMapping(value = "/addNewEvent.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewEvent(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}

		HttpSession session = multipartRequest.getSession(); // 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("id",id);
		articleMap.put("eventNum", 0);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int eventNum = boardService.addNewEvent(articleMap);
			message = "<script>";
			message += "alert('새 글을 추가했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/eventList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');');";
			message += "location.href='"+multipartRequest.getContextPath()+"/addNewEvent.do';";
			message +="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
			return resEnt;
	}

	// 이벤트 게시판 글 수정
	@RequestMapping(value = "/modEvent.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("id", id);
		String eventNum = (String) articleMap.get("eventNum");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modEvent(articleMap);

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/eventList.do?eventNum=" + eventNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/eventView.do?eventNum="
					+ eventNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
		
	// 이벤트 게시판 글 삭제
	@Override
	@RequestMapping(value = "/removeEvent.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeEvent(@RequestParam("eventNum") int eventNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeEvent(eventNum);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/eventList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/eventView.do?eventNum=" + eventNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// Q&A 목록
	@Override
	@RequestMapping(value = "/listQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> listQnA = boardService.listQnA();
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName("listQnA");
		mav.addObject("listQnA", listQnA);
		System.out.println(listQnA);
		return mav;
	}

	// Q&A 상세페이지
	@RequestMapping(value = "/viewQnA.do", method = RequestMethod.GET)
	public ModelAndView viewQnA(@RequestParam("questionNum") int questionNum, HttpServletRequest request,
	        HttpServletResponse response) throws Exception {
	    String viewName = (String) request.getAttribute("viewName");
	    articleVO = boardService.viewQnA(questionNum);
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName(viewName);
	    mav.addObject("viewQnA", articleVO);
	    return mav;
	}
	
	// Q&A 글 추가
	@Override
	@RequestMapping(value = "/addNewQnA.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewQnA(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
			
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}

		HttpSession session = multipartRequest.getSession(); // 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("id",id);
		articleMap.put("questionNum", 0);
			
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int eventNum = boardService.addNewQnA(articleMap);
			message = "<script>";
			message += "alert('새 글을 추가했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/listQnA.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');');";
			message += "location.href='"+multipartRequest.getContextPath()+"/addNewQnA.do';";
			message +="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
			return resEnt;
	}

	// Q&A 수정
	@RequestMapping(value = "/modQnA.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modQnA(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		String questionNum = (String) articleMap.get("questionNum");
		articleMap.put("questionNum", questionNum);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modQnA(articleMap);

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/viewQnA.do?questionNum=" + questionNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/viewQnA.do?questionNum="
					+ questionNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
		
	// Q&A 삭제
	@Override
	@RequestMapping(value = "/removeQnA.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeQnA(@RequestParam("questionNum") int questionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeQnA(questionNum);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/listQnA.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/viewQnA.do?questionNum=" + questionNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// Review 목록
	@Override
	@RequestMapping(value = "/listReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> listReview = boardService.listReview();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("listReview", listReview);
		System.out.println(listReview);
		return mav;
	}

	// Review 상세페이지
	@RequestMapping(value = "/viewReview.do", method = RequestMethod.GET)
	public ModelAndView viewReview(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		articleVO = boardService.viewReview(reviewNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("viewReview", articleVO);
		return mav;
	}

	// Review 글쓰기
	@Override
	@RequestMapping(value = "/addNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("reviewNum", 0);
		articleMap.put("id", id);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int reviewNum = boardService.addNewReview(articleMap);
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/listReview.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/addNewReview.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// Review 수정
	@RequestMapping(value = "/modReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String reviewNum = (String) articleMap.get("reviewNum");
		articleMap.put("reviewNum", reviewNum);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modReview(articleMap);
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/viewReview.do?reviewNum=" + reviewNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/viewReview.do?reviewNum=" + reviewNum
					+ "';";

			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	// Review 삭제
	@Override
	@RequestMapping(value = "/removeReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeReview(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeReview(reviewNum);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/listReview.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/viewReview.do?reviewNum=" + reviewNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

}
