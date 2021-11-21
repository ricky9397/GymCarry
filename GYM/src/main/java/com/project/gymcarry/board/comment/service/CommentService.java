package com.project.gymcarry.board.comment.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.board.comment.CommentDto;
import com.project.gymcarry.dao.CommentDao;

@Service
public class CommentService {

    @Autowired
    private SqlSessionTemplate template;
    private CommentDao dao;

    // 게시글 전체 출력
    public List<CommentDto> getCommList(int postidx) {
        dao = template.getMapper(CommentDao.class);
        return dao.selectCommList(postidx);
    }

	public int insertComm(Map<String, Object> map) {
		dao = template.getMapper(CommentDao.class);
        return dao.insertCommList(map);
	}
    
    

}