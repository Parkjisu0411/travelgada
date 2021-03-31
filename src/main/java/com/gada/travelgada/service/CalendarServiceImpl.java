package com.gada.travelgada.service;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.mapper.CalendarMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CalendarServiceImpl implements CalendarService{

	private CalendarMapper mapper;
	
	//플래너 생성
	@Override
	public void planner_create(PlannerVO plannerVO) {
		log.info("planner_create service");
		mapper.planner_create(plannerVO);
		
	}//planner_create end

	//플래너 아이디
	@Override
	public int getPlanner_id() {
		log.info("getPlanner_id service");
		return mapper.getPlanner_id();
		
	}//getPlanner_id end

	//스케줄 생성
	@Override
	public void schedule_create(ScheduleVO scheduleVO) {
		log.info("schedule_create service");
		mapper.schedule_create(scheduleVO);
		
	}//schedule_create end

	
}//class end