package com.douzone.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.jblog.vo.CommentVo;

@Repository
public class CommentDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(CommentVo commentVo) {
		return sqlSession.insert("comment.insert", commentVo);
	}
	
	public List<CommentVo> getList(Long postNo){
		return sqlSession.selectList("comment.getList", postNo);
	}
	
	public CommentVo get(Long no) {
		return sqlSession.selectOne("comment.get", no);
	}
	
	public int delete(Long no) {
		return sqlSession.delete("comment.delete", no);
	}
	
	public int update(CommentVo commentVo) {
		return sqlSession.update("comment.update", commentVo);
	}
}
