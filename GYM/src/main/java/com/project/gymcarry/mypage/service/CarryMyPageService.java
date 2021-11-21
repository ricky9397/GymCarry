package com.project.gymcarry.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.gymcarry.carry.CarryCertiDto;
import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.carry.CarryMyMemberDto;
import com.project.gymcarry.carry.CarryPriceDto;
import com.project.gymcarry.carry.CarryToInfoDto;
import com.project.gymcarry.carry.CarryToJoinDto;


public interface CarryMyPageService {

    // 캐리 정보 수정
    public int updateCarryModify(CarryToInfoDto carryToInfoDto, HttpServletResponse response, HttpServletRequest request) throws Exception;

    List<CarryPriceDto> selectCarryPrice(int cridx) throws Exception;
    
    // 캐리 가격 정보 유무 체크
    int checkCarryPrice(int cridx);
    // 캐리 가격 정보 최초 insert
    int insertCarryPrice(int proprice1, int proprice2, int proprice3, int proprice4, int cridx);
    // 캐리 가격 정보 수정
    int updateCarryPrice(int proprice1, int proprice2, int proprice3, int proprice4, int cridx);

    
    // 캐리 자격 및 경력 [입력 or 수정]
    int upsetCarryCerti(CarryCertiDto certiDto) throws Exception;

    // 캐리 기본 정보 수정 출력
    public CarryJoinDto selectCarryBasicInfo(int cridx) throws Exception;

    // 캐리 기본 정보 수정 완료
    public int updateCarryBasicInfo(CarryToJoinDto carryToJoinDto, HttpServletResponse response, HttpServletRequest request) throws Exception;

    // 캐리 자격 및 경력 정보
    public CarryCertiDto getCarryCerti(int cridx) throws Exception;
    
    public List<CarryMyMemberDto> selectMyMemberList(int cridx) throws Exception;

}
