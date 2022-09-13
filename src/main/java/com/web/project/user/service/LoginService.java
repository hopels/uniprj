package com.web.project.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.user.mapper.LoginMapper;
import com.web.project.user.vo.User;

@Service
public class LoginService {
	@Autowired(required=false)
	private LoginMapper mapper;
	// 로그인 처리 (아이디 존재, 아이디+비밀번호 일치 확인)
	public String loginCheck(User inp) {
		String flag = "";
		if(mapper.idCheck(inp).equals("1")) {
			if(mapper.loginCheck(inp).equals("1")) {
				flag="pass";
			}else {
				flag="nonPw";
			}
		}else {
			flag="nonId";
		}
		
		return flag;
	}
	
	// 아이디로 회원정보 가져오기
	public User getUserInfo_Id(String id) {
		return mapper.getUserInfo_Id(id);
	}
	
}
