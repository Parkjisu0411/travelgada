package com.gada.travelgada.service;

import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	private ScheduleMapper mapper;

//	@Override
//	public List<ScheduleVO> getSchedule() {
//		log.info("getSchedule()");
//		return mapper.getSchedule();
//	}

	@Override
	public TreeSet<Date> selectScheduleDate(int planner_id) {
		return mapper.selectScheduleDate(planner_id);
	}

	@Override
	public List<PlannerVO> selectPlanner(String member_id) {
		return mapper.selectPlanner(member_id);
	}

	@Override
	public List<ScheduleVO> getVehicle(int planner_id) {
		return mapper.selectVehicle(planner_id);
	}

	@Override
	public List<ScheduleVO> getCity(int planner_id) {
		return mapper.selectCity(planner_id);
	}

	@Override
	public List<ScheduleVO> getSchedule(int planner_id) {
		return mapper.selectSchedule(planner_id);
	}

	@Override
	public List<ScheduleVO> getHotel(int planner_id) {
		return mapper.selectHotel(planner_id);
	}

	@Override
	public void delete_Schedule(int schedule_id) {
		log.info("delete_Schedule()");
		mapper.delete_Schedule(schedule_id);
		
	}



}
