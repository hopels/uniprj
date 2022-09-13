package com.web.project.mypage.vo;
// com.web.project.mypage.vo.Developer
public class Developer {
	public Developer(String id, String userno, String jobtype) {
		this.id = id;
		this.userno = userno;
		this.jobtype = jobtype;
	}
	private String id;
	private String userno;
	private String jobtype;
	public Developer() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
}
