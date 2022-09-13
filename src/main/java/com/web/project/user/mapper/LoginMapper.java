package com.web.project.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.user.vo.User;

@Mapper
public interface LoginMapper {
	// 아이디 존재 확인
	public String idCheck(User inp);
	// 아이디 비밀번호 일치 여부
	public String loginCheck(User inp);
	// 아이디로 회원정보 가져오기
	public User getUserInfo_Id(String id);
}
