package com.project.gymcarry.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.gymcarry.member.service.JoinService;

@RestController
public class JoinEmailNickCheck {

	@Autowired
	JoinService joinservice;

	// 멤버 이메일 중복 체크 ajax
	@PostMapping("/member/emailCheck")
	public int emailCheck(@RequestParam("mememail") String mememail) throws Exception {
		return joinservice.memberemailCheck(mememail);
	}

	// 멤버 닉네임 중복ajax
	@PostMapping("/member/nickCheck")
	public int nickCheck(@RequestParam("memnick") String memNick) throws Exception {
		return joinservice.memberNickCheck(memNick);
	}

	// 멤버 핸드폰 번호 중복ajax
	@PostMapping("/member/phoneCheck")
	public int phoneCheck(@RequestParam("memphone") String memphone) throws Exception {
		return joinservice.memberPhoneCheck(memphone);
	}
}
