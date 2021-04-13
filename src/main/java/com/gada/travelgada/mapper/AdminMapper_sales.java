package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper_sales {
	
	public int selectBuyByMonth(@Param("year") String year, @Param("month") String month);
	
	public int selectBuyByDay(@Param("year") String year, @Param("month") String month, @Param("day") String day);
}
