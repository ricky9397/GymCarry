package com.project.gymcarry.dao;

import java.util.List;
import java.util.Map;

import com.project.gymcarry.board.comment.CommentDto;

public interface CommentDao {

	// 댓글 리스트 출력
    List<CommentDto> selectCommList(int postidx);
    
    // 게시판 글쓰기
    Integer insertCommList(Map<String, Object> map);
    
    //Integer insertCommList(CommentDto comment);
    
    
}