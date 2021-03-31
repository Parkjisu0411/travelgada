package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.mapper.PlannerMapper;

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

}
