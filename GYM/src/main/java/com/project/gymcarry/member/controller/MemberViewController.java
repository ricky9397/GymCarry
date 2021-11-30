package com.project.gymcarry.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.gymcarry.tiles.Const;

@Controller
@RequestMapping("/member")
public class MemberViewController {
	
	@GetMapping("/login.do")
	public String loginForm() {
		return "loginForm." + Const.MAIN;
	}
	
	@GetMapping("join.do")
	public String memberJoinForm() {
		return "member/joinForm";
	}
}
