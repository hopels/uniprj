package com.web.project.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.project.board.service.BoardService;
import com.web.project.board.vo.Comment;
import com.web.project.board.vo.CommentSch;
import com.web.project.notice.service.NoticeService;

@RestController
public class BoardRestController {
	@Autowired(required=false)
	private BoardService service;
	
	@Autowired(required=false)
	private NoticeService nService;
	
	// http://localhost:5080/getCommentList.do?boardno=1
	@RequestMapping("getCommentList.do")
	public List<Comment> getCommentList(CommentSch sch){
		return service.getCommentList(sch);
	}
	
	// http://localhost:5080/getCommentSchInfo.do?boardno=1&curPage=0
	@RequestMapping("getCommentSchInfo.do")
	public CommentSch getCommentSchInfo(CommentSch sch) {
		return service.getCommentSchInfo(sch);
	}
	
	@RequestMapping("insComment.do")
	public Map<String, String> insComment(HttpSession session, Comment ins) {
		Map<String, String> map = new HashMap<String, String>();
		if(session != null && session.getAttribute("userId_session") != null) {
			String userId = (String)session.getAttribute("userId_session");
			ins.setUserno(String.valueOf(nService.getUserno_id(userId)));
			service.insComment(ins);
			map.put("proc", "댓글이 등록되었습니다.");
		}else {
			map.put("proc", "댓글 등록에 실패하였습니다.\n다시 시도해주세요");
		}
		
		return map;
	}
	
	@RequestMapping("uptComment.do")
	public Map<String, String> uptComment(Comment upt){
		Map<String, String> map = new HashMap<String, String>();
		service.uptComment(upt);
		map.put("proc", "댓글이 수정되었습니다.");
		return map;
	}
	
	@RequestMapping("delComment.do")
	public Map<String, String> uptComment(@RequestParam(value = "commentno", defaultValue = "0") int commentno){
		Map<String, String> map = new HashMap<String, String>();
		service.delComment(commentno);
		map.put("proc", "댓글이 삭제되었습니다.");
		return map;
	}
	
}
