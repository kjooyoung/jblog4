package com.douzone.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.jblog.repository.BlogDao;
import com.douzone.jblog.repository.CategoryDao;
import com.douzone.jblog.repository.PostDao;
import com.douzone.jblog.vo.BlogVo;
import com.douzone.jblog.vo.CategoryVo;
import com.douzone.jblog.vo.PostVo;

@Service
public class AdminService {
	@Autowired
	private BlogDao blogDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private CategoryDao categoryDao;
	
	public void update(BlogVo blogVo) {
		blogDao.update(blogVo);
	}
	
	public BlogVo getBlogInfo(String id) {
		return blogDao.getById(id);
	}
	
	public List<CategoryVo> getList(String id){
		return categoryDao.getList(id);
	}
	
	public int insertCategory(CategoryVo categoryVo, String id) {
		categoryDao.insert(categoryVo);
		return categoryDao.getCountById(id);
	}
	
	public void insertPost(PostVo postVo) {
		postDao.insert(postVo);
	}
	
	public boolean deleteCategory(Long no) {
		if(categoryDao.delete(no) == 1) {
			return true;
		}
		return false;
	}
}
