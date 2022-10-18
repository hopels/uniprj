package com.web.project.map.controller;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.web.project.map.service.MapService;

@Controller
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
