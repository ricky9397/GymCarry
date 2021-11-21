package com.project.gymcarry.board.service;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.board.BoardWriteDto;
import com.project.gymcarry.board.Pagination;
import com.project.gymcarry.board.BoardLikeDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardService {

    // 게시판 전체 리스트 출력
    public List<BoardDto> getBoardList(Pagination pagination) throws Exception;

    // 게시판 소통 리스트 출력
    public List<BoardDto> getBoardComm(Pagination pagination) throws Exception;

    // 게시판 질문/답변 리스트 출력
    public List<BoardDto> getBoardQnA(Pagination pagination) throws Exception;


    // 게시판 전체 리스트 개수 확인 (페이징)
    public int getBoardListCnt() throws Exception;

    // 게시판 소통 리스트 개수 확인 (페이징)
    public int getBoardCommCnt() throws Exception;

    // 게시판 질문/답변 개수 확인 (페이징)
    public int getBoardQnAtCnt() throws Exception;



    // 게시글 입력
    public int getBoardWrite(Map<String, String> map) throws Exception;

    // 게시글 상세 페이지 출력
    public BoardDto getBoardDetail(int postidx) throws Exception;

    // 게시글 수정시 입력된 값 그대로 출력
    public BoardWriteDto getBoardUpdate(int postidx) throws Exception;

    // 게시글 수정
    public int getBoardContent(Map<String, Object> map) throws Exception;

    // 게시글 삭제
    public int getDeleteBoard(int postidx) throws Exception;

    // 조회수
    public int updateViewCnt(int postidx) throws Exception;

    // 게시물 좋아요 여부 확인
    public BoardLikeDto getBoardLike(@Param("postidx") int postidx, @Param("memidx") int memidx) throws Exception;

    // 게시물 좋아요 on
    public int getBoardLikeOn(Map<String, Object> map) throws Exception;

    // 게시물 좋아요 off
    public int getBoardLikeOff(Map<String, Object> map) throws Exception;

    // 게시물 좋아요 총 갯수
    public List<BoardLikeDto> getBoardLikeLength(int postidx) throws Exception;






}
