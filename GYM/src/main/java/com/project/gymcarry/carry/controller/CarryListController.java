package com.project.gymcarry.carry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.carry.service.CarryInfoService;

@Controller
@RequestMapping
public class CarryListController {

	@Autowired
	private CarryInfoService carryInfoService;

	// 전체 캐리 리스트 출력 (nav - 1:1 MATCHING 클릭시 이동)
	@GetMapping("carry/allList")
	public String allCarryList(Model model) {
		List<CarryListDto> alist = carryInfoService.getAllCarryList();
		model.addAttribute("allList", alist);
		System.out.println("allList == " + alist);
		System.out.println("전체 캐리 리스트 출력");
		
		return "carry/allCarryList";
	}
	
	/*
	 * // 전체 캐리 리스트 출력 (nav - 1:1 MATCHING 클릭시 이동)
	 * 
	 * @GetMapping("carry/allListP") public String allCarryListP(Model model) {
	 * List<CarryListDto> alist = carryInfoService.getAllCarryListP();
	 * model.addAttribute("allList", alist);
	 * 
	 * System.out.println("전체 캐리 리스트 출력");
	 * 
	 * return "carry/allCarryList"; }
	 */
	
	
	// 매칭된 캐리 리스트 출력 (설문 조사 후 출력되는 리스트)
	@GetMapping("carry/matchingList")
	public String matchingCarryList(
			@RequestParam("sv1") String sv1,
			@RequestParam("sv2") String sv2,
			@RequestParam("sv3") String sv3,
			Model model
			) {
		
		// 1차 필터 : 성별 (여)
		if (sv3.equals("여자")) {
			
			// 2차 필터 : 운동 종목  
			if(sv1.equals("헬스")) {
				List<CarryListDto> mlist = carryInfoService.getCarryListFH();
				model.addAttribute("matchingList", mlist);
				System.out.println("[여자/헬스] 캐리 리스트 출력");
			} else if (sv1.equals("필라테스")) {
				List<CarryListDto> mlist = carryInfoService.getCarryListFF();
				model.addAttribute("matchingList", mlist);
				System.out.println("[여자/필라테스] 캐리 리스트 출력");
			} else {
				List<CarryListDto> mlist = carryInfoService.getCarryListFY();
				model.addAttribute("matchingList", mlist);
				System.out.println("[여자/요가] 캐리 리스트 출력");
			}
			
		// 1차 필터 : 성별 (남)
		} else {
			
			// 2차 필터 : 운동 종목
			if(sv1.equals("헬스")) {
				List<CarryListDto> mlist = carryInfoService.getCarryListMH();
				model.addAttribute("matchingList", mlist);
				System.out.println("[남자/헬스] 캐리 리스트 출력");
			} else if (sv1.equals("필라테스")) {
				List<CarryListDto> mlist = carryInfoService.getCarryListMF();
				model.addAttribute("matchingList", mlist);
				System.out.println("[남자/필라테스] 캐리 리스트 출력");
			} else {
				List<CarryListDto> mlist = carryInfoService.getCarryListMY();
				model.addAttribute("matchingList", mlist);
				System.out.println("[남자/요가] 캐리 리스트 출력");
			}
		
		}
		return "carry/matchingCarryList";
	}
	
	
}