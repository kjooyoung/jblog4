package com.douzone.jblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.jblog.service.UserService;

@Controller("apiUserController")
@RequestMapping("/user/api")
public class UserController {
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/checkId")
	public JSONResult checkId(@RequestParam(value="id", required=true, defaultValue="") String id) {
		return JSONResult.success(userService.checkId(id));
	}
}
