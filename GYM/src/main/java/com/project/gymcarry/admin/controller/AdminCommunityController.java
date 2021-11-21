package com.project.gymcarry.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.admin.service.AdminContentsService;
import com.project.gymcarry.board.BoardDto;

@Controller
@RequestMapping
public class AdminCommunityController {

		@Autowired
		private AdminContentsService service;
	
	
		// 커뮤니티 게시판 관리페이지로 이동
		@GetMapping("admin/community/list")
		public String adminCommunitySetting(Model model) {
			
			List<BoardDto> CommunityList = service.AdminCommunityList();
			model.addAttribute("CommunityList", CommunityList);
			
			return "admin/communitySetting";
		}
	
		
		// 게시글 삭제
		@GetMapping("admin/community/delete")
		public void deleteContent(
				@RequestParam("postidx") int postidx,
				Model model
				) {
			
			service.deleteCommunity(postidx);
		}
		

		
		
		
		
		
		
}
