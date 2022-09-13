package com.web.project.notice.vo;

import java.util.Date;
// com.web.project.notice.vo.Notice
public class Notice {
	private String noticeno;
	private String userno;
	private String title;
	private String content;
	private Date regdate;
	private Date uptdate;
	private String regdate_s;
	private String uptdate_s;
	private String nickname;
	
	public Notice() {
		
	}
	public Notice(String noticeno, String userno, String title, String content, Date regdate, Date uptdate) {
		this.noticeno = noticeno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.uptdate = uptdate;
	}
	public Notice(String noticeno, String userno, String title, String content, String regdate_s, String uptdate_s) {
		super();
		this.noticeno = noticeno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.regdate_s = regdate_s;
		this.uptdate_s = uptdate_s;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
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
	public Date getUptdate() {
		return uptdate;
	}
	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}
	public String getRegdate_s() {
		return regdate_s;
	}
	public void setRegdate_s(String regdate_s) {
		this.regdate_s = regdate_s;
	}
	public String getUptdate_s() {
		return uptdate_s;
	}
	public void setUptdate_s(String uptdate_s) {
		this.uptdate_s = uptdate_s;
	}
}
