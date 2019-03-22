package com.douzone.jblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.jblog.service.CommentService;
import com.douzone.jblog.vo.CommentVo;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@ResponseBody
	@RequestMapping("/insert")
	public JSONResult insert(@ModelAttribute CommentVo commentVo) {
		return JSONResult.success(commentService.insert(commentVo));
	}
	
	@ResponseBody
	@RequestMapping("/{postNo}")
	public JSONResult list(@PathVariable("postNo") Long postNo) {
		return JSONResult.success(commentService.getList(postNo));
	}
	
	@ResponseBody
	@RequestMapping("/delete/{no}")
	public JSONResult delete(@PathVariable("no") Long no) {
		return JSONResult.success(commentService.delete(no));
	}
	
	@ResponseBody
	@RequestMapping("/update/{no}")
	public JSONResult update(@PathVariable("no") Long no, 
							@ModelAttribute CommentVo commentVo) {
		commentVo.setNo(no);
		return JSONResult.success(commentService.update(commentVo));
	}
}
