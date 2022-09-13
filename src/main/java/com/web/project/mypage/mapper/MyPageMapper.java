package com.web.project.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.mypage.vo.Developer;
import com.web.project.user.vo.User;
// com.web.project.mypage.mapper.MyPageMapper
@Mapper
public interface MyPageMapper {
	// 유저아이디로 개발직군 조회
	public Developer getDevPartInfo(String userId);
	// 개발직군이 등록되어있는지 조회
	public String checkDevPart(String userId);
	// 개발직군 수정
	public void uptDevPart(Developer upt);
	// 개발직군 등록
	public void insDevPart(Developer ins);
	// 개인정보 수정
	public void uptUserDetail(User ins);
	// 비밀번호 변경
	public void uptUserPw(User ins);
	// 내가 쓴 게시글 수 조회
	public int writeB_cnt(int userno);
	// 내가 쓴 댓글 수 조회
	public int writeC_cnt(int userno);
}
