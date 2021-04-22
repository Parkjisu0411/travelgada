package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.CountryVO;
import com.gada.travelgada.domain.PlannerVO;

@Mapper
public interface PlannerMapper {

	List<PlannerVO> selectPlannerForMain(String member_id);

	void insertPlanner(PlannerVO plannerVO);

	List<PlannerVO> selectPlanner(String member_id);

	List<PlannerVO> selectFuturePlanner(String member_id);
	
	List<PlannerVO> selectPastPlanner(String member_id);

	PlannerVO selectPlannerById(int planner_id);
	
	CountryVO selectCountryByName(String country_name);
	
	int selectCreatedPlannerId(String member_id);
	
	void deletePlanner(int planner_id);
	
	void updatePlanner(PlannerVO plannerVO);
	
	void updateImgPath(@Param("planner_id") int planner_id, @Param("img_path") String img_path);
}
