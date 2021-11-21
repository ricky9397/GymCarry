package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.admin.AdminSessionDto;
import com.project.gymcarry.carry.CarryListDto2;
import com.project.gymcarry.member.MemberListDto;

public interface AdminDao {

	// 관리자 로그인
	AdminSessionDto adminLogin(String id, String pw);
	
	// 전체 회원 리스트
	List<MemberListDto> selectAllMemberList();
	// 회원 탈퇴 처리
	public void deleteMember(int memidx);
		
	// 전체 캐리 리스트
	List<CarryListDto2> selectAllCarryList();
	// 캐리 탈퇴 처리
	public void deleteCarry(int cridx);
	

}
