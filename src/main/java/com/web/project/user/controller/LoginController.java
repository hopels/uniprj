package com.web.project.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.project.user.service.LoginService;
import com.web.project.user.vo.User;

@Controller
public class LoginController {
	@Autowired(required=false)
	private LoginService service;
	
	// http://localhost:5080/login.do
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("loginCheck.do")
	public String loginCheck(HttpSession session, User inp, Model d) {
		d.addAttribute("proc", service.loginCheck(inp));
		if(service.loginCheck(inp).equals("pass")) {
			session.setAttribute("userId_session", service.getUserInfo_Id(inp.getId()).getId());
			session.setAttribute("userAuth_session", service.getUserInfo_Id(inp.getId()).getAuth());
		}
		
		return "login";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model d) {
		session.invalidate();
		d.addAttribute("isLogout", "logout");
		return "main";
	}
}
