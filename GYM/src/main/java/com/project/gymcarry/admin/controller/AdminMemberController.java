package com.project.gymcarry.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.admin.service.AdminService;
import com.project.gymcarry.member.MemberListDto;

@Controller
@RequestMapping
public class AdminMemberController {

		@Autowired
		private AdminService adminService;
		
		
		// 회원 관리 : 전체 회원 리스트 출력
		@GetMapping("admin/member")
		public String memberSetting(
				Model model) {
			
			List<MemberListDto> memList = adminService.allMemberList();
			model.addAttribute("memList", memList);
			
			System.out.println("회원 관리 : 전체 회원 리스트 출력");
			
			return "admin/memberSetting";
		}
		
		
		// 회원 탈퇴 처리
		@GetMapping("admin/deleteMember")
		public void memberDelete(
				@RequestParam("memidx") int memidx,
				Model model) {
			
			adminService.deleteMember(memidx);
		}
		
	
}
