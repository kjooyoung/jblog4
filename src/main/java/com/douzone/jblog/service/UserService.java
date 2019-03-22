package com.douzone.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.douzone.jblog.repository.BlogDao;
import com.douzone.jblog.repository.CategoryDao;
import com.douzone.jblog.repository.UserDao;
import com.douzone.jblog.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private BlogDao blogDao;
	@Autowired
	private CategoryDao categoryDao;
	
	public boolean checkId(String id) {
		if(userDao.getId(id) == null){
			return true;
		}
		return false;
	}
	
	public void insert(UserVo userVo) {
		userDao.insert(userVo);
		userVo.setName(userVo.getName()+"님의 블로그");
		blogDao.insert(userVo);
		categoryDao.insertDefault(userVo);
	}
	
	public UserVo login(UserVo userVo) {
		return userDao.getByIdAndPassword(userVo);
	}
}
