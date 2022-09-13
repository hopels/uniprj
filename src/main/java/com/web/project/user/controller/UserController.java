package com.web.project.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.project.user.service.UserService;
import com.web.project.user.vo.User;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	// http://localhost:5080/index.do
	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
	
	// http://localhost:5080/joinPage.do
	@RequestMapping("joinPage.do")
	public String joinPage() {
		return "join";
	}
	
	@RequestMapping("userReg.do")
	public String userReg(User ins, Model d) {
		service.regUser(ins);
		d.addAttribute("proc", "Y");
		return "join";
	}
	
}
