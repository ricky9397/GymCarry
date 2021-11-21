package com.project.gymcarry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.gymcarry.carry.CarryReviewDto;
import com.project.gymcarry.carry.service.CarryInfoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@Autowired
	private CarryInfoService carryInfoService;

	@RequestMapping("/index")
	public void index(Model model) {
		
		List<CarryReviewDto> carryReviewListAll = carryInfoService.getCarryReviewListAll();
		model.addAttribute("review", carryReviewListAll);
	}

	@RequestMapping("/")
	public String index1() {
		System.out.println("진이이이입");
		return "redirect:/index";
	}

}
