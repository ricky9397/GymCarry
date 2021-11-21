package com.project.gymcarry.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.gymcarry.admin.AllSalesDto;
import com.project.gymcarry.admin.DashTableAddDto;
import com.project.gymcarry.admin.DashTableDto;
import com.project.gymcarry.admin.service.AdminDashBoardService;

@Controller
public class AdminDashBoardController {

	@Autowired
	private AdminDashBoardService adminDashBoardService;

	// 대쉬보드 페이지로 이동
	@GetMapping("admin/dashboard")
	public String getAllDashTable(Model model) {
		SimpleDateFormat formatDay = new SimpleDateFormat("MM");
		SimpleDateFormat formatYear = new SimpleDateFormat("YYYY");
		Date time = new Date();
		String day = formatDay.format(time);
		String year = formatYear.format(time);
		model.addAttribute("day", day);
		model.addAttribute("year", year);
		return "admin/dashboard";
	}

	// 전체매출 디폴트
	@GetMapping("admin/allSales")
	public String getAllSalesDash() {
		return "admin/dashAllSales";
	}

	// 대쉬보드 전체매출
	@GetMapping("/admin/allSaleMan")
	@ResponseBody
	public Map<String, Object> allSalesDash(@RequestParam("month") int month, @RequestParam("year") long year) {
		List<AllSalesDto> list = adminDashBoardService.getAllSales(month, year);
		List<AllSalesDto> monthList = adminDashBoardService.getMonthSales(year);
		List<AllSalesDto> dayList = adminDashBoardService.getDaySales(month, year); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kingSales", list);
		map.put("monthSales", monthList);
		map.put("daySales", dayList);
		return map;
	}
	
	@GetMapping("/admin/dash")
	@ResponseBody
	public Map<String, Object> getDashBoard(@RequestParam("year") long year) {
		List<AllSalesDto> monthList = adminDashBoardService.getMonthSales(year);
		List<AllSalesDto> rankList = adminDashBoardService.getMonthRank(year);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("monthDash", monthList);
		map.put("rankDash", rankList);
		return map;
	}

	@GetMapping("/admin/daylist")
	@ResponseBody
	public Map<String, Object> getDayList(@RequestParam("month") int month, @RequestParam("year") long year) {
		List<DashTableAddDto> list = adminDashBoardService.getDayTable(month);
		List<AllSalesDto> dayList = adminDashBoardService.getDaySales(month, year);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dayList", list);
		map.put("dayDash", dayList);
		return map;
	}

	@GetMapping("/admin/monthlist")
	@ResponseBody
	public Map<String, Object> getMonthList(@RequestParam("year") long year) {
		List<DashTableAddDto> list = adminDashBoardService.getMonthTable(year);
		List<AllSalesDto> monthList = adminDashBoardService.getMonthSales(year);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("monthList", list);
		map.put("monthDash", monthList);
		return map;
	}

	@GetMapping("/admin/yearlist")
	@ResponseBody
	public Map<String, Object> getYearList() {
		List<DashTableDto> list = adminDashBoardService.getAllDasghTable();
		List<AllSalesDto> yearList = adminDashBoardService.getYearSales();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("yearAllList", list);
		map.put("yearDash", yearList);
		return map;
	}
	
	@GetMapping("/admin/ranklist")
	@ResponseBody
	public Map<String, Object> getRankList(@RequestParam("year") long year) {
		List<AllSalesDto> rankList = adminDashBoardService.getMonthRank(year);
		List<AllSalesDto> carrySalesList = adminDashBoardService.getCarrySales(year);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rankDash", rankList);
		map.put("carrySales", carrySalesList);
		return map;
	}
	
	
}
