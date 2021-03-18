package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.controller.DairyController;
import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.mapper.DiaryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class DiaryServiceImpl implements DiaryService {

	private DiaryMapper mapper;
	
//	@Override
//	public List<Integer> getDday() {
//		return mapper.getDday();
//	}

	@Override
	public List<DiaryVO> getDiary() {
		log.info("getDiary();");
		return mapper.getDiary();
	}

	@Override
	public List<PlannerVO> getPlanner() {
		log.info("getPlanner();");
		return mapper.getPlanner();
	}

	@Override
	public void writeDiary(DiaryVO diaryVO) {
		mapper.writeDiary(diaryVO);
	}
	
	

}
