package com.project.gymcarry.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.gymcarry.member.MemberVO;

public interface MemberService {

	/**
	 * insert 맴버 회원가입
	 * @param member
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	int insertMemberJoin(MemberVO member, HttpServletRequest request) throws Exception;

	/**
	 * select 맴버 일반로그인
	 * @param id
	 * @param password
	 * @param session 
	 * @return
	 * @throws Exception
	 */
	int selectMemberLogin(String id, String password, HttpSession session) throws Exception;
	
	
	
	
	
	
}
