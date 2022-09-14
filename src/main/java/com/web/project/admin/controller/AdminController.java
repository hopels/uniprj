package com.web.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.project.user.service.UserService;

@Controller
public class AdminController {
	@Autowired(required=false)
	private UserService service;
	
	@RequestMapping("adminPage.do")
	public String adminPage(Model d) {
		d.addAttribute("userList", service.userList());
		return "adminPage";
	}
}
