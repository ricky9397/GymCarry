package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.PlaceListDto;

public interface AdminContentsDao {

	// 전체 플레이스 리스트
	List<PlaceListDto> selectAllPlaceList();
	// 플레이스 추가
	int registerPlace(PlaceDto placeDto);
	// 플레이스 기존 정보 호출 : 수정폼
	PlaceDto getPlaceOriginal(int placeidx);
	// 플레이스 수정
	public void updatePlace(PlaceDto placeDto);
	// 플레이스 삭제
	public void deletePlace(int placeidx);
	
	// 커뮤니티 게시판 리스트 출력
	List<BoardDto> selectCommunityList();
	// 커뮤니티 게시글 삭제 처리
	public void deleteCommunity(int postidx);
	
}
