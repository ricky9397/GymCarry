package com.project.gymcarry.mypage.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.board.Pagination;
import com.project.gymcarry.board.editor.PhotoVo;
import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.dao.MypageDao;
import com.project.gymcarry.mypage.MypageDto2;
import com.project.gymcarry.mypage.MypageMemberDto;
import com.project.gymcarry.mypage.MypageMemberUpdateDto;
import com.project.gymcarry.mypage.MypagePaymentDto;
import com.project.gymcarry.mypage.MypagePhotoDto;

@Service
public class MypageSubService {

	@Autowired
	private SqlSessionTemplate template;

	private MypageDao dao;

	public List<MypagePaymentDto> selectpayment(int i) {
		dao = template.getMapper(MypageDao.class);
		return dao.selectpayment(i);
	}

	public List<MypageMemberDto> selectmember(int i) {
		dao = template.getMapper(MypageDao.class);
		return dao.selectmember(i);
	}

	public List<CarryListDto> getMyCarryList(int i) {
		dao = template.getMapper(MypageDao.class);
		return dao.getMyCarryList(i);
	}

	public int getBoardListCnt(int i) {
		dao = template.getMapper(MypageDao.class);
		return dao.getBoardListCnt(i);
	}

	public List<BoardDto> getBoardList(Pagination pagination) throws Exception {

		dao = template.getMapper(MypageDao.class);
		return dao.getBoardList(pagination);
	}

	public int memberUpdate(MypageMemberDto mMdto) {
		dao = template.getMapper(MypageDao.class);
		return dao.memberupdate(mMdto);
	}

	// 멤버 사진 메모 입력
	public int updateMemberPhoto(MypagePhotoDto MPdto, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		dao = template.getMapper(MypageDao.class);

		File newFile = null;
		MypageDto2 MDto = MPdto.getMypageDto2();
		// MypageMemberDto MypageMemberDto = MypageMemberUpdateDto.getMemberJoinDto();
		if (MPdto.getInfocontent() != null && !MPdto.getInfocontent().isEmpty()) {

			// 파일객체에 경로 지정!
			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
			if (!newDir.exists()) {
				newDir.mkdir();
			}
			// db에 저장할 파일이름 !!!!!!!!
			String newFileName = MPdto.getInfoidx() + System.currentTimeMillis() + "."
					+ chkFileType(MPdto.getInfocontent());
			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)!!!!
			newFile = new File(newDir, newFileName);
			// 파일 joinDto 저장
			MPdto.getInfocontent().transferTo(newFile);
			// 파일 이름을 memberDto 저장!
			MDto.setInfocontent(newFileName);
			System.out.println("파일 정상적으로 들어옴");
		} else {
			MDto.setInfocontent(request.getParameter("memmemoophoto"));
		}
		System.out.println("서비스에서 출력하는 tostring = " + MDto.toString());

		return dao.updateMemo(MDto);
	}

	public int insertMemberPhoto(MypagePhotoDto MPdto, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		dao = template.getMapper(MypageDao.class);

		File newFile = null;
		MypageDto2 MDto = MPdto.getMypageDto2();
		if (MPdto.getInfocontent() != null && !MPdto.getInfocontent().isEmpty()) {

			// 파일객체에 경로 지정!
			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
			if (!newDir.exists()) {
				newDir.mkdir();
			}
			// db에 저장할 파일이름 !!!!!!!!
			String newFileName = MPdto.getInfoidx() + System.currentTimeMillis() + "."
					+ chkFileType(MPdto.getInfocontent());
			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)!!!!
			newFile = new File(newDir, newFileName);
			// 파일 joinDto 저장
			MPdto.getInfocontent().transferTo(newFile);
			// 파일 이름을 memberDto 저장!
			MDto.setInfocontent(newFileName);
			System.out.println("파일 정상적으로 들어옴");
		} else {
			MDto.setInfocontent(request.getParameter("memmemoophoto"));
		}
		System.out.println("서비스에서 출력하는 tostring = " + MDto.toString());

		return dao.insertMemo(MDto);
	}

	// 멤버 기본 정보 수정 완료
	public int updateMemberBasicInfo(MypageMemberUpdateDto MypageMemberUpdateDto, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		dao = template.getMapper(MypageDao.class);

		File newFile = null;
		MypageMemberDto MypageMemberDto = MypageMemberUpdateDto.getMemberJoinDto();
		if (MypageMemberUpdateDto.getMemphoto() != null && !MypageMemberUpdateDto.getMemphoto().isEmpty()) {

			// 파일객체에 경로 지정!
			File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
			if (!newDir.exists()) {
				newDir.mkdir();
			}
			// db에 저장할 파일이름 !!!!!!!!
			String newFileName = MypageMemberUpdateDto.getMememail() + System.currentTimeMillis() + "."
					+ chkFileType(MypageMemberUpdateDto.getMemphoto());
			// 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)!!!!
			newFile = new File(newDir, newFileName);
			// 파일 joinDto 저장
			MypageMemberUpdateDto.getMemphoto().transferTo(newFile);
			// 파일 이름을 memberDto 저장!
			MypageMemberDto.setMemphoto(newFileName);
			System.out.println("파일 정상적으로 들어옴");
		} else {
			MypageMemberDto.setMemphoto(request.getParameter("oldmemphoto"));
		}
		System.out.println("서비스에서 출력하는 tostring = " + MypageMemberDto.toString());

		return dao.memberupdate(MypageMemberDto);
	}

	private String chkFileType(MultipartFile file) throws Exception {
		String extension = "";
		// 업로드 파일의 contentType
		String contentType = file.getContentType();
		if (!(contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png")
				|| contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}
		// 파일 확장자 구하기
		String fileName = file.getOriginalFilename();
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
}
