package com.web.project.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.project.mypage.service.MyPageService;
import com.web.project.mypage.vo.Developer;

@RestController
public class MyPageRestController {
	@Autowired(required=false)
	private MyPageService service;
	
	// http://localhost:5080/devInfoJson.do
	@RequestMapping("devInfoJson.do")
	public Developer devInfoJson(HttpSession session) {
		return service.getDevPartInfo((String)session.getAttribute("userId_session"));
	}
}
