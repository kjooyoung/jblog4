package com.douzone.jblog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.jblog.vo.UserVo;

@Controller
public class MainController {
	
	@RequestMapping({"","main"})
	public String main(HttpSession session) {
		UserVo vo = (UserVo)session.getAttribute("authUser");
		if( vo != null) {
			System.out.println(vo.getId());
		}
		return "main/index";
	}
}
