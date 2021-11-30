package com.project.gymcarry.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.MemberVO;
import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.member.service.LoginService;
import com.project.gymcarry.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	/**
	 * 맴버 회원가입 insert
	 * 
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("member/join")
	@ResponseBody
	public int memberJoin(MemberVO member, HttpServletRequest request) throws Exception {

		// 비밀번호 암호화(SHA256)
		String encryPassword = SHA256.encrypt(member.getMemPw());
		member.setMemPw(encryPassword);
		// 인증메일 보내기 메소드
		// String result2 =
		// mailsenderservice.send_mail(member.getMemEmail(),memberDto.getMemname());
		return memberService.insertMemberJoin(member, request);
	}

	// 로그인 세션 저장
	/**
	 * select 맴버 일반 로그인
	 * @param id
	 * @param pw
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/member/memberLogin")
	@ResponseBody
	public int login(@RequestParam("memEmail") String id, @RequestParam("memPw") String pw, HttpSession session)
			throws Exception {
		// 비밀번호 암호화
		String password = SHA256.encrypt(pw);
		
		return memberService.selectMemberLogin(id, password, session);
	}
	
	// 로그아웃 세션 삭제
	@GetMapping("member/logOut")
	public String memberLogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index";
	}

	@PostMapping("/member/kakaologin")
	@ResponseBody
	public int memberKakaoLogin(MemberDto memberDto, HttpSession session) {
		SessionDto sessionDto = loginService.memberLoginCheck(memberDto.getSnsjoinid());
		int result = 0;
		if (sessionDto == null) {
			loginService.insertKaKaoJoinOne(memberDto);
			System.out.println(memberDto);
		} else if (sessionDto.getMemnick() == null) {
			result = 1;
		} else if (sessionDto != null && sessionDto.getMemnick() != null) {
			result = 2;
			String chatNick = sessionDto.getMemnick();
			session.setAttribute("loginSession", sessionDto);
			session.setAttribute("chatSession", chatNick);
		}
		return result;
	}

	@GetMapping("/member/kakaojoin")
	public String kakaoJoinInfo(@RequestParam("snsjoinid") String snsjoinid, Model model) {
		model.addAttribute("snsjoinid", snsjoinid);
		return "member/snsJoinForm";
	}

	@PostMapping("/member/kakaojoininput")
	public String inputKakaoJoin(MemberDto memberDto, HttpSession session) {
		System.out.println(memberDto);
		int result = loginService.updateKakaoJoin(memberDto);
		if (result == 1) {
			SessionDto sessionDto = loginService.memberLoginCheck(memberDto.getSnsjoinid());
			String chatNick = sessionDto.getMemnick();
			session.setAttribute("loginSession", sessionDto);
			session.setAttribute("chatSession", chatNick);
		}
		return "redirect:/index";
	}

}
