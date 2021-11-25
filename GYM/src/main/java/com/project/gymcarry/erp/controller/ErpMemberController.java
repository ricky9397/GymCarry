package com.project.gymcarry.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErpMemberController {
	
	@GetMapping("/erp/member")
	public String erpMember() {
		return "erp/admin_member";
	}
	
	
}
