package com.web.project.box.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoxController {
	
	@GetMapping("boxPage")
	public String boxPage() {
		return "box/boxPage";
	}
}
