package com.douzone.jblog.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.jblog.vo.PostVo;

@Repository
public class PostDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(PostVo postVo) {
		return sqlSession.insert("post.insert", postVo);
	}
	
	public List<PostVo> getList(Map<String, Object> map){
		return sqlSession.selectList("post.getList", map);
	}
	
	public PostVo get(Map<String, Object> map) {
		return sqlSession.selectOne("post.get", map);
	}
}
