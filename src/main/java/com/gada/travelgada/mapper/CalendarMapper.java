package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;

@Mapper
public interface CalendarMapper {

	//플래너 생성
	public void planner_create(PlannerVO plannerVO);

	//플래너 아이디
	public int getPlanner_id();

	//스케줄 생성
	public void schedule_create(ScheduleVO scheduleVO);

	
}