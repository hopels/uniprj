package com.web.project.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.user.vo.User;

@Mapper
public interface UserMapper {
	// 유저 리스트 가져오기
	public List<User> userList();
	// 유저정보 저장 (회원가입)
	public void regUser(User ins);
}
