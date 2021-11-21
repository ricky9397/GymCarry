package com.project.gymcarry.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.board.Pagination;
import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.carry.CarryMypageDto;
import com.project.gymcarry.mypage.MypageDto2;
import com.project.gymcarry.mypage.MypageMemberDto;
import com.project.gymcarry.mypage.MypagePaymentDto;

public interface MypageDao {

	int insertMemo(MypageDto2 mypdto);

	List<MypageDto2> selectMemo(String arg0, String arg1, String arg2);

	int updateMemo(MypageDto2 mypdto);

	List<MypagePaymentDto> selectpayment(int i);

	List<CarryListDto> getMyCarryList(int i);

	int getBoardListCnt(int i);

	List<BoardDto> getBoardList(Pagination pagination);

	List<MypageMemberDto> selectmember(int i);

	int memberupdate(MypageMemberDto mMdto);

	int memberupdate2(MypageMemberDto mMdto);

	List<MypageDto2> loadMemo(String arg0, String arg1);

	List<MypageDto2> loadMemo2(int i, String arg1);

	// 캐리마이페이지 달력때문에 은경이 추가
	int carrycalendar(List<CarryMypageDto> request);

	List<CarryMypageDto> scheduleview(@Param("cridx") int cridx);

	List<CarryMypageDto> deleteschedule(@Param("cridx") int cridx);
}
