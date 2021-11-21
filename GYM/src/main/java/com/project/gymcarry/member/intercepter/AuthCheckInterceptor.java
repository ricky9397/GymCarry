package com.project.gymcarry.member.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	
	// 로그인 필요한 곳 로그인 창으로 이동
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loginSession") != null) { return true; }
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
	}
	
}
