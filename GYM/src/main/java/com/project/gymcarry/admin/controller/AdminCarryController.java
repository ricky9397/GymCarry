package com.project.gymcarry.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.admin.service.AdminService;
import com.project.gymcarry.carry.CarryListDto2;

@Controller
@RequestMapping
public class AdminCarryController {

		@Autowired
		private AdminService adminService;
		
		// 캐리 관리 : 전체 캐리 리스트 출력
		@GetMapping("admin/carry")
		public String carrySetting(Model model) {
			List<CarryListDto2> carryList = adminService.allCarryList();
			model.addAttribute("carryList", carryList);
			
			System.out.println("캐리 관리 : 전체 캐리 리스트 출력");
			
			return "admin/carrySetting";
		}
		

		// 캐리 탈퇴 처리
		@GetMapping("admin/deleteCarry")
		public String carryDelete(
				@RequestParam("cridx") int cridx,
				Model model) {
			
			adminService.deleteCarry(cridx);
			
			return "redirect:/admin/carry";
		}
		
	
}
