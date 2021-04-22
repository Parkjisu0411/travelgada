package com.gada.travelgada.service;


import java.sql.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gada.travelgada.domain.CountryVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.mapper.DiaryMapper;
import com.gada.travelgada.mapper.PlannerMapper;
import com.gada.travelgada.mapper.ScheduleMapper;
import com.gada.travelgada.mapper.TodoMapper;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class PlannerService {

	private PlannerMapper plannerMapper;
	private ScheduleMapper scheduleMapper;
	private DiaryMapper diaryMapper;
	private TodoMapper todoMapper;
	
	public List<PlannerVO> getMainPlanner(String member_id) {
		return plannerMapper.selectPlannerForMain(member_id);
	}

	public void writePlanner(PlannerVO plannerVO) {
		plannerMapper.insertPlanner(plannerVO);
	}

	public List<PlannerVO> getPlanner(String member_id) {
		List<PlannerVO> futurePlanner = plannerMapper.selectFuturePlanner(member_id);
		List<PlannerVO> pastPlanner = plannerMapper.selectPastPlanner(member_id);
		for(PlannerVO vo : pastPlanner) {
			futurePlanner.add(vo);
		}
		return futurePlanner;
	}
	
	public List<PlannerVO> getFuturePlanner(String member_id) {
		return plannerMapper.selectFuturePlanner(member_id);
	}
	
	public List<PlannerVO> getPastPlanner(String member_id) {
		return plannerMapper.selectPastPlanner(member_id); 
	}
	
	public PlannerVO getPlannerById(int planner_id) {
		return plannerMapper.selectPlannerById(planner_id);
	}
	
	public Map<Integer, Integer> getDDay(String member_id) {
		Map<Integer, Integer> DDayMap = new HashMap<>();
		List<PlannerVO> plannerList = getFuturePlanner(member_id);
		for(PlannerVO vo : plannerList) {
			DDayMap.put(vo.getPlanner_id(), DateCalculator.getDDay(vo.getStart_date()));
		}
		
		return DDayMap;
	}
	
	public void setCountry(int planner_id, Date start_date, Date end_date, String country_name) {
		Date date = start_date;
		CountryVO country = plannerMapper.selectCountryByName(country_name);
		for(int i = 0; i < DateCalculator.getDifference(start_date, end_date); i++) {
			ScheduleVO schedule = new ScheduleVO();
			schedule.setPlanner_id(planner_id);
			schedule.setSchedule_type_id(5);
			schedule.setSchedule_date(date);
			schedule.setSchedule_content(country_name);
			schedule.setLongitude(country.getLongitude());
			schedule.setLatitude(country.getLatitude());
			
			scheduleMapper.insertSchedule(schedule);
			
			try {
				date = new java.sql.Date(DateCalculator.getNextDate(date).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
				return;
			}
		}
	}
	
	public int getPlanner_id(String member_id) {
		
		return plannerMapper.selectCreatedPlannerId(member_id); 
	}
	
	@Transactional
	public void deletePlanner(int planner_id) {
		scheduleMapper.deleteScheduleByPlannerId(planner_id);
		diaryMapper.deleteDiaryByPlannerId(planner_id);
		todoMapper.deleteTodoByPlannerId(planner_id);
		todoMapper.deleteTodoTypeByPlannerId(planner_id);
		plannerMapper.deletePlanner(planner_id);
	}
	
	@Transactional
	public void modifyPlanner(PlannerVO plannerVO) {
		plannerMapper.updatePlanner(plannerVO);
		scheduleMapper.deleteBeyondSchedule(plannerVO.getPlanner_id(), plannerVO.getStart_date(), plannerVO.getEnd_date());
	}
	
	public void updateImgPath(int planner_id, String img_path) {
		plannerMapper.updateImgPath(planner_id, img_path);
	}
}
