package com.project.gymcarry.carry.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carry.CarryCertiDto;
import com.project.gymcarry.carry.CarryDto;
import com.project.gymcarry.carry.CarryListDto;
import com.project.gymcarry.carry.CarryPriceDto;
import com.project.gymcarry.carry.CarryReviewDto;
import com.project.gymcarry.dao.CarryDao;
import com.project.gymcarry.place.PlaceDto;

@Service
public class CarryInfoService {

	@Autowired
	private SqlSessionTemplate template;
	private CarryDao dao;

	// 캐리 정보
	public CarryDto getCarryDetail(int cridx) {
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryDetail(cridx);
	}

	// 캐리 수업 가격 정보
	public List<CarryPriceDto> getCarryPriceList(int cridx) {
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryPriceList(cridx);
	}

	// 캐리 자격 및 경력 정보
	public CarryCertiDto getCarryCerti(int cridx) {
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryCerti(cridx);
	}
	
	// 플레이스 정보(캐리 상세페이지 내)
	public PlaceDto getCarryPlaceInfo(int cridx) {
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryPlaceDetail(cridx);
	}


	
	// 캐리 리뷰 리스트
	public List<CarryReviewDto> getCarryReviewList(int cridx) {
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryReviewList(cridx);
	}

	// 캐리 리뷰 등록
	public int addCarryReview(CarryReviewDto reviewDto) {
		dao = template.getMapper(CarryDao.class);
		return dao.addCarryReview(reviewDto);
	}

	
	// 전체 캐리 리스트
	public List<CarryListDto> getAllCarryList(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectAllCarryList();
	}
	// 전체 캐리 리스트 - 가격순
	public List<CarryListDto> getAllCarryListP() {
		dao = template.getMapper(CarryDao.class);
		return dao.selectAllCarryListP();
	}
	
	
	// 매칭 캐리리스트 - [여자/헬스]
	public List<CarryListDto> getCarryListFH(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListFH();
	}
	// 매칭 캐리리스트 - [여자/필라테스]
	public List<CarryListDto> getCarryListFF(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListFF();
	}
	// 매칭 캐리리스트 - [여자/요가]
	public List<CarryListDto> getCarryListFY(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListFY();
	}
	
	
	// 매칭 캐리리스트 - [남자/헬스]
	public List<CarryListDto> getCarryListMH(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListMH();
	}
	// 매칭 캐리리스트 - [남자/필라테스]
	public List<CarryListDto> getCarryListMF(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListMF();
	}
	// 매칭 캐리리스트 - [남자/요가]
	public List<CarryListDto> getCarryListMY(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryListMY();
	}
	
	
	// 캐리 리뷰 전체 리스트(index)
	public List<CarryReviewDto> getCarryReviewListAll(){
		dao = template.getMapper(CarryDao.class);
		return dao.selectCarryReviewListAll();
	}
	
	
}
