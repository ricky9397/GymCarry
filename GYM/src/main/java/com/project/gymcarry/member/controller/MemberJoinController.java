package com.project.gymcarry.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.gymcarry.common.CommPhotoVO;
import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.MemberVO;
import com.project.gymcarry.member.service.MemberService;

@Controller
public class MemberJoinController {

	@Autowired
	private MemberService memberService;

//	@Autowired
//	private MailSenderService mailsenderservice;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private CommPhotoVO commPhotoVO;
	
	@GetMapping("member/join")
	public String memberJoinForm() {
		return "member/joinForm";
	}

	@PostMapping("member/join")
	@ResponseBody
	public String memberJoin(MemberVO member,@RequestParam("memPhoto") CommPhotoVO photo, HttpServletRequest request) throws Exception {
		
		member.setMemPhoto(photo.getMemPhoto().getOriginalFilename());
		
		// 비밀번호 암호화(SHA256)
		String encryPassword = SHA256.encrypt(member.getMemPw());
		member.setMemPw(encryPassword);

		// 멤버 회원가입 성공
		int result = memberService.insertMemberJoin(member, request);

		// 인증메일 보내기 메소드
		// String result2 = mailsenderservice.send_mail(member.getMemEmail(),
		// memberDto.getMemname());

		return "ok";
	}

//	@RequestMapping(value = "member/join/alterjoinkey", method = RequestMethod.POST)
//	public String alterjoinkey_Check(@ModelAttribute MemberDto memberDto) {
//		mailsenderservice.alterjoinkey_service(memberDto.getMememail(), memberDto.getJoinkey());
//		return "redirect:/index";
//	}
}
