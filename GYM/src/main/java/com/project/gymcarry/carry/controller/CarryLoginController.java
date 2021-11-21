package com.project.gymcarry.carry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.carry.CarryDto;
import com.project.gymcarry.carry.service.carrySha256;
import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.member.service.LoginService;


@Controller
public class CarryLoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/carry/login")
	public String carryLoginForm() {
		return "carry/carryLoginForm";
	}
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 로그인 세션 저장
	@PostMapping("/carry/carryLogin")
	public String carryLogin(
			@RequestParam("cremail") String id, 
			@RequestParam("crpw") String pw,
			CarryDto carryjoinkeycheck,
			SessionDto carryLogin,
			HttpServletRequest request,
			HttpServletResponse response, 
			HttpSession session) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("캐리 로그인 프로세스 입장>>");
		String password = carrySha256.encrypt(pw);
		System.out.println(password);
		CarryDto carryDto = loginService.carryjoinkeycheck(id, password);
		
		if(carryDto != null) {
		
			if(carryDto.getJoinkey_status().equals("1")) {
				
				SessionDto sessionDto = new SessionDto();
				sessionDto.setCridx(carryDto.getCridx());
				sessionDto.setCrname(carryDto.getCrname());
				sessionDto.setCrnick(carryDto.getCrnick());
				String chatNick = sessionDto.getCrnick();
				
				out.println("<script>");
				out.println("alert('로그인되었습니다!'); location.href='/gym/index';");
				out.println("</script>");
				out.close();
				
				System.out.println("로그인 성공");
				session.setAttribute("loginSession", sessionDto);
				 session.setAttribute("chatSession", chatNick);
				
				System.out.println("sessionDto : " + sessionDto);
				System.out.println("chatNick : " + chatNick);
				
				return "redirect:/index";
				
			} else {
				
				out.println("<script>");
				out.println("alert('[!] 이메일 인증 후 로그인해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				System.out.println("이메일 미인증 상태!");  
			}
			
		} else {
			
			out.println("<script>");
			out.println("alert('[!] 이메일 혹은 비밀번호를 확인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			System.out.println("입력 오류 상태!"); 
			
		}
		
		return "redirect:/index";
	}
		
	
	// 로그아웃 세션 삭제
	@GetMapping("carry/logOut")
	public String carryLogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/index";
	}
	
}



