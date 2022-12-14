package com.web.project.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.project.notice.service.NoticeService;
import com.web.project.notice.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	// http://localhost:5080/noticePage.do
	@RequestMapping("noticePage.do")
	public String noticePage() {
		return "notice/notice";
	}
	
	// http://localhost:5080/noticeDetailPage.do
	@RequestMapping("noticeDetailPage.do")
	public String noticeDetailPage(@RequestParam(value = "noticeno", defaultValue = "0") int noticeno, Model d) {
		if(noticeno!=0) {
			d.addAttribute("noticeDetail", service.getNoticeDetail(noticeno));
		}else {
			return "redirect:/noticePage.do";
		}
		return "notice/noticeDetail";
	}
	
	// http://localhost:5080/newNotice.do
	@RequestMapping("newNoticePage.do")
	public String newNotice(HttpSession session, Model d) {
		if(session != null && session.getAttribute("userId_session") != null) {
			d.addAttribute("userno",service.getUserno_id((String)session.getAttribute("userId_session")));
		}
		return "notice/newNotice";
	}
	
	//
	@RequestMapping("insNotice.do")
	public String insNotice(Notice ins, Model d) {
		service.insNotice(ins);
		d.addAttribute("proc","ins");
		return "notice/newNotice";
	}
	
	// http://localhost:5080/uptNoticePage.do
	@RequestMapping("uptNoticePage.do")
	public String uptNoticePage(@RequestParam(value = "noticeno", defaultValue = "0") int noticeno, HttpSession session, Model d) {
		if(session != null && session.getAttribute("userId_session") != null) {
			if(noticeno!=0) {
				d.addAttribute("userno",service.getUserno_id((String)session.getAttribute("userId_session")));
				d.addAttribute("noticeDetail", service.getNoticeDetail(noticeno));
			}else {
				return "notice/notice";
			}
		}
		return "notice/uptNotice";
	}
	
	@RequestMapping("uptNotice.do")
	public String uptNotice(Notice upt, Model d, HttpSession session) {
		if(session!=null && !((String)session.getAttribute("userAuth_session")).equals("user")) {
			service.uptNotice(upt);
			d.addAttribute("proc", "upt");
		}else {
			d.addAttribute("proc", "err");
		}
		return "notice/uptNotice";
	}
	
	@RequestMapping("delNotice.do")
	public String delNotice(@RequestParam(value = "noticeno", defaultValue = "0") int noticeno, Model d, HttpSession session, HttpServletRequest request) {
		if(request.isRequestedSessionIdValid()) {
			if(session != null && !((String)session.getAttribute("userAuth_session")).equals("user")) {
				if(noticeno!=0) {
					service.delNotice(noticeno);
					d.addAttribute("proc", "del");
				}else {
					d.addAttribute("proc", "err");
				}
			}else {
				d.addAttribute("proc", "err");
			}
		}else {
			d.addAttribute("proc", "err");
		}
		
		return "notice/noticeDetail";
	}
}