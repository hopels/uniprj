package com.web.project.box.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("center/")
public class BoxController {
	
	@GetMapping("boxPage")
	public String boxPage() {
		return "box/boxPage";
	}
}
