package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.DestinationVO;

@Mapper
public interface DestinationMapper {
	public List<DestinationVO> getTotalCount();
	
	public int getMonthlyCount(@Param("year") String year, @Param("month") String month);
	
	public List<DestinationVO> getMonthlyCountDetail(@Param("year") String year, @Param("month") String month);

}