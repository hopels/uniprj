package com.web.project.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.board.vo.Board;
import com.web.project.board.vo.BoardSch;
import com.web.project.board.vo.Comment;
import com.web.project.board.vo.CommentSch;
// com.web.project.board.mapper.BoardMapper
@Mapper
public interface BoardMapper {
	// 자유게시판 리스트 (페이징)
	public List<Board> getBoardList(BoardSch sch);
	public int getBlistCount();
	// 자유게시판 등록
	public void insBoard(Board ins);
	// 자유게시판 상세보기
	public Board boardDetail(int boardno);
	// 조회수 증가
	public void upReadCnt(int boardno);
	// 자유게시판 수정
	public void uptBoard(Board upt);
	// 자유게시판 삭제
	public void delBoard(int boardno);
	// 댓글 조회
	public List<Comment> getCommentList(CommentSch sch);
	// 댓글 총 개수 카운트 (게시글 단위)
	public int getCommentCount(int boardno);
	// 댓글 등록
	public void insComment(Comment ins);
	// 댓글 수정
	public void uptComment(Comment upt);
	// 댓글 삭제
	public void delComment(int commentno);
	// 게시글 삭제 시 게시글 댓글 삭제
	public void delComment_delB(int boardno);
}
