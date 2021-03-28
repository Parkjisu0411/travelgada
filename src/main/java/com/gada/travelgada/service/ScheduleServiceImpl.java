package com.gada.travelgada.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<PlannerVO> selectPlanner(String member_id) {
		return mapper.selectPlanner(member_id);
	}

	@Override
	public List<ScheduleVO> getSchedule(int planner_id, int schedule_type_id) {
		return mapper.selectSchedule(planner_id, schedule_type_id);
	}
	
	@Override
	public List<ScheduleVO> getSchedule(int planner_id) {
		return mapper.selectSchedule(planner_id, 4);
	}

	@Override
	public List<ScheduleVO> getVehicle(int planner_id) {
		return mapper.selectSchedule(planner_id, 3);
	}

	@Override
	public List<ScheduleVO> getCity(int planner_id) {
		return mapper.selectSchedule(planner_id, 1);
	}

	@Override
	public List<ScheduleVO> getHotel(int planner_id) {
		return mapper.selectSchedule(planner_id, 2);
	}

	@Override
	public List<ScheduleVO> getCountry(int planner_id) {
		return mapper.selectSchedule(planner_id, 5);
	}
	
	@Override
	public Map<String, Integer> getBudget(int planner_id) {
		Map<String, Integer> budget = new HashMap<>();
		List<ScheduleVO> list = mapper.selectAllSchedule(planner_id);
		for(ScheduleVO vo : list) {
			if(budget.get(vo.getSchedule_date().toString()) == null) {
				budget.put(vo.getSchedule_date().toString(), vo.getBudget());
			} else {
				int inst = budget.get(vo.getSchedule_date().toString());
				inst += vo.getBudget();
				budget.put(vo.getSchedule_date().toString(), inst);
			}
		}
		
		return budget;
	}

	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		if(scheduleVO.getSchedule_type_id() == 4) {
			scheduleVO.setSchedule_order(mapper.selectScheduleOrder(scheduleVO.getPlanner_id(), scheduleVO.getSchedule_date()) + 1);
		}
		mapper.insertSchedule(scheduleVO);
	}

	@Override
	public void deleteSchedule(int schedule_id) {
		mapper.deleteSchedule(schedule_id);
	}

}
