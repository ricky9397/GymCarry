package com.project.gymcarry.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.project.gymcarry.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.board.BoardWriteDto;

@Controller
@RequestMapping
public class CommUpdateController {

	@Autowired
	private BoardService boardService;
	
	// 게시물 수정 페이지로 이동
	@GetMapping("community/update")
	public String updateView (
			@RequestParam("postidx") int postidx,
			Model model
			) throws Exception {
		System.out.println(postidx);
		BoardWriteDto update = boardService.getBoardUpdate(postidx);
		model.addAttribute("update", update);
		
		return "community/commUpdate";
	}
	
	// 게시물 수정 완료
	@PostMapping("community/update")
	public String BoardUpdate(
			@RequestParam("postidx") int postidx,
			HttpServletRequest request
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postname", request.getParameter("postname"));
		map.put("postcontent", request.getParameter("postcontent"));
		map.put("boardcategory", request.getParameter("boardcategory"));
		map.put("postidx", postidx);
		
		
		System.out.println(map.toString());
		boardService.getBoardContent(map);
		
		return "redirect:/community/postContent?postidx=" + postidx;
		
	}
	
	

	
	
}
