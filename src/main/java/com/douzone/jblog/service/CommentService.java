package com.douzone.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.jblog.repository.CommentDao;
import com.douzone.jblog.vo.CommentVo;

@Service
public class CommentService {
	@Autowired
	private CommentDao commentDao;
	
	public CommentVo insert(CommentVo commentVo) {
		commentDao.insert(commentVo);
		return commentDao.get(commentVo.getNo());
	}
	
	public List<CommentVo> getList(Long postNo){
		return commentDao.getList(postNo);
	}
	
	public boolean delete(Long no) {
		if(commentDao.delete(no) != 0) {
			return true;
		}
		return false;
	}
	
	public boolean update(CommentVo commentVo) {
		if(commentDao.update(commentVo) != 0) {
			return true;
		}
		return false;
	}
}
