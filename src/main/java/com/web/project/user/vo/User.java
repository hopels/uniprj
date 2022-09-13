package com.web.project.user.vo;

import java.util.Date;

public class User {
	private String userno;
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private Date joindate;
	private String auth;
	public User() {
		
	}
	public User(String userno, String id, String pw, String nickname, String email, Date joindate, String auth) {
		super();
		this.userno = userno;
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.email = email;
		this.joindate = joindate;
		this.auth = auth;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
}
