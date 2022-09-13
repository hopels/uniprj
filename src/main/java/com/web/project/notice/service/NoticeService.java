package com.web.project.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.notice.mapper.NoticeMapper;
import com.web.project.notice.vo.Notice;
import com.web.project.notice.vo.NoticeSch;

@Service
public class NoticeService {
	@Autowired(required=false)
	private NoticeMapper mapper;
	
	public List<Notice> getNoticeList(NoticeSch sch){
		sch.setCount(mapper.getNoticePageCnt());
		
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
		
		return mapper.getNoticeList(sch);
	}
	
	public NoticeSch getNoticePagingInfo(NoticeSch sch) {
		sch.setCount(mapper.getNoticePageCnt());
		
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
		return sch;
	}
	
	public Notice getNoticeDetail(int noticeno) {
		return mapper.getNoticeDetail(noticeno);
	}
	
	public int getUserno_id(String id) {
		return mapper.getUserno_id(id);
	}
	
	public void insNotice(Notice ins) {
		mapper.insNotice(ins);
	}
	
	public void uptNotice(Notice upt) {
		mapper.uptNotice(upt);
	}
	
	public void delNotice(int noticeno) {
		mapper.delNotice(noticeno);
	}
}
