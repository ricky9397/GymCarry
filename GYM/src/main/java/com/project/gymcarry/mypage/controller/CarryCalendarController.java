package com.project.gymcarry.mypage.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.carry.CarryMypageDto;
import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.mypage.service.MypageService;


@Controller
public class CarryCalendarController {

	@Autowired
	private MypageService mypService;
	
	
	@PostMapping("mypage/schedule")
	// /gym/mypage/schedule
//	@RequestMapping(value = "/mypage/schedule", method = RequestMethod.POST, headers = {"Accept=application/json"})
	@ResponseBody
	public String addCrschedule(HttpSession session, @RequestBody List<CarryMypageDto> request) {
		System.out.println("carrymp : "+ request);
		
		
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");

		session.setAttribute("cridx", sdt.getCridx());
		System.out.println("cridx : " + sdt.getCridx());
		
		for (CarryMypageDto carryMypageDto : request) {
			
			carryMypageDto.setCridx(sdt.getCridx());
			
			System.out.println(carryMypageDto.getTitle());
			System.out.println(carryMypageDto.getAllday());
			System.out.println(carryMypageDto.getStart());
			System.out.println(carryMypageDto.getEnd());
			System.out.println(carryMypageDto.getCridx());
			
		}

		System.out.println("컨트롤러 리퀘스트 : " + request);
		
		System.out.println();
		mypService.carrycalendar(request);
		
//		if(request != null) {
//			mypService.deleteschedule(sdt.getCridx());
//			mypService.carrycalendar(request);
//		}  else {
//			mypService.carrycalendar(request);
//		}
		
		
		return "/mypage/carrymypage";
		
	}
	
	
	@GetMapping("mypage/scheduleview")
	@ResponseBody
	public List<CarryMypageDto> scheduleview(Model model, HttpSession session) {
		
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		
		List<CarryMypageDto> schelist = mypService.scheduleview(sdt.getCridx());
		model.addAttribute("schedulelist", schelist);
		
		System.out.println("캐리 스케줄 출력합니다 : " + schelist);
		
		
		return schelist;
	}
	
	
	@PostMapping("mypage/deleteschedule")
	public List<CarryMypageDto> deleteschedule(HttpSession session){
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		
		List<CarryMypageDto> deleteschedule = mypService.deleteschedule(sdt.getCridx());
		
		System.out.println("캐리 스케줄 삭제합니다 : " + deleteschedule);
		
		return deleteschedule;
	}
}
