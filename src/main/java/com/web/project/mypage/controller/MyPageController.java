package com.web.project.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.project.mypage.service.MyPageService;
import com.web.project.mypage.vo.Developer;
import com.web.project.notice.service.NoticeService;
import com.web.project.user.service.LoginService;
import com.web.project.user.vo.User;

@Controller
public class MyPageController {
	@Autowired(required=false)
	private LoginService logservice;
	
	@Autowired(required=false)
	private MyPageService service;
	
	@Autowired(required=false)
	private NoticeService nservice;
	
	// http://localhost:5080/goMyPage.do
	@RequestMapping("goMyPage.do")
	public String goMyPage(HttpSession session, Model d) {
		if(session!=null && session.getAttribute("userId_session")!=null) {
			User myPageInfo = logservice.getUserInfo_Id((String)session.getAttribute("userId_session"));
			myPageInfo.setPw("");
			d.addAttribute("user_Info", myPageInfo);
			int userno = nservice.getUserno_id((String)session.getAttribute("userId_session"));
			d.addAttribute("wb", service.writeB_cnt(userno));
			d.addAttribute("wc", service.writeC_cnt(userno));
		}
		return "user/myPage";
	}
	
	@RequestMapping("uptDevPart.do")
	public String uptDevPart(HttpSession session, Developer upt) {
		if(session!=null && session.getAttribute("userId_session")!=null) {
			String id = (String)session.getAttribute("userId_session");
			upt.setUserno(logservice.getUserInfo_Id(id).getUserno()); 
			upt.setId(id);
			service.uptDevPart(upt);
		}
		return "redirect:/goMyPage.do";
	}
	
	@RequestMapping("uptUserDetail.do")
	public String uptUserDetail(User ins, Model d) {
		service.uptUserDetail(ins);
		d.addAttribute("proc", "upt");
		return "user/myPage";
	}
	
	@RequestMapping("uptUserPw.do")
	public String uptUserPw(@RequestParam(value="newpw") String newpw ,User ins, Model d) {
		if(!newpw.equals(ins.getPw())) {
			String flag = service.uptUserPw_Check(ins);
			if(flag.equals("1")) {
				ins.setPw(newpw);
				service.uptUserPw(ins);
				d.addAttribute("proc", "uptPw");
			}else {
				d.addAttribute("proc", "falsePw");
			}
		}else {
			d.addAttribute("proc", "sPw");
		}
		
		
		return "user/myPage";
	}
}
