package com.web.project.map.vo;
// com.web.project.map.vo.Map
public class Map {
	private int comno;
	private String comname;
	private String comaddress;
	private String comtel;
	public Map() {
		// TODO Auto-generated constructor stub
	}
	public Map(int comno, String comname, String comaddress, String comtel) {
		this.comno = comno;
		this.comname = comname;
		this.comaddress = comaddress;
		this.comtel = comtel;
	}
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getComaddress() {
		return comaddress;
	}
	public void setComaddress(String comaddress) {
		this.comaddress = comaddress;
	}
	public String getComtel() {
		return comtel;
	}
	public void setComtel(String comtel) {
		this.comtel = comtel;
	}
	
}
