package com.web.project.mypage.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.project.mypage.service.MyPageService;

@Controller
public class MyPageFileUploadController {
	@Autowired(required=false)
	private MyPageService service;
	
	@Value("C:/a01_javaexp/stsworkspace/uniprj2/src/main/resources/static/common/img/profile/")
	private String path;
	
	@RequestMapping("mypageFileUpload.do")
	public String uptProfileImg(MultipartHttpServletRequest report,
			@RequestParam(value = "userno", defaultValue = "0") int userno, HttpSession session) throws Exception{
		MultipartFile file = report.getFile("report");
		Map<String, String> map = new HashMap<String, String>();
		String usernoS = String.valueOf(userno);
		map.put("userno", usernoS);
		if(file.getSize()>0) {
			String originalFileName = file.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			String newInfImgFileName = "img_"+UUID.randomUUID() + "." + ext;
			File f = new File(path + newInfImgFileName);
			file.transferTo(f);
			map.put("pfimg", newInfImgFileName);
		}
		service.uptPfimg(map);
		session.setAttribute("userPf_session", (String)map.get("pfimg"));
		return "redirect:/goMyPage.do";
	}
}
