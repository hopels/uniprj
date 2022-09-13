package com.web.project.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.user.mapper.UserMapper;
import com.web.project.user.vo.User;

@Service
public class UserService {
	@Autowired(required=false)
	private UserMapper mapper;
	
	public List<User> userList(){
		return mapper.userList();
	}
	public void regUser(User ins) {
		mapper.regUser(ins);
	}
}
