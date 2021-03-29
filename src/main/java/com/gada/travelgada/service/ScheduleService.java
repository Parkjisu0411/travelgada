<<<<<<< HEAD
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
=======
package com.gada.travelgada.service;

import java.util.List;
import java.util.Map;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;

public interface ScheduleService {
	
	public List<PlannerVO> selectPlanner(String member_id);
	
	public List<ScheduleVO> getSchedule(int planner_id, int schedule_type_id);
	
	public List<ScheduleVO> getSchedule(int planner_id);
	
	public List<ScheduleVO> getVehicle(int planner_id);
	
	public List<ScheduleVO> getCity(int planner_id);
	
	public List<ScheduleVO> getHotel(int planner_id);
	
	public List<ScheduleVO> getCountry(int planner_id);
	
	public Map<String, Integer> getBudget(int planner_id);

	public void insertSchedule(ScheduleVO scheduleVO);
	
	public void deleteSchedule(int schedule_id);

}
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
