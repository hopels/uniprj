package com.web.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.board.mapper.BoardMapper;
import com.web.project.board.vo.Board;
import com.web.project.board.vo.BoardFile;

@Service
public class BoardFileService {
	@Autowired(required=false)
	private BoardMapper mapper;
	
	public void insBoardFile(BoardFile ins) {
		mapper.insBoardFile(ins);
	}
	
	public String getBoardno_after_ins(Board sch) {
		return mapper.getBoardno_after_ins(sch);
	}
	
	public List<BoardFile> getBoardFileList(int boardno) {
		return mapper.getBoardFileList(boardno);
	}
}
