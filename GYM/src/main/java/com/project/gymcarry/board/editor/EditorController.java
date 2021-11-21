package com.project.gymcarry.board.editor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping
public class EditorController {

	// @Resource(name="uploadPath") private String uploadPath;

	@RequestMapping(value = "/adm/fileupload", method = RequestMethod.POST)
	@ResponseBody
	public void photoUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload, HttpSession session) throws Exception {
		
		String uploadPath = session.getServletContext().getRealPath("/resources/");
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID(); 
		
		OutputStream out = null; 
		PrintWriter printWriter = null; 
		
		// 인코딩 
		res.setCharacterEncoding("utf-8"); 
		res.setContentType("text/html;charset=utf-8"); 
		
		try { 
			
			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes(); 
			
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName; 
			
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
			
			
			String callback = req.getParameter("CKEditorFuncNum"); 
			printWriter = res.getWriter(); 
			String fileUrl =  "/gym/resources/ckUpload/" + uid + "_" + fileName; // 작성화면 
			//String fileUrl = "/ckUpload/" + uid + "&fileName=" + fileName; // 작성화면 
		
			// 업로드시 메시지 출력 
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
			printWriter.flush(); 
			
			} catch (IOException e) { 
				e.printStackTrace(); 
			} finally { 
				try { 
					if(out != null) { 
						out.close(); 
					} 
					if(printWriter != null) { 
						printWriter.close(); 
					} 
				} catch(IOException e) { 
					e.printStackTrace(); 
				} 
			} 
			return;
	}

	
	
	
	
	
	
	
	
	
}
