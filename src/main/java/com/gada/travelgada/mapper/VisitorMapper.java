package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorMapper {

	public int getDayCount(String year, String month, int day);
	
	public int getMonthCount(String year,int month);

	public void setCount();
	
}
