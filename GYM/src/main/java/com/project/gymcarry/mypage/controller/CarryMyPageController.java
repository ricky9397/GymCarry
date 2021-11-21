package com.project.gymcarry.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.gymcarry.carry.*;
import com.project.gymcarry.common.SHA256;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.mypage.service.CarryMyPageService;

@Controller
public class CarryMyPageController {

	@Autowired
	private CarryMyPageService service;

	@GetMapping("/mypage/carrymypage")
	public String carryMyPage(HttpSession session,Model model) throws Exception {
		
		// 캐리 마이페이지 출력
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		CarryJoinDto carry = service.selectCarryBasicInfo(sdt.getCridx());
		
		session.setAttribute("cridx", sdt.getCridx());
		session.setAttribute("crname", sdt.getCrname());
		session.setAttribute("crnick", carry.getCrnick());
		session.setAttribute("crphoto", carry.getCrphoto());
		
		// 내 회원 리스트 출력
		List<CarryMyMemberDto> memberList = service.selectMyMemberList(sdt.getCridx());
		model.addAttribute("memberList", memberList);
		
		System.out.println("memberList = " + memberList.toString());
		
		System.out.println("세션 -> " + sdt + "-> 마이페이지 진입");
		
		
		return "/mypage/carrymypage/carrymypage";
	}

	// 캐리 정보 수정 페이지
	@GetMapping("/mypage/carrymodify")
	public String carryModify(HttpServletRequest request ,Model model) throws Exception {

		HttpSession session = request.getSession();
		int cridx = (int) session.getAttribute("cridx");

		// 캐리소개 출력
		CarryJoinDto carry = service.selectCarryBasicInfo(cridx);
		model.addAttribute("carry", carry);

		// 캐리 자격 및 경력 출력
		CarryCertiDto carryCerti = service.getCarryCerti(cridx);
		model.addAttribute("carryCerti", carryCerti);
		
		// 캐리 PT 이용금액 출력
		List<CarryPriceDto> carryPrice = service.selectCarryPrice(cridx);
		model.addAttribute("carryPrice", carryPrice);
		System.out.println("carryPrice === " + carryPrice.toString());

		return "/mypage/carrymypage/modifycarryinfo";
	}

	// 캐리 정보 수정 업데이트
	@PostMapping("/mypage/update")
	public String updateCarryModify(CarryToInfoDto carryToInfoDto,
									@RequestParam("proprice1") int proprice1, @RequestParam("proprice2") int proprice2,
									@RequestParam("proprice3") int proprice3, @RequestParam("proprice4") int proprice4,
									@RequestParam("cridx") int cridx,
									CarryCertiDto certiDto,
									HttpSession session, HttpServletRequest request, HttpServletResponse respons) throws Exception {


		service.updateCarryModify(carryToInfoDto,respons,request);
		
		SessionDto dto = (SessionDto) session.getAttribute("loginSession");
		System.out.println("cridx : " + dto.getCridx());
		
		int result = service.checkCarryPrice(cridx);
		System.out.println("결과2 :" + result);
		
		if(result > 0) {
			service.updateCarryPrice(proprice1, proprice2, proprice3, proprice4, carryToInfoDto.getCridx());
		} else {
			service.insertCarryPrice(proprice1, proprice2, proprice3, proprice4, cridx);
		}
		
		service.upsetCarryCerti(certiDto);
		
		return "/mypage/carrymypage/carrymypage";
	}
	


	// 캐리 기본 정보 수정
	@GetMapping("/carry/modify")
	public String carryBasicModify(HttpServletRequest request ,Model model) throws Exception {

		HttpSession session = request.getSession();
		int cridx = (int) session.getAttribute("cridx");

		CarryJoinDto carry = service.selectCarryBasicInfo(cridx);
		model.addAttribute("carry", carry);
		System.out.println(carry.toString());
		return "/mypage/carrymypage/modifycarrybasicinfo";
	}


	// 캐리 기본 정보 수정 내용 전송
	@PostMapping("/carry/modify")
	public String carryBasicInfoUpdate(@ModelAttribute CarryToJoinDto carryDto, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 암호 확인
		System.out.println("첫번째 암호 : " + carryDto.getCrpw());
		// 비밀번호 암호화(SHA256)
		String encryPassword = SHA256.encrypt(carryDto.getCrpw());
		carryDto.setCrpw(encryPassword);
		System.out.println("두번째:" + carryDto.getCrpw());

		int result = service.updateCarryBasicInfo(carryDto, response, request);
		System.out.println(carryDto.toString());
		System.out.println("result = " + result);
		if (result == 1) {
			System.out.println("캐리 회원가입 성공");
		} else {
			System.out.println("실패");
		}

		return "/mypage/carrymypage/carrymypage";
	}

	
}