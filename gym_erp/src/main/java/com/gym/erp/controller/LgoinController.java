package com.gym.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gym.erp.contest.controller.Const;

@Controller
@RequestMapping("/auth")
public class LgoinController extends Const {
	
	
	@RequestMapping(value = "/login.do")
	public String login() {
		return "/auth/login" + AUTH_TILES;
	}
	
	
	
	
}
