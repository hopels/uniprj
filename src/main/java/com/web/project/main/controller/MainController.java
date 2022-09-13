package com.web.project.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.project.board.service.BoardService;
import com.web.project.board.vo.BoardSch;
import com.web.project.notice.service.NoticeService;
import com.web.project.notice.vo.NoticeSch;

@Controller
public class MainController {
	@Autowired(required=false)
	private NoticeService nService;
	
	@Autowired(required=false)
	private BoardService bService;

	// http://localhost:5080/MainPage.do
	@RequestMapping("MainPage.do")
	public String MainPage(NoticeSch sch1, BoardSch sch2, Model d) {
		d.addAttribute("notice_list", nService.getNoticeList(sch1));
		d.addAttribute("board_list", bService.getBoardList(sch2));
		
		return "main";
	}
}
