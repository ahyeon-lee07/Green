package com.pro.green.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FileUploadController {
	//파일 저장 위치
	private static final String CURR_IMAGE_REPO_PATH = "C:\\upload\\green";
	
	@RequestMapping(value = "/form")
	public String form() {
		return "uploadForm";		//업로드 창인 uploadForm.jsp를 반환
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,
								HttpServletRequest response) throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		Map map = new HashMap();	//매개변수 정보와 파일 정보를 저장할 Map을 생성
		Enumeration enu = multipartRequest.getParameterNames();
		
		//전송된 매개변수 값을 key/value로 map에 저장
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		//파일을 업로드한 후 반환된 파일 이름이 저장된 FileList를 다시 map에 저장
		List fileList = fileProcess(multipartRequest);
		map.put("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		//mao을 결과창으로 포워딩
		mav.addObject("map", map);
		mav.setViewName("result");
		return mav;
	}


	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		//첨부된 파일 이름을 가져옵니다.
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String FileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(FileName);	//파일 이름에 대한 MultipartFile 객체를 가져옴
			String originalFileName = mFile.getOriginalFilename();		//실제 파일 이름을 가져옴
			fileList.add(originalFileName);		//파일 이름을 하나씩 fileList에 저장
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + FileName);
			if(mFile.getSize() != 0) {	//첨부된 파일이 있는지 체크
				//경로에 파일이 없으면 그 경로에 해당하는 디렉토리를 만든 후 파일 생성
				if(! file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));	//임시로 저장된 mutipartFile을 실제 파일로 전송
			}
			
		}
		return fileList;
	}
	
}
