package com.project.gymcarry.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.dao.AdminContentsDao;
import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.PlaceListDto;

@Service
public class AdminContentsService {
	
	@Autowired
	private SqlSessionTemplate template;
	private AdminContentsDao dao;
	
	
	// 전체 플레이스 리스트
	public List<PlaceListDto> allPlaceList() {
		dao = template.getMapper(AdminContentsDao.class);
		return dao.selectAllPlaceList();
	}
	// 플레이스 신규 등록
	public int registerPlace(PlaceDto placeDto) {
		dao = template.getMapper(AdminContentsDao.class);
		return dao.registerPlace(placeDto);
	}
	// 플레이스 기본 정보 호출 - 수정페이지
	public PlaceDto getPlaceOriginal(int placeidx) {
		dao = template.getMapper(AdminContentsDao.class);
		return dao.getPlaceOriginal(placeidx);
	}
	// 플레이스 수정
	public void updatePlace(PlaceDto placeDto) {
		dao.updatePlace(placeDto);
	}
	// 플레이스 삭제
	public void deletePlace(int placeidx) {
		dao.deletePlace(placeidx);
	}

	
	// 전체 관리자 게시판 리스트 출력
	public List<BoardDto> AdminCommunityList() {
		dao = template.getMapper(AdminContentsDao.class);
		return dao.selectCommunityList();
	}
	// 관리자 게시판 게시글 삭제
	public void deleteCommunity(int postidx) {
		dao.deleteCommunity(postidx);
	}

}
