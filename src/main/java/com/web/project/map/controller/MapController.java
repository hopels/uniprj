package com.web.project.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	@GetMapping("map.do")
	public String map() {
		return "map/mapPage";
	}
}
