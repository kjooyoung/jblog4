package com.douzone.jblog.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.jblog.service.BlogService;

@Controller
@RequestMapping("/{id:(?!assets|up).*}")
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	@RequestMapping({"","/{categoryNo}","/{categoryNo}/{postNo}"})
	public String main(@PathVariable("id") String id,
			@PathVariable("categoryNo") Optional<Long> categoryNo,
			@PathVariable("postNo") Optional<Long> postNo,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(categoryNo.isPresent()) {
			map.put("categoryNo", categoryNo.get());
		}else {
			map.put("categoryNo", null);
		}
		
		if(postNo.isPresent()) {
			map.put("postNo", postNo.get());
		}else {
			map.put("postNo", null);
		}
		map.put("id", id);
		model.addAllAttributes(blogService.getBlog(map));
		return "blog/blog-main";
	}
	
}
