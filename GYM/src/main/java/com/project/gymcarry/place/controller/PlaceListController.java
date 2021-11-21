package com.project.gymcarry.place.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.service.PlaceService;

@Controller
@RequestMapping
public class PlaceListController {
	
	@Autowired
	private PlaceService placeHealthService;
	
	// 플레이스 전체보기
	@GetMapping("/place/all")
	public String placeList(
				Model model
			) {
		List<PlaceDto> placeAll = placeHealthService.getAllPlaceList();
		model.addAttribute("placeAll", placeAll);
		return "place/placeList";
	}
	
	
	// place 헬스 리스트
	@GetMapping("/place/health")
	public String placeHealthList(
				Model model
			) {
		List<PlaceDto> placeHealthList = placeHealthService.getHealthPlaceList();
		model.addAttribute("placeHealthList", placeHealthList);
		return "place/placeHealthList";
	}
	
	
	// place 필라테스 리스트 
	@GetMapping("/place/pilates")
	public String placePilatesList (
			Model model
			) {
		// 필라테스 업체 리스트
		List<PlaceDto> placePilatesList = placeHealthService.getPilatesPlaceList();
		model.addAttribute("placePilatesList", placePilatesList);
		return "place/placePilatesList";
	}
	
	
	// place 요가 리스트
	@GetMapping("/place/yoga")
	public String placeYogaList(
				Model model
			) {
		List<PlaceDto> placeYogaList = placeHealthService.getYogaPlaceList();
		model.addAttribute("placeYogaList", placeYogaList);
		return "place/placeYogaList";
	}
}
