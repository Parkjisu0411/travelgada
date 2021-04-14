package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.DestinationVO;

@Mapper
public interface DestinationMapper {
	public List<DestinationVO> getTotalCount();
	
	public List<DestinationVO> getMonthCount(int month);
}
