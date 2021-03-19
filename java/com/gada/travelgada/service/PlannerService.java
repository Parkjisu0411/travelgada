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
		return plannerMapper.selectPlanner(member_id);
	}

}
