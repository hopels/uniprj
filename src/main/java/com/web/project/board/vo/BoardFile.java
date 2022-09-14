package com.web.project.board.vo;

public class BoardFile {
	private String fileno;
	private String boardno;
	private String originfname;
	private String fname;
	public BoardFile() {
		// TODO Auto-generated constructor stub
	}
	public BoardFile(String fileno, String boardno, String originfname, String fname) {
		this.fileno = fileno;
		this.boardno = boardno;
		this.originfname = originfname;
		this.fname = fname;
	}
	
	public BoardFile(String boardno, String originfname, String fname) {
		this.boardno = boardno;
		this.originfname = originfname;
		this.fname = fname;
	}
	public String getFileno() {
		return fileno;
	}
	public void setFileno(String fileno) {
		this.fileno = fileno;
	}
	public String getBoardno() {
		return boardno;
	}
	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}
	public String getOriginfname() {
		return originfname;
	}
	public void setOriginfname(String originfname) {
		this.originfname = originfname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
}
