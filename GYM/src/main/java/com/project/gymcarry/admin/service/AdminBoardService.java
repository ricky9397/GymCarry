package com.project.gymcarry.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.admin.AdminBoardDto;
import com.project.gymcarry.admin.ContentDto;
import com.project.gymcarry.dao.AdminBoardDao;

@Service
public class AdminBoardService {
	
	@Autowired
	private SqlSessionTemplate template;
	private AdminBoardDao dao;

	
	// 전체 관리자 게시판 리스트 출력
	public List<AdminBoardDto> AdminBoardList() {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.selectAllAdminBoard();
	}
	
	// 관리자 게시판 작성
	public int writeAdminBoard(AdminBoardDto adminBoardDto) {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.writeAdminBoard(adminBoardDto);
	}
	
	// 기존 게시글 호출 - 수정폼 이동
	public AdminBoardDto getContentOriginal(int idx) {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.getContentOriginal(idx);
	}
	
	// 관리자 게시판 게시글 수정
	public void updateContent(AdminBoardDto adminBoardDto) {
		dao.updateContent(adminBoardDto);
	}
	
	// 관리자 게시판 게시글 삭제
	public void deleteContent(int idx) {
		dao.deleteContent(idx);
	}
	
	
	
	
	/* FOOTER 연결 START */
	
	// 게시글 출력
	public ContentDto contentView(int idx) {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.contentView(idx);
	}

	// [약관 및 정책] 카테고리 게시판 리스트 출력
	public List<AdminBoardDto> termBoardList() {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.selectTermBoardList();
	}
	
	// [공지사항] 카테고리 게시판 리스트 출력
	public List<AdminBoardDto> noticeBoardList() {
		dao = template.getMapper(AdminBoardDao.class);
		return dao.selectNoticeBoardList();
	}

	/* FOOTER 연결 END */
	
	
	
}
