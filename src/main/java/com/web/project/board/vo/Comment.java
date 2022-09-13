package com.web.project.board.vo;

import java.util.Date;

public class Comment {
	private String commentno;
	private String boardno;
	private String userno;
	private String content;
	private Date regdate;
	private Date uptdate;
	private String nickname;
	private String id;
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	public Comment(String commentno, String boardno, String userno, String content, Date regdate, Date uptdate,
			String nickname, String id) {
		this.commentno = commentno;
		this.boardno = boardno;
		this.userno = userno;
		this.content = content;
		this.regdate = regdate;
		this.uptdate = uptdate;
		this.nickname = nickname;
		this.id = id;
	}
	public String getCommentno() {
		return commentno;
	}
	public void setCommentno(String commentno) {
		this.commentno = commentno;
	}
	public String getBoardno() {
		return boardno;
	}
	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUptdate() {
		return uptdate;
	}
	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
