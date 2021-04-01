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
	
	public ScheduleVO selectScheduleById(int schedule_id);

	public void insertSchedule(ScheduleVO scheduleVO);
	
	public int selectScheduleOrder(@Param("planner_id") int planner_id, @Param("schedule_date") Date schedule_date);

	public void deleteSchedule(int schedule_id);
	
	public ScheduleVO selectLastSchedule(int planner_id);
	
	public void ordering(@Param("planner_id") int planner_id, @Param("schedule_date") Date schedule_date);

	public void updateSchedule(ScheduleVO scheduleVO);
	
	public List<ScheduleVO> getMap(@Param("schedule_date") Date schedule_date);
	
}