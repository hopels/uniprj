package com.web.project.notice.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.project.notice.service.NoticeService;
import com.web.project.notice.vo.Notice;
import com.web.project.notice.vo.NoticeSch;

@RestController
public class NoticeRestController {
	@Autowired(required=false)
	private NoticeService service;
	
	// http://localhost:5080/getNoticeList.do
	@RequestMapping("getNoticeList.do")
	public List<Notice> getNoticeList(NoticeSch sch){
		
		return service.getNoticeList(sch);
	}
	
	// http://localhost:5080/getNoticePagingInfo.do
	@RequestMapping("getNoticePagingInfo.do")
	public NoticeSch getNoticePagingInfo(NoticeSch sch) {
		return service.getNoticePagingInfo(sch);
	}
}
