package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

@Controller
public class UploadController {
	public static class UploadPath{
		public static String attach_path = "resources/upload";
		
		public static String path(HttpServletRequest request) {
		String uploadPath = "/";
		try {
		
			String root_path = request.getSession().getServletContext().getRealPath("/");
		
			uploadPath = root_path + attach_path.replace('/','\\');
		
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 경로 다시 확인 해보세요. ");
			
			
		}	return uploadPath;
		}
	}

}
