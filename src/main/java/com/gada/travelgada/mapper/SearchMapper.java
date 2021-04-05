package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;

@Mapper
public interface SearchMapper {

	public List<PlannerVO> getSearchPlanner(String keyword);
	public List<DiaryVO> getSearchDiary(String keyword);
	public List<PlannerVO> searchPlMore(String keyword);
	public List<DiaryVO> searchDiMore(String keyword);
	

}
