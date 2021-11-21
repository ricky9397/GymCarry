package com.project.gymcarry.mypage.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.gymcarry.carry.*;
import com.project.gymcarry.dao.CarryDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.dao.CarryMyPageDao;

@Service
public class CarryMyPageServiceImpl implements CarryMyPageService {

    private CarryMyPageDao dao;
    private CarryDao carryDao;
    private CarryMyPageDao carryMyPageDao;
    

    @Autowired
    private SqlSessionTemplate template;



    // 캐리 정보 수정
    @Override
    public int updateCarryModify(CarryToInfoDto carryToInfoDto, HttpServletResponse response, HttpServletRequest request) throws Exception {
        dao = template.getMapper(CarryMyPageDao.class);

        File newFile = null;
        CarryInfoDto carryInfoDto = carryToInfoDto.getCarryInfoDto();
        if (carryToInfoDto.getCrbfphoto() != null && !carryToInfoDto.getCrbfphoto().isEmpty()) {

            // 파일객체에 경로 지정!
            File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
            if (!newDir.exists()) {
                newDir.mkdir();
            }
            // db에 저장할 파일이름 !!!!!!!!
            String newFileName = carryToInfoDto.getCridx() + System.currentTimeMillis() + "."
                    + chkFileType(carryToInfoDto.getCrbfphoto());
            // 파일객체에 경로와 중복제거한 이름 저장(newDir:경로 , newFileName:저장파일이름)!!!!
            newFile = new File(newDir, newFileName);
            // 파일 joinDto 저장
            carryToInfoDto.getCrbfphoto().transferTo(newFile);
            // 파일 이름을 memberDto 저장!
            carryInfoDto.setCrbfphoto(newFileName);
            System.out.println("파일 정상적으로 들어옴");
        } else {
            carryInfoDto.setCrbfphoto(request.getParameter("oldcrbfphoto"));
        }
        System.out.println("서비스에서 출력하는 tostring = " + carryInfoDto.toString());

        return dao.updateCarryModify(carryInfoDto);
    }

    // 캐리 PT 이용 금액 출력
    @Override
	public List<CarryPriceDto> selectCarryPrice(int cridx) throws Exception {
    	dao = template.getMapper(CarryMyPageDao.class);
		return dao.selectCarryPrice(cridx);
	}
    
    // 캐리 가격 정보 유무 체크
	@Override
	public int checkCarryPrice(int cridx) {
		dao = template.getMapper(CarryMyPageDao.class);
		return dao.checkCarryPrice(cridx);
	}

	// 캐리 가격 정보 최초 insert
	@Override
	public int insertCarryPrice(int proprice1, int proprice2, int proprice3, int proprice4, int cridx) {
		dao = template.getMapper(CarryMyPageDao.class);
		return dao.insertCarryPrice(proprice1, proprice2, proprice3, proprice4, cridx);
	}
    
    
    // 캐리 정보 가격 수정
    @Override
    public int updateCarryPrice(int proprice1, int proprice2, int proprice3, int proprice4, int cridx) {
        dao = template.getMapper(CarryMyPageDao.class);
        return dao.updateCarryPrice(proprice1, proprice2, proprice3, proprice4, cridx);
    }

    // 캐리 자격 및 경력 [입력 or 수정]
    @Override
    public int upsetCarryCerti(CarryCertiDto certiDto) throws Exception {
        dao = template.getMapper(CarryMyPageDao.class);
        return dao.upsetCarryCerti(certiDto);
    }

    // 캐리 기본 정보 수정 데이터 출력
    @Override
    public CarryJoinDto selectCarryBasicInfo(int cridx) throws Exception {
        dao = template.getMapper(CarryMyPageDao.class);
        return dao.selectCarryBasicInfo(cridx);
    }

    // 캐리 기본 정보 수정 완료
    @Override
    public int updateCarryBasicInfo(CarryToJoinDto carryToJoinDto, HttpServletResponse response, HttpServletRequest request) throws Exception {
        dao = template.getMapper(CarryMyPageDao.class);

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
            // 파일 이름을 memberDto 저장!
            carryJoinDto.setCrphoto(newFileName);
            System.out.println("파일 정상적으로 들어옴");
        } else {
            carryJoinDto.setCrphoto(request.getParameter("oldcrphoto"));
        }
        System.out.println("서비스에서 출력하는 tostring = " + carryJoinDto.toString());

        return dao.updateCarryBasicInfo(carryJoinDto);
    }

    // 캐리 자격 및 경력 정보 리스트 출력
    @Override
    public CarryCertiDto getCarryCerti(int cridx) throws Exception {
        carryDao = template.getMapper(CarryDao.class);
            return carryDao.selectCarryCerti(cridx);
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
        if (!(extension.equals("jpg") || extension.equals("jpeg") || extension.equals("png") || extension.equals("gif"))) {
            throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
        }
        return extension;
    }

    // 내 회원 리스트 출력
	@Override
	public List<CarryMyMemberDto> selectMyMemberList(int cridx) throws Exception {
		carryMyPageDao = template.getMapper(CarryMyPageDao.class);
         return carryMyPageDao.myMemberList(cridx);
	}

	

}