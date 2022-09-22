package com.web.project.main.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.project.board.service.BoardService;
import com.web.project.board.vo.BoardSch;
import com.web.project.config.VerifyRecaptcha;
import com.web.project.notice.service.NoticeService;
import com.web.project.notice.vo.NoticeSch;
import com.web.project.user.service.LoginService;

@Controller
public class MainController {
	@Autowired(required=false)
	private NoticeService nService;
	
	@Autowired(required=false)
	private BoardService bService;
	
	@Autowired(required=false)
	private LoginService lService;
	
	//@Value("${recaptcha-key}")
	//private String recaptcha_key;

	// http://localhost:5080/MainPage.do
	@RequestMapping("MainPage.do")
	public String MainPage(HttpSession session, NoticeSch sch1, BoardSch sch2, Model d) {
		d.addAttribute("notice_list", nService.getNoticeList(sch1));
		d.addAttribute("board_list", bService.getBoardList(sch2));
		if(session != null && session.getAttribute("userId_session") != null) {
			d.addAttribute("user_info", lService.getUserInfo_Id((String)session.getAttribute("userId_session")));
		}
		return "main/main";
	}
	
	@Value("${recaptcha-key-secret}")
	private String secretKey;
	
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey(secretKey);
		String gRecaptchaResponse = request.getParameter("recaptcha");
		System.out.println(gRecaptchaResponse);
		// 0 성공, 1 실패, -1 오류
		try {
			if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
				return 0;
			}else {
				return 1;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
