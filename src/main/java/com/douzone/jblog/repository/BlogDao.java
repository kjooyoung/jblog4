package com.douzone.jblog.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.jblog.vo.BlogVo;
import com.douzone.jblog.vo.UserVo;

@Repository
public class BlogDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(UserVo userVo) {
		return sqlSession.insert("blog.insert",userVo);
	}
	
	public BlogVo getById(String id) {
		return sqlSession.selectOne("blog.getById", id);
	}
	
	public BlogVo getByNo(Long no) {
		return sqlSession.selectOne("blog.getByNo", no);
	}
	
	public int update(BlogVo blogVo) {
		return sqlSession.update("blog.update", blogVo);
	}
}
