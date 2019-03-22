package com.douzone.jblog.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.jblog.repository.BlogDao;
import com.douzone.jblog.repository.CategoryDao;
import com.douzone.jblog.repository.PostDao;
import com.douzone.jblog.vo.BlogVo;

@Service
public class BlogService {
	@Autowired
	private BlogDao blogDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private CategoryDao categoryDao;
	
	public Map<String, Object> getBlog(Map<String, Object> paramMap) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("id", (String)paramMap.get("id"));
		result.put("blog", blogDao.getById((String)paramMap.get("id")));
		System.out.println(postDao.get(paramMap));
		result.put("post", postDao.get(paramMap));
		result.put("postList", postDao.getList(paramMap));
		result.put("categoryList", categoryDao.getList((String)paramMap.get("id")));
		return result;
	}
	
}
