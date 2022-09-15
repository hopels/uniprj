package com.web.project.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.admin.vo.AuthCount;
import com.web.project.user.vo.User;
// com.web.project.admin.mapper.AdminMapper
@Mapper
public interface AdminMapper {
	// 권한별 유저 수
	public AuthCount getAuthCount();
	// 권한 변경
	public void uptAuth(User upt);
}
