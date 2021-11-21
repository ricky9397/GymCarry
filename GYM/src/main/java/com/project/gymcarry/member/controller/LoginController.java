package com.project.gymcarry.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.SessionDto;
import com.project.gymcarry.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("member/login")
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그인 세션 저장
	@PostMapping("/member/memberLogin")
	public String login(@RequestParam("memEmail") String id, @RequestParam("memPw") String pw,
			MemberDto memberjoinkeycheck, SessionDto memberLogin, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String password = SHA256.encrypt(pw);
		
		MemberDto memberDto = loginService.memberjoinkeycheck(id, password);

		if (memberDto != null) {

			if (memberDto.getJoinkey_status().equals("1")) {

				SessionDto sessionDto = new SessionDto();
				sessionDto.setMemidx(memberDto.getMemidx());
				sessionDto.setMemname(memberDto.getMemname());
				sessionDto.setMemnick(memberDto.getMemnick());
				String chatNick = sessionDto.getMemnick();

				out.println("<script>");
				out.println("alert('로그인되었습니다!'); location.href='/gym/index';");
				out.println("</script>");
				out.close();

				System.out.println("로그인 성공");
				session.setAttribute("loginSession", sessionDto);
				session.setAttribute("chatSession", chatNick);

				System.out.println("sessionDto : " + sessionDto);
				System.out.println("chatNick : " + chatNick);

				return "redirect:/index";

			} else {

				out.println("<script>");
				out.println("alert('[!] 이메일 인증 후 로그인해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				System.out.println("이메일 미인증 상태!");
			}

		} else {

			out.println("<script>");
			out.println("alert('[!] 이메일 혹은 비밀번호를 확인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			System.out.println("입력 오류 상태!");

		}

		return "redirect:/index";
	}

	// 로그아웃 세션 삭제
	@GetMapping("member/logOut")
	public String memberLogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("로그아웃");
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
	public String inputKakaoJoin(MemberDto memberDto,HttpSession session) {
		System.out.println(memberDto);
		int result = loginService.updateKakaoJoin(memberDto);
		if(result == 1) {
			SessionDto sessionDto = loginService.memberLoginCheck(memberDto.getSnsjoinid());
			String chatNick = sessionDto.getMemnick();
			session.setAttribute("loginSession", sessionDto);
			session.setAttribute("chatSession", chatNick);
		}
		return "redirect:/index";
	}

}
