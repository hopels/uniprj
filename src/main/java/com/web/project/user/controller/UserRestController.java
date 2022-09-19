package com.web.project.user.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.project.user.service.LoginService;
import com.web.project.user.service.UserService;
import com.web.project.user.vo.User;

@RestController
public class UserRestController {
	@Autowired(required=false)
	private UserService service;
	@Autowired(required=false)
	private LoginService service2;
	// http://localhost:5080/userlist.do
	@RequestMapping("userlist.do")
	public List<User> userlist(){
		return service.userList();
	}
	
	// http://localhost:5080/idValidCheck.do?id=himan777
	@RequestMapping("idValidCheck.do")
	public Map<String, String> idValidCheck(User inp){
		Map<String, String> rslt = new LinkedHashMap<>();
		rslt.put("valid", service2.loginCheck2(inp));
		return rslt;
	}
	
	
}
