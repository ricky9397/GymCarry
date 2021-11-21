package com.project.gymcarry.find.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.common.SHA256;
import com.project.gymcarry.dao.MemberDao;
import com.project.gymcarry.find.TempPWD;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.service.MailSenderService;

@Service
public class FindService {

	@Autowired
	private SqlSessionTemplate template;
	@Autowired
	private MailSenderService mailsender;
	private MemberDao dao;
	private String tempPWD;

	// 캐리 아이디 찾기
	public String findcarryid(HttpServletResponse response, String crname, String crphone) throws IOException {
		dao = template.getMapper(MemberDao.class);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String cremail = dao.findcarryid(crname, crphone);
		System.out.println(" cremail : " + cremail);
		System.out.println(" crname : " + crname);
		System.out.println(" crphone : " + crphone);
		
		if (cremail == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return cremail;
		}
	}
	
	// 회원 아이디 찾기
	public String findid(HttpServletResponse response, String memname, String memphone) throws IOException {
		dao = template.getMapper(MemberDao.class);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String mememail = dao.findmemberid(memname, memphone);
		System.out.println(" mememail : " + mememail);
		System.out.println(" memname : " + memname);
		System.out.println(" memphone : " + memphone);
		
		if (mememail == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return mememail;
		}
	}
	
	// 패스워드 찾기 이메일 발송 
		public String findPassword(HttpServletResponse response, String memname, String mememail) throws IOException {
			dao = template.getMapper(MemberDao.class);
			
			return dao.findPassword(memname, mememail);
		}
		
		
	// 캐리 패스워드 찾기 이메일 발송
		public String findCarryPassword(HttpServletResponse response, String crname, String cremail) throws IOException {
			dao = template.getMapper(MemberDao.class);
			
			return dao.findCarryPassword(crname, cremail);
		}
		
}


