package com.gada.travelgada.service;

import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;




public interface ScheduleService {

	//public List<ScheduleVO> getSchedule(); 
	
	public List<PlannerVO> selectPlanner(String member_id);
	
	public TreeSet<Date> selectScheduleDate(int planner_id);

	public List<ScheduleVO> getVehicle(int planner_id);
	
	public List<ScheduleVO> getCity(int planner_id);
	
	public List<ScheduleVO> getSchedule(int planner_id);
	
	public List<ScheduleVO> getHotel(int planner_id);

}
