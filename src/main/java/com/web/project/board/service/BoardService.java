package com.web.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.board.mapper.BoardMapper;
import com.web.project.board.vo.Board;
import com.web.project.board.vo.BoardSch;
import com.web.project.board.vo.Comment;
import com.web.project.board.vo.CommentSch;

@Service
public class BoardService {
	@Autowired(required=false)
	private BoardMapper mapper;
	
	public List<Board> getBoardList(BoardSch sch) {
		sch.setCount(mapper.getBlistCount());
		
		// 페이지 설정
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getCurPage() > sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		int end = sch.getCurPage()*sch.getPageSize();
		if(end>=sch.getCount()) {
			sch.setEnd(sch.getCount());
		}else {
			sch.setEnd(end);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize());
		// 블록 설정
		sch.setBlockSize(5);
		int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>=sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		return mapper.getBoardList(sch);
	}
	
	public void insBoard(Board ins) {
		mapper.insBoard(ins);
	}
	
	public Board boardDetail(int boardno) {
		mapper.upReadCnt(boardno);
		return mapper.boardDetail(boardno);
	}
	
	public void uptBoard(Board upt) {
		mapper.uptBoard(upt);
	}
	
	public void delBoard(int boardno) {
		mapper.delComment_delB(boardno);
		mapper.delBoard(boardno);
	}
	
	public List<Comment> getCommentList(CommentSch sch){
		
		sch.setCount(mapper.getCommentCount(Integer.parseInt(sch.getBoardno())));
		if(sch.getCount()==0) {
			sch.setStart(0);
			sch.setPageSize(0);
		}else {
			// 페이지 설정
			if(sch.getPageSize()==0) {
				sch.setPageSize(20);
			}
			sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage() > sch.getPageCount()) {
				sch.setCurPage(sch.getPageCount());
			}
			int end = sch.getCurPage()*sch.getPageSize();
			if(end>=sch.getCount()) {
				sch.setEnd(sch.getCount());
			}else {
				sch.setEnd(end);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize());
			// 블록 설정
			sch.setBlockSize(5);
			int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
			int endBlock = blocknum*sch.getBlockSize();
			if(endBlock>=sch.getPageCount()) {
				endBlock = sch.getPageCount();
			}
			sch.setEndBlock(endBlock);
			sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		}
		return mapper.getCommentList(sch);
	}
	
	public CommentSch getCommentSchInfo(CommentSch sch) {
		sch.setCount(mapper.getCommentCount(Integer.parseInt(sch.getBoardno())));
		if(sch.getCount()==0) {
			sch.setStart(0);
			sch.setPageSize(0);
		}else {
			// 페이지 설정
			if(sch.getPageSize()==0) {
				sch.setPageSize(20);
			}
			sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage() > sch.getPageCount()) {
				sch.setCurPage(sch.getPageCount());
			}
			int end = sch.getCurPage()*sch.getPageSize();
			if(end>=sch.getCount()) {
				sch.setEnd(sch.getCount());
			}else {
				sch.setEnd(end);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize());
			// 블록 설정
			sch.setBlockSize(5);
			int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
			int endBlock = blocknum*sch.getBlockSize();
			if(endBlock>=sch.getPageCount()) {
				endBlock = sch.getPageCount();
			}
			sch.setEndBlock(endBlock);
			sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		}
		
		return sch;
	}
	public void insComment(Comment ins) {
		mapper.insComment(ins);
	}
	public void uptComment(Comment upt) {
		mapper.uptComment(upt);
	}
	public void delComment(int commentno) {
		mapper.delComment(commentno);
	}
}
