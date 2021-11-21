package com.project.gymcarry.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.MemberJoinDto;
import com.project.gymcarry.member.service.JoinService;
import com.project.gymcarry.member.service.MailSenderService;

@Controller
public class JoinController {

	@Autowired
	JoinService joinservice;
	@Autowired
	private MailSenderService mailsenderservice;

	@GetMapping("member/join")
	public String memberJoinForm() {
		return "member/joinForm";
	}

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@PostMapping("member/join")
	public String memberJoin(@ModelAttribute MemberJoinDto memberDto, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		// 암호 확인
		System.out.println("첫번째 암호 : " + memberDto.getMempw());
		// 비밀번호 암호화(SHA256)
		String encryPassword = SHA256.encrypt(memberDto.getMempw());
		memberDto.setMempw(encryPassword);
		System.out.println("두번째 : " + memberDto.getMempw());

		// 멤버 회원가입 성공
		System.out.println("입력 정보 : " + memberDto.toString());
		int result = joinservice.memberJoin(memberDto, response, request);
		if (result == 1) {
			System.out.println("멤버 회원가입 성공");
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 인증메일 보내기 메소드
		String result2 = mailsenderservice.send_mail(memberDto.getMememail(), memberDto.getMemname());
		if (result2 != null) {
			System.out.println("이메일 보내기 성공");
			System.out.println("memberDto.getMememail = " + memberDto.getMememail());
		}

		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다. 인증메일을 확인해주세요!'); location.href='http://3.144.47.221:8080/gym/index';");
		out.println("</script>");
		out.close();
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "member/join/alterjoinkey", method = RequestMethod.POST)
	public String alterjoinkey_Check(@ModelAttribute MemberDto memberDto) {
		mailsenderservice.alterjoinkey_service(memberDto.getMememail(), memberDto.getJoinkey());
		System.out.println("조인키 서비스!");
		System.out.println("mememail=" + memberDto.getMememail());
		System.out.println("joinkey=" + memberDto.getJoinkey());

		return "redirect:/index";
	}
}

