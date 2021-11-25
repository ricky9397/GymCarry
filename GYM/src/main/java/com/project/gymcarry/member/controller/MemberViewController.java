package com.project.gymcarry.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberViewController {
	
	@GetMapping("member/login")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@GetMapping("member/join")
	public String memberJoinForm() {
		return "member/joinForm";
	}
}
