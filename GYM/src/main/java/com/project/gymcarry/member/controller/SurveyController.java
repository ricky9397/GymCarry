package com.project.gymcarry.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping
public class SurveyController {

	// 설문조사 1번 문항
	@GetMapping("survey/survey")
	public String survey1() {
		return "survey/surveyForm1";
	}


	// 설문조사 2번 문항
	@PostMapping("survey/survey2")
	public String survey2(
			@RequestParam("sv1") String sv1,
			Model model
	) {
		model.addAttribute("sv1", sv1);
		return "survey/surveyForm2";
	}


	// 설문조사 3번 문항
	@PostMapping("survey/survey3")
	public String survey3(
			@RequestParam("sv1") String sv1,
			@RequestParam("sv2") String sv2,
			Model model
	) {
		model.addAttribute("sv1", sv1);
		model.addAttribute("sv2", sv2);
		return "survey/surveyForm3";
	}


	// 설문조사 4번 문항
	@PostMapping("survey/survey4")
	public String survey4(
			@RequestParam("sv1") String sv1,
			@RequestParam("sv2") String sv2,
			@RequestParam("sv3") String sv3,
			Model model
	) {
		model.addAttribute("sv1", sv1);
		model.addAttribute("sv2", sv2);
		model.addAttribute("sv3", sv3);
		return "survey/surveyForm4";
	}


	// 설문조사 5번 문항
	@PostMapping("survey/survey5")
	public String survey5(
			@RequestParam("sv1") String sv1,
			@RequestParam("sv2") String sv2,
			@RequestParam("sv3") String sv3,
			Model model
	) {
		model.addAttribute("sv1", sv1);
		model.addAttribute("sv2", sv2);
		model.addAttribute("sv3", sv3);

		if (sv3.equals("여자")) {
			System.out.println("-선호하는 캐리의 성별 : 여자");
		} else {
			System.out.println("-선호하는 캐리의 성별 : 남자");
		}

		System.out.println("-운동 종목 : " + sv1);
		System.out.println("-운동 목적 : " + sv2);
		return "survey/surveyForm5";
	}

}