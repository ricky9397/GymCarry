package com.project.gymcarry.mypage.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.carry.CarryReviewDto;
import com.project.gymcarry.member.SessionDto;

import com.project.gymcarry.mypage.MypageDto2;
import com.project.gymcarry.mypage.MypageMemberDto;
import com.project.gymcarry.mypage.MypagePhotoDto;
import com.project.gymcarry.mypage.service.MypageService;
import com.project.gymcarry.mypage.service.MypageSubService;

@Controller

public class MypageController {

	@Autowired
	private MypageService mypService;
	@Autowired
	private MypageSubService mypService2;

	@RequestMapping("/mypage/mypage")
	public String regFor(HttpSession session, Model model, MypageDto2 mypdto) {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		session.setAttribute("memidx", sdt.getMemidx());
		session.setAttribute("name", sdt.getMemname());
		List<MypageMemberDto> memberList = mypService2.selectmember(sdt.getMemidx());
		model.addAttribute("memberList", memberList);

		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		// 포맷 적용
		String formatedNow = now.format(formatter);

		List<MypageDto2> list2 = mypService.loadMemo2(sdt.getMemidx(), formatedNow);
		System.out.println(memberList);
		System.out.println("세션 -> " + sdt + "-> 마이페이지 진입");

		return "/mypage/mypage";
	}

	@RequestMapping("/mypage/mypage4")
	public String addMembermemo(@ModelAttribute MypagePhotoDto MPdto, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("테스트");
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		String arg0 = MPdto.getMemidx();
		String arg1 = MPdto.getInfodate();
		String arg2 = MPdto.getInfotype();

		List<MypageMemberDto> memberList = mypService2.selectmember(sdt.getMemidx());
		model.addAttribute("memberList", memberList);
		List<MypageDto2> list1 = mypService.selectMemo(arg0, arg1, arg2);

		System.out.println(MPdto + "mypdto");
		System.out.println(list1);

		System.out.println(MPdto.getInfocontent());
		if (list1.isEmpty()) { //
			mypService2.insertMemberPhoto(MPdto, response, request);
			System.out.println("인설트로 가쟈 " + MPdto);
		} else {
			mypService2.updateMemberPhoto(MPdto, response, request);
			System.out.println("업데이트 가쟈" + MPdto);
		}

		return "mypage/mypage";
	}

	// 메모 등록
	@RequestMapping("/mypage/mypage3")
	public String addMembermemo(MypageDto2 mypdto, Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		MypagePhotoDto MPdto = new MypagePhotoDto();

		System.out.println("테스트");
		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		String arg0 = mypdto.getMemidx();
		String arg1 = mypdto.getInfodate();
		String arg2 = mypdto.getInfotype();

		List<MypageMemberDto> memberList = mypService2.selectmember(sdt.getMemidx());
		model.addAttribute("memberList", memberList);
		List<MypageDto2> list1 = mypService.selectMemo(arg0, arg1, arg2);

		System.out.println(mypdto + "mypdto");

		System.out.println(MPdto + "엠피디티오");

		System.out.println(list1);

		if (list1.isEmpty()) { //
			mypService.memberMemo(mypdto);
			System.out.println("인설트로 가쟈 " + mypdto);
		} else {
			mypService.updateMemo(mypdto);
			System.out.println("업데이트 가쟈" + mypdto);
		}

		return "mypage/mypage";
	}
}