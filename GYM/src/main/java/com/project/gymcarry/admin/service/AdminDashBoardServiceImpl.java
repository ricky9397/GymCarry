package com.project.gymcarry.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.admin.AllSalesDto;
import com.project.gymcarry.admin.DashTableAddDto;
import com.project.gymcarry.admin.DashTableDto;
import com.project.gymcarry.dao.AdminDashBordDao;

@Service
public class AdminDashBoardServiceImpl implements AdminDashBoardService {
	
	@Autowired
	private SqlSessionTemplate template;
	private AdminDashBordDao dao;
	
	@Override
	public List<AllSalesDto> getAllSales(int month, long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectAllSales(month, year);
	}
	
	@Override
	public List<AllSalesDto> getMonthSales(long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectMonthSales(year);
	}
	
	@Override
	public List<AllSalesDto> getDaySales(int month, long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectDaySales(month, year);
	}
	
	@Override
	public List<AllSalesDto> getMonthRank(long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectMonthRank(year);
	}
	
	@Override
	public List<DashTableDto> getAllDasghTable() {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectAllDashTable();
	}

	@Override
	public List<DashTableAddDto> getDayTable(int month) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectDayTable(month);
	}

	@Override
	public List<DashTableAddDto> getMonthTable(long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectMonthTable(year);
	}

	@Override
	public List<AllSalesDto> getYearSales() {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectYearSales();
	}

	@Override
	public List<AllSalesDto> getCarrySales(long year) {
		dao = template.getMapper(AdminDashBordDao.class);
		return dao.selectCarrySales(year);
	}
	
	
}
