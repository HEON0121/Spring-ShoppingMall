package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.controller.UploadController.UploadPath;
// 사용X
@Controller
public class CkeditorUploadController {
	
	@RequestMapping(value="/imageUpload")
	public void imageUpload(HttpServletRequest request, 
							HttpServletResponse response,
							@RequestParam MultipartFile upload) throws IOException {
		//CKEditor 에서 파일을 넘겨주는 이름이 upload로 설정되어 있으니 반드시 upload로 변수명 지어줄 것!
		
		//헤더 설정 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		OutputStream out = null;
		PrintWriter writer = null;
		
		String fileName = upload.getOriginalFilename(); // 첨부 파일 이름 
		byte[] bytes = upload.getBytes(); // 첨부파일 바이트 배열로 저장하기 
		
		//String uploadPath = "업로드할  디렉토리 경로 " + fileName; // 물리적 실제 저장소 
		String uploadPath = UploadPath.path(request) + fileName;
		
		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes); // 서버에 파일 업로드 
		
		String callback = request.getParameter("CKEditorFuncNum");
		
		writer = response.getWriter();
		//url 상에서 볼 수 잇는 이미지경로
		// String fileUrl = request.getContextPath()+ " /upload/" + fileName;
		
		String fileUrl = "/resources/upload/" + fileName;
		
		String script = "<script> window.parent.CKEDITOR.tools.callFunction(";
		script += callback;
		script += ", '";
		script += fileUrl;
		script += "' , '이미지를 업로드 했습니다.'";
		script += ") </script>";
		
		writer.println(script);
		writer.flush();
	}
}
	