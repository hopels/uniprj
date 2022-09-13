package com.web.project.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.project.board.service.BoardService;
import com.web.project.board.vo.Board;
import com.web.project.board.vo.BoardSch;
import com.web.project.notice.service.NoticeService;

@Controller
public class BoardController {
	@Autowired(required=false)
	private BoardService service;
	
	@Autowired(required=false)
	private NoticeService nService;
	
	// http://localhost:5080/boardList.do
	@RequestMapping("boardList.do")
	public String boardList(BoardSch sch, Model d) {
		d.addAttribute("blist", service.getBoardList(sch));
		return "freeboard";
	}
	
	// http://localhost:5080/newBoard.do
	@RequestMapping("newBoard.do")
	public String newBoard(HttpSession session, Model d) {
		if(session != null && session.getAttribute("userId_session") != null) {
			d.addAttribute("userno", nService.getUserno_id((String)session.getAttribute("userId_session")));
		}
		return "newFreeBoard";
	}
	
	@RequestMapping("insBoard.do")
	public String insBoard(Board ins, Model d) {
		service.insBoard(ins);
		d.addAttribute("proc", "ins");
		return "newFreeBoard";
	}
	
	// http://localhost:5080/boardDetail.do?boardno=2
	@RequestMapping("boardDetail.do")
	public String boardDetail(HttpSession session,@RequestParam(value = "boardno", defaultValue = "0") int boardno, Model d) {
		if(session != null && session.getAttribute("userId_session") != null) {
			d.addAttribute("userno", nService.getUserno_id((String)session.getAttribute("userId_session")));
		}
		if(boardno == 0) {
			d.addAttribute("proc", "err");
			return "boardDetail";
		}
		d.addAttribute("boardDetail", service.boardDetail(boardno));
		return "boardDetail";
	}
	
	// http://localhost:5080/uptBoardPage.do
	@RequestMapping("uptBoardPage.do")
	public String uptBoardPage(HttpSession session, @RequestParam(value = "boardno", defaultValue = "0") int boardno, Model d) {
		if(session != null && session.getAttribute("userId_session") != null) {
			d.addAttribute("userno", nService.getUserno_id((String)session.getAttribute("userId_session")));
		}
		if(boardno == 0) {
			d.addAttribute("proc", "err");
			return "redirect:/boardList.do";
		}
		d.addAttribute("boardDetail", service.boardDetail(boardno));
		return "uptBoard";
	}
	
	@RequestMapping("uptBoard.do")
	public String uptBoard(Board upt, Model d) {
		service.uptBoard(upt);
		d.addAttribute("proc", "upt");
		return "uptBoard";
	}
	
	@RequestMapping("delBoard.do")
	public String delBoard(@RequestParam(value = "boardno", defaultValue = "0") int boardno, Model d) {
		if(boardno == 0) {
			d.addAttribute("proc", "err");
			return "boardDetail";
		}
		service.delBoard(boardno);
		d.addAttribute("proc", "del");
		return "boardDetail";
	}
	// git commit 테스트
}
