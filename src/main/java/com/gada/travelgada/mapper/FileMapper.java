package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {

	public String selectProfilePath(String member_id);
}