package com.project.gymcarry.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.admin.service.AdminContentsService;
import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.PlaceListDto;

@Controller
@RequestMapping
public class AdminPlaceController {

		@Autowired
		private AdminContentsService adminContentsService;
		
		
		// 전체 플레이스 리스트 출력
		@GetMapping("admin/place")
		public String placeSetting(Model model) {
			List<PlaceListDto> placeList = adminContentsService.allPlaceList();
			model.addAttribute("placeList", placeList);
			
			System.out.println("컨텐츠 관리 : 전체 플레이스 리스트 출력");
			
			return "admin/placeSetting";
		}
		
		
		
		
		// 플레이스 등록 폼 페이지로 이동
		@GetMapping("admin/place/registerForm")
		public String placeReigsterForm() {
			return "admin/placeRegister";
		}
		
		// 플레이스 등록
		@PostMapping("admin/place/register")
		@ResponseBody
		public void placeRegister(
				PlaceDto placeDto,
				HttpServletResponse response,
				Model model) throws IOException {
			
			int result = adminContentsService.registerPlace(placeDto);
			
			if(result == 1) {
				System.out.println("새로운 플레이스 등록 완료");
			}
			
		}
		
		
		
		// 플레이스 수정 페이지로 이동
		@GetMapping("admin/place/modifyForm")
		public String placeModifyForm(
				@RequestParam("placeidx") int placeidx,
				Model model
				) {
			
			PlaceDto original = adminContentsService.getPlaceOriginal(placeidx);
			System.out.println("플레이스 수정 페이지 진입 - 플레이스IDX : " + placeidx);
			model.addAttribute("original", original);
			return "admin/placeModify";
		}
		
		
		// 플레이스 수정
		@PostMapping("admin/place/modify")
		@ResponseBody
		public String placeModify(
				PlaceDto placedto,
				@RequestParam("placeidx") int placeidx,
				Model model
				) throws IOException {
			
			System.out.println(placedto);
			
			
			adminContentsService.updatePlace(placedto);
			System.out.println("플레이스 수정 완료");
			
			return "admin/placeSetting";
		}
		
		
		// 플레이스 삭제
		@GetMapping("admin/deletePlace")
		public void deletePlace(
				@RequestParam("placeidx") int placeidx,
				Model model
				) {
			
			adminContentsService.deletePlace(placeidx);
			System.out.println(placeidx + "번 플레이스 삭제 완료");
			
		}
		
		
		
}
