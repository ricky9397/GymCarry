package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.carry.CarryCertiDto;
import com.project.gymcarry.carry.CarryInfoDto;
import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.carry.CarryMyMemberDto;
import com.project.gymcarry.carry.CarryPriceDto;

public interface CarryMyPageDao {

	// 캐리 정보 수정
	int updateCarryModify(CarryInfoDto carryInfoDto) throws Exception;

	// 캐리 PT 이용 금액 출력
	List<CarryPriceDto> selectCarryPrice(int cridx) throws Exception;
	
	// 캐리 가격 정보 유무 체크
	int checkCarryPrice(int cridx);
	// 캐리 가격 정보 최초 insert
	int insertCarryPrice(int proprice1, int proprice2, int proprice3, int proprice4, int cridx);
	// 캐리 가격 수정
	int updateCarryPrice(int proprice1,int proprice2, int proprice3, int proprice4, int cridx);

	
	// 캐리 자격 및 경력 [입력 or 수정]
    int upsetCarryCerti(CarryCertiDto certiDto) throws Exception;

    
    // 캐리 기본 정보 수정에 필요한 값 출력
    CarryJoinDto selectCarryBasicInfo(int cridx) throws Exception;
    
    // 캐리 기본 정보 수정 완료
    int updateCarryBasicInfo(CarryJoinDto carryJoinDto) throws Exception;
    
    // 내 회원 리스트 출력
    List<CarryMyMemberDto> myMemberList(int cridx) throws Exception;




    
    
}
