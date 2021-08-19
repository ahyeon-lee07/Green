package com.pro.green.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	//파일 저장 위치
	private static String CURR_IMAGE_REPO_PATH = "C:\\upload\\green";
	
	@RequestMapping("/download")
	protected void download(@RequestParam("imageFileName") String imageFilename, //다운로드할 이미지 파일 이름 전달
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFilename;
		
		//파일 객체를 생성합니다.
		File image = new File(downFile);
		
		//확장자를 제외한 원본 이미지 파일의 이름을 가져온다.
		int lastIndex = imageFilename.lastIndexOf(".");
		String fileName = imageFilename.substring(0, lastIndex);
		
		//원본 이미지 파일 이름과 같은 이름의 썸네일 파일에 대한 File 객체 생성
		File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "thumbnail" + "\\" + fileName + ".png");
		
		//원본 이미지 파일을 가로게로가 50픽셀인 png 형식의 썸네일 이미지 파일 생성
		if(image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumbnail);
		}
		
		
		//생성된 썸네일 파일을 브라우저로 전송
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
			break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
		
	}
	
}
