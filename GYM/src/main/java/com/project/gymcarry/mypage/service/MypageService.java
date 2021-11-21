package com.project.gymcarry.mypage.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carry.CarryMypageDto;
import com.project.gymcarry.dao.MypageDao;
import com.project.gymcarry.mypage.MypageDto2;

@Service
public class MypageService {

	@Autowired
	private SqlSessionTemplate template;

	private MypageDao dao;

	public int memberMemo(MypageDto2 mypdto) {
		dao = template.getMapper(MypageDao.class);
		return dao.insertMemo(mypdto);
	}

	public int updateMemo(MypageDto2 mypdto) {
		dao = template.getMapper(MypageDao.class);
		return dao.updateMemo(mypdto);
	}

	public List<MypageDto2> selectMemo(String memidx, String infodate, String infotype) {
		dao = template.getMapper(MypageDao.class);
		return dao.selectMemo(memidx, infodate, infotype);
	}

	public List<MypageDto2> loadMemo(String arg0, String arg1) {
		dao = template.getMapper(MypageDao.class);
		return dao.loadMemo(arg0, arg1);
	}

	public List<MypageDto2> loadMemo2(int i, String arg1) {
		dao = template.getMapper(MypageDao.class);
		return dao.loadMemo2(i, arg1);
	}

	// 캐리마이페이지 달력때문에 은경이 추가
	public int carrycalendar(List<CarryMypageDto> request) {
		dao = template.getMapper(MypageDao.class);
		return dao.carrycalendar(request);
	}

	public List<CarryMypageDto> scheduleview(int cridx) {
		dao = template.getMapper(MypageDao.class);
		return dao.scheduleview(cridx);
	}

	public List<CarryMypageDto> deleteschedule(int cridx) {
		dao = template.getMapper(MypageDao.class);
		return dao.deleteschedule(cridx);
	}

}
