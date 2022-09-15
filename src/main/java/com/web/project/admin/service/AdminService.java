package com.web.project.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.admin.mapper.AdminMapper;
import com.web.project.admin.vo.AuthCount;
import com.web.project.user.vo.User;

@Service
public class AdminService {
	@Autowired(required=false)
	private AdminMapper mapper;
	
	public AuthCount getAuthCount() {
		return mapper.getAuthCount();
	}
	
	public void uptAuth(User upt) {
		mapper.uptAuth(upt);
	}
}
