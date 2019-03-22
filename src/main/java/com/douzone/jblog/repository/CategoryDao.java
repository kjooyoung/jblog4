package com.douzone.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.jblog.vo.CategoryVo;
import com.douzone.jblog.vo.UserVo;

@Repository
public class CategoryDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertDefault(UserVo userVo) {
		return sqlSession.insert("category.insertDefault", userVo);
	}
	
	public List<CategoryVo> getList(String id){
		return sqlSession.selectList("category.getList", id);
	}
	
	public List<CategoryVo> getListByNo(Long no){
		return sqlSession.selectList("category.getListByNo", no);
	}
	
	public int insert(CategoryVo categoryVo) {
		return sqlSession.insert("category.insert", categoryVo);
	}
	
	public int delete(Long no) {
		return sqlSession.delete("category.delete", no);
	}
	
	public int getCountById(String id) {
		return sqlSession.selectOne("category.getCountById", id);
	}
}
