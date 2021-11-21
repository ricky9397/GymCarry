package com.project.gymcarry.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.gymcarry.board.service.BoardService;


@Controller
@RequestMapping
public class CommWriteController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("community/write")
	public String writeView() {
		System.out.println("글쓰기 진입");
		return "community/commWrite";
	}
	
	// 글 작성
	@PostMapping("community/write")
	public String boardWrite(HttpServletRequest request) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("postname", request.getParameter("postname"));
		map.put("postcontent", request.getParameter("postcontent"));
		map.put("postnick", request.getParameter("postnick"));
		map.put("memidx", request.getParameter("memidx"));
		map.put("boardcategory", request.getParameter("boardcategory"));
		
		System.out.println(map.toString());
		boardService.getBoardWrite(map);
		
		
		return "redirect:/community/boardList";
	}
	

	
	
}
