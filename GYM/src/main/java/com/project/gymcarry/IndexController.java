package com.project.gymcarry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.gymcarry.carry.service.CarryInfoService;

@Controller
public class IndexController {
	
	@Autowired
	private CarryInfoService carryInfoService;

	@RequestMapping("/index")
	public void index(Model model) throws Exception {
		// 메인화면 캐리 리뷰 뿌려줄 select
		List<Map<String, Object>> selectReviewList = carryInfoService.selectReviewList();
		model.addAttribute("review", selectReviewList);
	}

	@RequestMapping("/")
	public String index1() {
		return "redirect:/index";
	}

}
