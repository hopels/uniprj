package com.web.project.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.mypage.mapper.MyPageMapper;
import com.web.project.mypage.vo.Developer;
import com.web.project.user.mapper.LoginMapper;
import com.web.project.user.vo.User;

@Service
public class MyPageService {
	@Autowired(required=false)
	private MyPageMapper mapper;
	
	@Autowired(required=false)
	private LoginMapper logmapper;
	
	public Developer getDevPartInfo(String userId) {
		return mapper.getDevPartInfo(userId);
	}
	
	public void uptDevPart(Developer upt) {
		if(mapper.checkDevPart(upt.getId()).equals("1")){
			mapper.uptDevPart(upt);
		}else {
			mapper.insDevPart(upt);
		}
	}
	
	public void uptUserDetail(User ins) {
		mapper.uptUserDetail(ins);
	}
	
	public String uptUserPw_Check(User ins) {
		return logmapper.loginCheck(ins);
	}
	
	public void uptUserPw(User ins) {
		mapper.uptUserPw(ins);
	}
	
	public int writeB_cnt(int userno) {
		return mapper.writeB_cnt(userno);
	}
	
	public int writeC_cnt(int userno) {
		return mapper.writeC_cnt(userno);
	}
	
	public void uptPfimg(Map<String, String> map) {
		mapper.uptPfimg(map);
	}
}
