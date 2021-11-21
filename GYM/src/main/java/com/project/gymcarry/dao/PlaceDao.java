package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.place.PlaceDto;

public interface PlaceDao {
	
	// 플레이스 전체 보기
    List<PlaceDto> selectAllPlaceList();
	
	// 헬스 플레이스 전체 정보
    List<PlaceDto> selectHealthPlaceList();
    
    // 필라테스 플레이스 전체 정보
    List<PlaceDto> selectPilatesPlaceList() ;
    
    // 요가 플레이스 전체 정보
    List<PlaceDto> selectYogaPlaceList() ;

    // 플레이스 상세 페이지 정보
    PlaceDto selectHealthPlaceInfo(int placeidx);

    // 전체 검색 자동 완성
    List<PlaceDto> selectAllPlaceSearch(String keyword);
    
    // 헬스 검색 자동 완성
    List<PlaceDto> selectHealthPlaceSearch(String keyword);    

    // 필라테스 검색 자동 완성
    List<PlaceDto> selectPilatesPlaceSearch(String keyword);    
    
    // 요가 검색 자동 완성
    List<PlaceDto> selectYogaPlaceSearch(String keyword);
    
    // 검색 상세 정보 페이지로 이동
	PlaceDto selectSearchHealthDetail(String placename);
	
}