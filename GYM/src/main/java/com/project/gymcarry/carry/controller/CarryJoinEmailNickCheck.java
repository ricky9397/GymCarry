package com.project.gymcarry.carry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.gymcarry.member.service.JoinService;

@RestController
public class CarryJoinEmailNickCheck {

	@Autowired
	JoinService joinservice;

	// 캐리이메일 중복 체크 ajax
	@PostMapping("/carry/emailCheck")
	public int carryEmailCheck(@RequestParam("cremail") String cremail) throws Exception {
		return joinservice.carryemailCheck(cremail);
	}

	// 캐리닉네임 중복체크 ajax
	@PostMapping("/carry/nickCheck")
	public int carryNickCheck(@RequestParam("crnick") String crNick) throws Exception {
		return joinservice.carryNickCheck(crNick);
	}
	
	// 캐리 핸드폰 번호 중복체크 ajax
	@PostMapping("/carry/phoneCheck")
	public int carryPhoneCheck(@RequestParam("crphone") String crphone) throws Exception {
		return joinservice.carryPhoneCheck(crphone);
	}

}
