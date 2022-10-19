package com.web.project.map.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.project.map.service.MapService;

@Controller
@RequestMapping("center/")
public class MapController {
	@Autowired(required=false)
	private MapService service;
	
	@GetMapping("map.do")
	public String map(Model d) throws JsonProcessingException {
		
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(service.getMapList());
		d.addAttribute("comList2", jsonStr);
		d.addAttribute("comList", service.getMapList());
		return "map/mapPage";
	}
	
	
}
