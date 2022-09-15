package com.web.project.admin.vo;
// com.web.project.admin.vo.AuthCount
public class AuthCount {
	private String acnt;
	private String mcnt;
	private String ucnt;
	public AuthCount() {
		// TODO Auto-generated constructor stub
	}
	public AuthCount(String acnt, String mcnt, String ucnt) {
		this.acnt = acnt;
		this.mcnt = mcnt;
		this.ucnt = ucnt;
	}
	public String getAcnt() {
		return acnt;
	}
	public void setAcnt(String acnt) {
		this.acnt = acnt;
	}
	public String getMcnt() {
		return mcnt;
	}
	public void setMcnt(String mcnt) {
		this.mcnt = mcnt;
	}
	public String getUcnt() {
		return ucnt;
	}
	public void setUcnt(String ucnt) {
		this.ucnt = ucnt;
	}
	
}
