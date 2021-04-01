package com.gada.travelgada.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.mapper.PlannerMapper;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class PlannerService {

	private PlannerMapper plannerMapper;
	
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

}
