<<<<<<< HEAD
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
=======
package com.gada.travelgada.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;

@Mapper
public interface ScheduleMapper {

	public List<ScheduleVO> selectSchedule(@Param("planner_id") int planner_id, @Param("schedule_type_id") int shcedule_type_id);

	public List<PlannerVO> selectPlanner(String member_id);
	
	public List<ScheduleVO> selectAllSchedule(int planner_id);

	public void insertSchedule(ScheduleVO scheduleVO);
	
	public int selectScheduleOrder(@Param("planner_id") int planner_id,@Param("schedule_date") Date schedule_date);

	public void deleteSchedule(int schedule_id);
	
}
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
