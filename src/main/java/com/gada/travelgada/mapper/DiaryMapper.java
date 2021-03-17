package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.DiaryVO;

@Mapper
public interface DiaryMapper {
	public List<DiaryVO> getDiary();
}
