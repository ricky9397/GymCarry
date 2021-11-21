package com.project.gymcarry.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carry.CarryDto;
import com.project.gymcarry.dao.MemberDao;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.SessionDto;

@Service
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberDao dao;
	
	// 멤버 로그인
	public SessionDto memberLogin(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		System.out.println("로그인 서비스 : "+id);
		System.out.println("로그인 서비스 : "+pw);
		System.out.println("로그인 서비스 : "+dao.memberLogin(id, pw));

		return dao.memberLogin(id, pw);
	}
	
	// 캐리 로그인 
	public SessionDto carryLogin(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		System.out.println("로그인 서비스 : "+id);
		System.out.println("로그인 서비스 : "+pw);
		System.out.println("로그인 서비스 : "+dao.carryLogin(id, pw));
		
		return dao.carryLogin(id, pw);
	}
	
	// 멤버 로그인 검사 
	public MemberDto memberjoinkeycheck(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		System.out.println("멤버 LoginService 내부 조인키 : " + id);
		System.out.println("멤버 LoginService 내부 조인키 : " + pw);
		System.out.println("멤버 LoginService 내부 조인키 : " + dao.memberjoinkeycheck(id, pw));
		return dao.memberjoinkeycheck(id, pw);
	}
	
	// 캐리  로그인 검사 
	public CarryDto carryjoinkeycheck(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		System.out.println("캐리 LoginService 내부 조인키 : " + id);
		System.out.println("캐리 LoginService 내부 조인키 : " + pw);
		System.out.println("캐리 LoginService 내부 조인키 : " + dao.carryjoinkeycheck(id, pw));
		return dao.carryjoinkeycheck(id, pw);
	}
	
	// 카카오 로그인(중복닉네임있을경우가입)
	public int insertKaKaoJoinOne(MemberDto memberDto) {
		dao = template.getMapper(MemberDao.class);
		return dao.insertKaKaoJoinOne(memberDto);
	}
	
	// 카카오 로그인 체크용
	public SessionDto memberLoginCheck(String snsjoinid) {
		dao = template.getMapper(MemberDao.class);
		return dao.selectKakaoLoginCheck(snsjoinid);
	}
	
	// sns 회원가입
	public int updateKakaoJoin(MemberDto memberDto) {
		dao = template.getMapper(MemberDao.class);
		return dao.updateKakaoJoin(memberDto);
	}
	


	
}
