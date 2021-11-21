package com.project.gymcarry.member.service;

import javax.servlet.http.HttpServletRequest;

import com.project.gymcarry.common.CommPhotoVO;
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
	int insertMemberJoin(MemberVO member,CommPhotoVO memphoto, HttpServletRequest request) throws Exception;
	
	
	
	
}
