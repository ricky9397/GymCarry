package com.project.gymcarry.member.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.carry.CarryToJoinDto;
import com.project.gymcarry.common.CommPhotoVO;
import com.project.gymcarry.dao.MemberDao;
import com.project.gymcarry.member.MemberDto;
import com.project.gymcarry.member.MemberVO;

@Service
public class MemberJoinServiceImpl implements MemberService {

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
					+ chkFileType(carryToJoinDto.getCrphoto());
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

	// 파일의 ContentType 과 파일 확장자를 체크
	private String chkFileType(MultipartFile multipartFile) throws Exception {
		String extension = "";
		// 업로드 파일의 contentType
		String contentType = multipartFile.getContentType();
		if (!(contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png")
				|| contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}
		// 파일 확장자 구하기
		String fileName = multipartFile.getOriginalFilename();
		// String[] java.lang.String.split(String regex)
		// : 정규식의 패턴 문자열을 전달해야하기 때문에 \\. 으로 처리
		String[] nameTokens = fileName.split("\\."); /// tet.mini2.jpg PNG png
		// 토큰의 마지막 index의 문자열을 가져옴 : 배열의 개수-1
		extension = nameTokens[nameTokens.length - 1].toLowerCase();
		// 이미지 파일 이외의 파일 업로드 금지
		// 파일 확장자 체크
		if (!(extension.equals("jpg") || extension.equals("jpeg") || extension.equals("png")
				|| extension.equals("gif"))) {
			throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
		}
		return extension;
	}

	@Override
	public int insertMemberJoin(MemberVO member, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	
	/** insert 회원가입 & 사진업로드 */
//	@Override
//	public int insertMemberJoin(MemberVO member, HttpServletRequest request) throws Exception {
//		dao = template.getMapper(MemberDao.class);
//		
//		File newFile = null;
//		
//		if (member.getMemPhoto() != null && !member.getMemPhoto().isEmpty()) {
//			// 파일객체에 경로 지정
//			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
//			if (!newDir.exists()) { newDir.mkdir(); }
//			// DB에 저장할 파일 이름
//			String newFileName = member.getMemEmail() + System.currentTimeMillis() + "."
//					+ chkFileType(member.getMemPhoto());
//			
//			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)
//			newFile = new File(newDir, newFileName);
//			// 파일 CommPhoto객체 저장
//			member.getMemPhoto().transferTo(newFile);
//			
//			
//			
//		} else {
//			// default 사진 이름
//			
//			//member.setMemPhoto("profile2.png");
//			
//		}
//		return dao.insertMemberJoin(member);
//	}

}