package com.project.gymcarry.place.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.project.gymcarry.place.PlaceDto;
import com.project.gymcarry.place.service.PlaceService;

@RestController
public class PlaceListRestController {
	
	@Autowired
	private PlaceService placeHealthService;
	
	// 전체 플레이스 자동 완성 검색
	@RequestMapping(value = "/autocomplete", method = RequestMethod.POST)
	@ResponseBody
	public String AutoSearch( Model model, HttpServletRequest request,
		 HttpServletResponse resp, PlaceDto dto) throws IOException {
		 
		 String result = request.getParameter("term");
		 List<PlaceDto> list = placeHealthService.getAllPlaceSearch(result);
		 Gson gson = new Gson();
		 
		 return gson.toJson(list);
	}	
	
	// 헬스 자동 완성 검색
	@RequestMapping(value = "/autocomplete/health", method = RequestMethod.POST)
	@ResponseBody
	public String AutoSearchHealth( Model model, HttpServletRequest request,
		 HttpServletResponse resp, PlaceDto dto) throws IOException {
		
		 String result = request.getParameter("term");
		 List<PlaceDto> list = placeHealthService.getHealthPlaceSearch(result);
		 Gson gson = new Gson();
		 
		 return gson.toJson(list);
	}
	
	// 필라테스 자동 완성 검색
	@RequestMapping(value = "/autocomplete/pilates", method = RequestMethod.POST)
	@ResponseBody
	public String AutoSearchPilates( Model model, HttpServletRequest request,
		 HttpServletResponse resp, PlaceDto dto) throws IOException {
		 
		 String result = request.getParameter("term");
		 List<PlaceDto> list = placeHealthService.getPilatesPlaceSearch(result);
		 Gson gson = new Gson();
		 
		 return gson.toJson(list);
	}
	
	// 요가 자동 완성 검색
	@RequestMapping(value = "/autocomplete/yoga", method = RequestMethod.POST)
	@ResponseBody
	public String AutoSearchYoga( Model model, HttpServletRequest request,
		 HttpServletResponse resp, PlaceDto dto) throws IOException {
		 
		 String result = request.getParameter("term");
		 List<PlaceDto> list = placeHealthService.getYogaPlaceSearch(result);
		 Gson gson = new Gson();
		 
		 return gson.toJson(list);
	}
	



	
	
}