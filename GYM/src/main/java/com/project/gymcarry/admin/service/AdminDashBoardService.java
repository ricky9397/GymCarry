package com.project.gymcarry.admin.service;

import java.util.List;

import com.project.gymcarry.admin.AllSalesDto;
import com.project.gymcarry.admin.DashTableAddDto;
import com.project.gymcarry.admin.DashTableDto;

public interface AdminDashBoardService {

	// 1~4위
	List<AllSalesDto> getAllSales(int month, long year);

	// 월별그래프
	List<AllSalesDto> getMonthSales(long year);

	// 요일별그래프
	List<AllSalesDto> getDaySales(int month, long year);

	// 년도별 그래프
	List<AllSalesDto> getYearSales();

	// 월별 캐리 매출 1위
	List<AllSalesDto> getMonthRank(long year);

	// 전체테이블리스트
	List<DashTableDto> getAllDasghTable();

	// 최근요일별 테이블 리스트
	List<DashTableAddDto> getDayTable(int month);

	// 최근년도 월별 테이블 리스트
	List<DashTableAddDto> getMonthTable(long year);
	
	// 캐리 월별 매출 현황
	List<AllSalesDto> getCarrySales(long year);

}
