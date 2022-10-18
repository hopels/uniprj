package com.web.project.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.project.map.service.MapService;
import com.web.project.map.vo.Map;

@RestController
public class MapRestController {
	@Autowired(required=false)
	private MapService service;
	
	@RequestMapping("mapList.do")
	public List<Map> mapList(){
		return service.getMapList();
	}
}
