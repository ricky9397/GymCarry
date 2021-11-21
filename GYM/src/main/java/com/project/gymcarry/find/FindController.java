package com.project.gymcarry.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.gymcarry.find.service.FindService;
import com.project.gymcarry.member.service.MailSenderService;

@Controller
@RequestMapping(value = "/find")
public class FindController {

	@Autowired
	FindService service;
	@Autowired
	private MailSenderService mailsender;
	
	// 멤버 아이디 찾기 컨트롤러
	@GetMapping("/findid")
	public String findmemberid() {
		return "find/findid";
	}
	
	@RequestMapping(value="/findid", method=RequestMethod.POST)
	public String findmemberid(
			HttpServletResponse response, 
			@RequestParam("memname") String memname,
			@RequestParam("memphone") String memphone,
			Model md
			) throws IOException {
		md.addAttribute("mememail", service.findid(response, memname, memphone));
		System.out.println("컨트롤러 : 아이디찾기 페이지 진입");
		System.out.println("memname : " + memname);
		System.out.println("memphone : " + memphone);
			
		return "find/findid_view";
	}


	// 캐리 아이디 찾기 컨트롤러
	@GetMapping("/findcarryid")
	public String findcarryid() {
		return "find/findcarryid";
	}
	
	@RequestMapping(value="/findcarryid", method=RequestMethod.POST)
	public String findcarryid(
			HttpServletResponse response, 
			@RequestParam("crname") String crname,
			@RequestParam("crphone") String crphone,
			Model md
			) throws IOException {
		md.addAttribute("cremail", service.findcarryid(response, crname, crphone));
		System.out.println("컨트롤러 : 캐리 아이디찾기 페이지 진입");
		System.out.println("crname : " + crname);
		System.out.println("crphone : " + crphone);
			
		return "find/findcarryid_view";
	}
	
	// 멤버 비밀번호 찾기 컨트롤러
	@GetMapping("/findpassword")
	public String findpassword() {
		return "find/findpassword";
	}
	
	@RequestMapping(value="/findpassword", method = RequestMethod.POST)
	public String findPassword(
			HttpServletResponse response, 
			@RequestParam("memname") String memname,
			@RequestParam("mememail") String mememail
			) throws IOException {
		// 1. 이름 핸드폰번호로 조회
		String email = service.findPassword(response, memname, mememail);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (email == null) {
			out.println("<script>");
			out.println("alert('가입된 계정이 없습니다.'); location.href='/gym/find/findpassword';");
			out.println("</script>");
			out.close();
		} else {
			// 2. 난수 생성 후 존재하는 데이터 있으면 메일 보냄
			mailsender.send_pwemail(memname, mememail);
			
			out.println("<script>");
			out.println("alert('가입하신 이메일로 임시 비밀번호가 전송되었습니다.'); location.href='/gym/member/login';");
			out.println("</script>");
			out.close();
		}

		// 3. 메일 성공 시, 난수로 비밀 번호 업데이트 
		System.out.println("컨트롤러 : 비밀번호 찾기 페이지 진입");
		System.out.println("memname : " + memname);
		System.out.println("mememail : " + mememail);
		
		return "/find/findpassword";
	}
	
	// 캐리 비밀번호 찾기 컨트롤러
		@GetMapping("/findcarrypassword")
		public String findcarrypassword() {
			return "find/findcarrypassword";
		}
		
		@RequestMapping(value="/findcarrypassword", method = RequestMethod.POST)
		public String findCarryPassword(
				HttpServletResponse response, 
				@RequestParam("crname") String crname,
				@RequestParam("cremail") String cremail
				) throws IOException {
			// 1. 이름 핸드폰번호로 조회
			String email = service.findCarryPassword(response, crname, cremail);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (email == null) {
				out.println("<script>");
				out.println("alert('가입된 계정이 없습니다.'); location.href='/gym/find/findcarrypassword';");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			} else {
				// 2. 난수 생성 후 존재하는 데이터 있으면 메일 보냄
				mailsender.send_Crpwemail(crname, cremail);
				
				out.println("<script>");
				out.println("alert('가입하신 이메일로 임시 비밀번호가 전송되었습니다.'); location.href='/gym/carry/login';");
				out.println("</script>");
				out.close();
			}

			// 3. 메일 성공 시, 난수로 비밀 번호 업데이트 
			System.out.println("컨트롤러 : 비밀번호 찾기 페이지 진입");
			System.out.println("crname : " + crname);
			System.out.println("cremail : " + cremail);
			
			return "/find/findcarrypassword";
		}
	
	
	
}
