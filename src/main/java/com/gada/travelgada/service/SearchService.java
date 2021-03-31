package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;

public interface SearchService {

	public List<PlannerVO> getSearchPlanner(String keyword);
	public List<DiaryVO> getSearchDiary(String keyword);

}
