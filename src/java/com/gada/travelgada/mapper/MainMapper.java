package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.MainVO;

@Mapper
public interface MainMapper {
	public List<MainVO> getDiary();
}
