package com.douzone.jblog.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.jblog.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	public String getId(String id) {
		return sqlSession.selectOne("user.getId", id);
	}
	
	public long insert(UserVo userVo) {
		sqlSession.insert("user.insert", userVo);
		return userVo.getNo();
	}
	
	public UserVo getByIdAndPassword(UserVo userVo) {
		return sqlSession.selectOne("user.getByIdAndPassword", userVo);
	}
}
