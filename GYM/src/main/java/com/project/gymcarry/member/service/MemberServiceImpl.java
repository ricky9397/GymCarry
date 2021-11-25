package com.project.gymcarry.member.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.carry.CarryToJoinDto;
import com.project.gymcarry.common.MultipartfileUtils;
import com.project.gymcarry.dao.MemberDao;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate template;

	private MemberDao dao;

	// 멤버 이메일 중복 검사
	public int memberemailCheck(String mememail) throws Exception {
		dao = template.getMapper(MemberDao.class);
		return dao.memberemailCheck(mememail);
	}

	// 멤버 닉네임 중복 검사
	public int memberNickCheck(String memNick) {
		dao = template.getMapper(MemberDao.class);
		return dao.memberNickCheck(memNick);
	}

	// 멤버 핸드폰번호 중복 검사
	public int memberPhoneCheck(String memphone) {
		dao = template.getMapper(MemberDao.class);
		return dao.memberPhoneCheck(memphone);
	}

	// 캐리 이메일 중복 검사
	public int carryemailCheck(String cremail) throws Exception {
		dao = template.getMapper(MemberDao.class);
		return dao.carryemailCheck(cremail);
	}

	// 캐리 닉네임 중복 검사
	public int carryNickCheck(String crNick) throws Exception {
		dao = template.getMapper(MemberDao.class);
		return dao.carryNickCheck(crNick);
	}

	// 캐리 핸드폰번호 중복 검사
	public int carryPhoneCheck(String crphone) {
		dao = template.getMapper(MemberDao.class);
		return dao.carryPhoneCheck(crphone);
	}

	// 캐리 회원가입
	public int carryJoin(CarryToJoinDto carryToJoinDto, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		dao = template.getMapper(MemberDao.class);

		File newFile = null;
		CarryJoinDto carryJoinDto = carryToJoinDto.getCarryJoinDto();
		if (carryToJoinDto.getCrphoto() != null && !carryToJoinDto.getCrphoto().isEmpty()) {
			// 파일객체에 경로 지정!
			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
			if (!newDir.exists()) {
				newDir.mkdir();
			}
			// db에 저장할 파일이름 !!!!!!!!
			String newFileName = carryToJoinDto.getCremail() + System.currentTimeMillis() + "."
					+ MultipartfileUtils.chkFileType(carryToJoinDto.getCrphoto());
			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)!!!!
			newFile = new File(newDir, newFileName);
			// 파일 joinDto 저장
			carryToJoinDto.getCrphoto().transferTo(newFile);
			// 파일 이름을 carryDto 저장!
			carryJoinDto.setCrphoto(newFileName);
		} else {
			carryJoinDto.setCrphoto("profile2.png");
		}
		return dao.insertCarry(carryJoinDto);
	}

	public int alterjoinkey(MemberDto memberDto) {
		return template.update("alterjoinkey");
	}

	/** insert 회원가입 & 사진업로드 */
	@Override
	public int insertMemberJoin(MemberVO member, HttpServletRequest request) throws Exception {
		dao = template.getMapper(MemberDao.class);
		
		File newFile = null;
		
		if (member.getMemPhoto() != null && !member.getMemPhoto().isEmpty()) {
			// 파일객체에 경로 지정
			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
			if (!newDir.exists()) { newDir.mkdir(); }
			// DB에 저장할 파일 이름
			String newFileName = member.getMemEmail() + System.currentTimeMillis() + "."
					+ MultipartfileUtils.chkFileType(member.getMemPhoto());
			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)
			newFile = new File(newDir, newFileName);
			// 파일 CommPhoto객체 저장
			member.getMemPhoto().transferTo(newFile);
			
			// 파일이름 저장
			member.setMemPhotos(newFileName);
			
		} else {
			// default 사진 이름
			member.setMemPhotos("profile2.png");
		}
		return dao.insertMemberJoin(member);
	}

	/** select 맴버 일반 로그인  */
	@Override
	public int selectMemberLogin(String id, String password, HttpSession session) throws Exception {
		dao = template.getMapper(MemberDao.class);
		int result = 0;
		MemberVO vo = dao.selectMemberLogin(id, password);
		if(vo != null) {
			// 로그인처리 session
			session.setAttribute("loginSession", vo);
			// 채팅 닉네임 값 세션저장
			session.setAttribute("chatSession", vo.getMemNick());
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

}