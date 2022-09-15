package com.web.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.project.admin.service.AdminService;
import com.web.project.user.service.UserService;
import com.web.project.user.vo.User;

@Controller
public class AdminController {
	@Autowired(required=false)
	private UserService uService;
	
	@Autowired(required=false)
	private AdminService service;
	
	@RequestMapping("adminPage.do")
	public String adminPage(Model d) {
		d.addAttribute("userList", uService.userList());
		d.addAttribute("authCnt", service.getAuthCount());
		return "adminPage";
	}
	
	@RequestMapping("uptAuth.do")
	public String uptAuth(User upt, Model d) {
		service.uptAuth(upt);
		d.addAttribute("proc", "uptAuth");
		return "adminPage";
	}
}
