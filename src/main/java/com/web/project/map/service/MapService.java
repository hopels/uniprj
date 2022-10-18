package com.web.project.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.project.map.mapper.MapMapper;
import com.web.project.map.vo.Map;

@Service
public class MapService {
	@Autowired(required=false)
	private MapMapper mapper;
	
	public List<Map> getMapList(){
		return mapper.getMapList();
	}
}
