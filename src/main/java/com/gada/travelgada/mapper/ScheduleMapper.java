package com.gada.travelgada.mapper;

import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;

@Mapper
public interface ScheduleMapper {

	//public List<ScheduleVO> getSchedule();

	public TreeSet<Date> selectScheduleDate(int planner_id);

	public List<PlannerVO> selectPlanner(String member_id);

	public List<ScheduleVO> selectVehicle(int planner_id);
	
	public List<ScheduleVO> selectCity(int planner_id);
	
	public List<ScheduleVO> selectSchedule(int planner_id);
	
	public List<ScheduleVO> selectHotel(int planner_id);
	
}
