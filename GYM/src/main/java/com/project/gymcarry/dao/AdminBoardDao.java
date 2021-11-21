package com.project.gymcarry.dao;

import java.util.List;

import com.project.gymcarry.admin.AdminBoardDto;
import com.project.gymcarry.admin.ContentDto;

public interface AdminBoardDao {

	// 전체 관리자 게시글 리스트
	List<AdminBoardDto> selectAllAdminBoard();

	// 관리자 게시글 작성
	int writeAdminBoard(AdminBoardDto adminBoardDto);
	// 게시글 기존 정보 호출 : 수정폼
	AdminBoardDto getContentOriginal(int idx);
	// 게시글 수정
	public void updateContent(AdminBoardDto adminBoardDto);
	// 게시글 삭제
	public void deleteContent(int idx);
	
	
	/* footer연결 */
	
	// 게시글 출력
	ContentDto contentView(int idx);
	
	// [약관 및 정책] 카테고리 게시판 리스트 출력
	List<AdminBoardDto> selectTermBoardList();
	
	// [공지사항] 카테고리 게시판 리스트 출력
	List<AdminBoardDto> selectNoticeBoardList();


}
