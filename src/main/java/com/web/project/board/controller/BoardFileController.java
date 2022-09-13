package com.web.project.board.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardFileController {
	
	@Value("C:/a01_javaexp/stsworkspace/uniprj2/src/main/resources/static/common/img/") 
	private String saveUrl;
	
	@Value("http://localhost:5080/resources/common/img/")
	private String loadUrl;

	
	@RequestMapping("boardFileUpload.do")
	public ModelAndView Model(@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<MultipartFile> fileList = request.getFiles("upload"); 
		String imgPath = null; 
		for (MultipartFile mf : fileList) {
			if(fileList.get(0).getSize()>0) {
				String originFileName = mf.getOriginalFilename(); //원본 파일 명
				System.out.println("originFileName=="+originFileName);
				String ext = FilenameUtils.getExtension(originFileName);
				String newInfImgFileName = "img_"+UUID.randomUUID() + "." + ext;
				imgPath = loadUrl + newInfImgFileName;
				File file = new File(saveUrl + newInfImgFileName);
				mf.transferTo(file);
			}
		}
		mv.addObject("uploaded", true);
		mv.addObject("url", imgPath);
		System.out.println(mv.toString());
		return mv;
	}
}
