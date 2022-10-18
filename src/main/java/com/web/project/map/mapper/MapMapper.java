package com.web.project.map.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.project.map.vo.Map;

@Mapper
public interface MapMapper {
	public List<Map> getMapList();
}
