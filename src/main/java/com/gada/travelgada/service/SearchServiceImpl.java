package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.mapper.SearchMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

	private SearchMapper mapper;
	
	//플래너 검색
	@Override
	public List<PlannerVO> getSearchPlanner(String keyword) {
		log.info("ServiceImpl getSearchPlanner()");
		return mapper.getSearchPlanner(keyword);
	}

	//다이어리 검색
	@Override
	public List<DiaryVO> getSearchDiary(String keyword) {
		log.info("ServiceImpl getSearchDiary()");
		return mapper.getSearchDiary(keyword);
	}

}
