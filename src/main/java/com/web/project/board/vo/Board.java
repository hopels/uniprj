package com.web.project.board.vo;

import java.util.Date;
// com.web.project.board.vo.Board
public class Board {
	private String boardno;
	private String userno;
	private String title;
	private String content;
	private Date regdate;
	private String regdate_s;
	private Date uptdate;
	private String uptdate_s;
	private String fname;
	private String fpath;
	private String nickname;
	private String readcnt;
	public Board() {
		// TODO Auto-generated constructor stub
	}
	public Board(String boardno, String userno, String title, String content, String regdate_s, String uptdate_s,
			String fname, String fpath, String nickname, String readcnt) {
		this.boardno = boardno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.regdate_s = regdate_s;
		this.uptdate_s = uptdate_s;
		this.fname = fname;
		this.fpath = fpath;
		this.nickname = nickname;
		this.readcnt = readcnt;
	}
	public Board(String boardno, String userno, String title, String content, Date regdate, Date uptdate, String fname,
			String fpath, String nickname, String readcnt) {
		this.boardno = boardno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.uptdate = uptdate;
		this.fname = fname;
		this.fpath = fpath;
		this.nickname = nickname;
		this.readcnt = readcnt;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getRegdate_s() {
		return regdate_s;
	}
	public void setRegdate_s(String regdate_s) {
		this.regdate_s = regdate_s;
	}
	public Date getUptdate() {
		return uptdate;
	}
	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}
	public String getUptdate_s() {
		return uptdate_s;
	}
	public void setUptdate_s(String uptdate_s) {
		this.uptdate_s = uptdate_s;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFpath() {
		return fpath;
	}
	public void setFpath(String fpath) {
		this.fpath = fpath;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}
	
}
