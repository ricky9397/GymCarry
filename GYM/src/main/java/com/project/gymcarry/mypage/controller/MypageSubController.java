package com.project.gymcarry.mypage.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.project.gymcarry.board.Pagination;

import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.mypage.MypageDto2;
import com.project.gymcarry.mypage.MypageMemberDto;
import com.project.gymcarry.mypage.MypageMemberUpdateDto;
import com.project.gymcarry.mypage.MypagePaymentDto;
import com.project.gymcarry.mypage.service.MypageService;
import com.project.gymcarry.mypage.service.MypageSubService;

@Controller
public class MypageSubController {

	@Autowired
	private MypageSubService mypService;

	@Autowired
	private MypageService mypService2;

	@RequestMapping(value = "/mypage/myinfo")
	public String memberList(HttpSession session, Model model) throws Exception {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		System.out.println("세션 변수" + sdt.getMemidx());

		List<MypageMemberDto> memberList = mypService.selectmember(sdt.getMemidx());
		System.out.println(memberList);

		model.addAttribute("memberList", memberList);

		model.addAttribute("MDTO", mypService.selectmember(sdt.getMemidx()));

		System.out.println("인포수정 페이지 진입");

		return "/mypage/myinfo";
	}

	@RequestMapping(value = "/mypage/mypage2")
	public String paymentMp(HttpSession session, Model model, MypageDto2 mypdto) {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		session.setAttribute("memidx", sdt.getMemidx());
		session.setAttribute("name", sdt.getMemname());
		List<MypageMemberDto> memberList = mypService.selectmember(sdt.getMemidx());
		model.addAttribute("memberList", memberList);

		int a = 1;
		model.addAttribute("a", a);
		System.out.println(a);
		System.out.println("세션 -> " + sdt + "-> 마이페이지 진입");

		return "/mypage/mypage";
	}

	@PostMapping("/mypage/myinfoUpdate")
	public String memberListchange(HttpSession session, @ModelAttribute MypageMemberUpdateDto MDTO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 암호 확인
		System.out.println("첫번째 암호 : " + MDTO.getMempw());
		// 비밀번호 암호화(SHA256)
		String encryPassword = SHA256.encrypt(MDTO.getMempw());
		MDTO.setMempw(encryPassword);
		System.out.println("두번째:" + MDTO.getMempw());

		System.out.println(MDTO.getMemphoto() + "MDTO");

		int result = mypService.updateMemberBasicInfo(MDTO, response, request);
		System.out.println(MDTO.toString());
		System.out.println("result = " + result);
		if (result == 1) {
			System.out.println("멤버 정보수정 성공");
		} else {
			System.out.println("실패");
		}

		return "redirect:/mypage/mypage";
	}

	@PostMapping("/mypage/mymemo")
	public String info(HttpSession session, Model model, MypageDto2 mypdto) {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		session.setAttribute("memidx", sdt.getMemidx());
		session.setAttribute("name", sdt.getMemname());

		return "/mypage/mymemo";
	}

	@RequestMapping(value = "/mypage/mypass", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> infopass(HttpSession session, Model model, MypageDto2 mypdto,
			@RequestParam("arg0") int arg0, @RequestParam("arg1") String arg1) {

		List<MypageDto2> list2 = mypService2.loadMemo2(arg0, arg1);
		System.out.println("AJAX 발동 끌어오기!" + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		// 출력부
		if (list2.size() != 0) {
			for (int i = 0; i < list2.size(); i++) {
				if (list2.get(i).getInfotype().equals("food")) {
					map.put("list", list2.get(i).getInfocontent());
				}

				if (list2.get(i).getInfotype().equals("memo")) {
					map.put("list2", list2.get(i).getInfocontent());
				}

				if (list2.get(i).getInfotype().equals("kg")) {
					map.put("list3", list2.get(i).getInfocontent());
				}

				if (list2.get(i).getInfotype().equals("photo")) {
					map.put("list4", list2.get(i).getInfocontent());
				}
			}
		} else {
			map.put("list", "");
			map.put("list2", "");
			map.put("list3", "");
			map.put("list4", "");
		}
		System.out.println(map);
		return map;

	}

	@PostMapping("/mypage/mycash")
	public String cash(HttpSession session, Model model) {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		session.setAttribute("memidx", sdt.getMemidx());
		List<MypagePaymentDto> paymentList = mypService.selectpayment(sdt.getMemidx());
		System.out.println(paymentList);
		model.addAttribute("paymentList", paymentList);
		System.out.println("/ 진입");

		return "/mypage/mycash";
	}

	// 전체 캐리 리스트 출력 (nav - 1:1 MATCHING 클릭시 이동)
	@GetMapping("/mypage/mycarry")
	public String allCarryList(HttpSession session, Model model) {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		session.setAttribute("memidx", sdt.getMemidx());
		List<CarryListDto> alist = mypService.getMyCarryList(sdt.getMemidx());
		model.addAttribute("allList", alist);
		System.out.println(alist + "alist");

		System.out.println("좋아요 캐리 리스트 출력");

		return "/mypage/mycarry";
	}

	@RequestMapping("mypage/mycommunity")
	public String regForm(HttpSession session, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		SessionDto sdt = (SessionDto) session.getAttribute("loginSession");
		System.out.println("세션 변수" + sdt.getMemidx());
		session.setAttribute("idx", sdt.getMemidx());

		int listCnt = mypService.getBoardListCnt(sdt.getMemidx());

		int memidx = sdt.getMemidx();
		// Pagination 객체 생성
		Pagination arg0 = new Pagination();
		arg0.pageInfo2(page, range, listCnt, sdt.getMemidx());

		System.out.println(arg0);
		model.addAttribute("pagination", arg0);
		model.addAttribute("boardList", mypService.getBoardList(arg0));

		return "/mypage/mycommunity";
	}

}