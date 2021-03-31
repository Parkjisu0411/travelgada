package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.PlannerVO;

@Mapper
public interface PlannerMapper {

	List<PlannerVO> selectPlannerForMain(String member_id);

	void insertPlanner(PlannerVO plannerVO);

	List<PlannerVO> selectPlanner(String member_id);

	List<PlannerVO> selectFuturePlanner(String member_id);
	
	List<PlannerVO> selectPastPlanner(String member_id);
}
