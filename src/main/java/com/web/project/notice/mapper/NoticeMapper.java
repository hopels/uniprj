package com.web.project.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.notice.vo.Notice;
import com.web.project.notice.vo.NoticeSch;
// com.web.project.notice.mapper.NoticeMapper
@Mapper
public interface NoticeMapper {
	
	public List<Notice> getNoticeList(NoticeSch sch);
	public int getNoticePageCnt();
	public Notice getNoticeDetail(int noticeno);
	public int getUserno_id(String id);
	public void insNotice(Notice ins);
	public void uptNotice(Notice upt);
	public void delNotice(int noticeno);
}
