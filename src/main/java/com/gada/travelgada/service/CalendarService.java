package com.gada.travelgada.service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;

public interface CalendarService {

	public void planner_create(PlannerVO plannerVO);

	public int getPlanner_id();

	public void schedule_create(ScheduleVO scheduleVO);

}