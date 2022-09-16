package com.web.project.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.project.board.service.BoardFileService;
import com.web.project.board.service.BoardService;
import com.web.project.board.vo.Board;
import com.web.project.board.vo.BoardFile;

@Controller
public class BoardFileController {
	@Autowired(required=false)
	private BoardService service;
	
	@Autowired(required=false)
	private BoardFileService fileService;
	
	@Value("C:/a01_javaexp/stsworkspace/uniprj2/src/main/resources/static/common/img/board/") 
	private String saveUrl;
	
	@RequestMapping("boardFileUpload.do")
	public String Model(@RequestParam Map<String, Object> map, MultipartHttpServletRequest report, Board ins, Model d) throws Exception{
		service.insBoard(ins);
		String boardno = fileService.getBoardno_after_ins(ins);
		List<MultipartFile> fileList = report.getFiles("report");
		for (MultipartFile mf : fileList) {
			if(fileList.get(0).getSize()>0) {
				String originFileName = mf.getOriginalFilename();
				System.out.println("originFileName=="+originFileName);
				String ext = FilenameUtils.getExtension(originFileName);
				String newInfImgFileName = "img_"+UUID.randomUUID() + "." + ext;
				File file = new File(saveUrl + newInfImgFileName);
				mf.transferTo(file);
				BoardFile ins2 = new BoardFile(boardno, originFileName, newInfImgFileName);
				fileService.insBoardFile(ins2);
			}
		}
		d.addAttribute("proc", "ins");
		return "newFreeBoard";
	}
	
	@RequestMapping("fileDownload.do")
	public void fileDown(@RequestParam String fname, @RequestParam String originfname, HttpServletResponse response) throws Exception{
		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:/a01_javaexp/stsworkspace/uniprj2/src/main/resources/static/common/img/board/"+fname));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originfname, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
