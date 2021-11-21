package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.admin.AllSalesDto;
import com.project.gymcarry.admin.DashTableAddDto;
import com.project.gymcarry.admin.DashTableDto;

public interface AdminDashBordDao {

	// 캐리매출 1~4위
	List<AllSalesDto> selectAllSales(int month, long year);

	// 월별 매출
	List<AllSalesDto> selectMonthSales(long year);

	// 일별매출
	List<AllSalesDto> selectDaySales(int month, long year);

	// 월별 캐리매출 1위
	List<AllSalesDto> selectMonthRank(long year);
	
	// 매출테이블 전체리스트
	List<DashTableDto> selectAllDashTable();
	
	// 요일별 테이블 리스트
	List<DashTableAddDto> selectDayTable(int month);
	
	// 월별 테이블 리스트
	List<DashTableAddDto> selectMonthTable(long year);
	
	// 년도별 매출
	List<AllSalesDto> selectYearSales();
	
	// 캐리 매출 현황
	List<AllSalesDto> selectCarrySales(long year);
	

}
