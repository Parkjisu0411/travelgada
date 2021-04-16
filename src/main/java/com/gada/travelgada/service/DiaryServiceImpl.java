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

	@Override
	public List<DiaryVO> getDiary(String member_id) {
		log.info("ServiceImpl getDiary()");
		return mapper.getDiary(member_id);
	}

	@Override
	public List<PlannerVO> getPlanner(String member_id) {
		log.info("ServiceImpl getPlanner()");
		return mapper.getPlanner(member_id);
	}

	@Override
	public void writeDiary(DiaryVO diaryVO) {
		log.info("ServiceImpl writeDiary()");
		mapper.writeDiary(diaryVO);
	}

	@Override
	public void deleteDiary(int diary_id) {
		log.info("ServiceImpl deleteDiary()");
		mapper.deleteDiary(diary_id);
		
	}

	@Override
	public void modifyDiary(DiaryVO diaryVO) {
		log.info("ServiceImpl modifyDiary()");
		mapper.modifyDiary(diaryVO);
	}

	@Override
	public DiaryVO view_Diary(int diary_id) {
		log.info("ServiceImpl view_Diary()");
		return mapper.view_Diary(diary_id);
	}

	@Override
	public List<DiaryVO> getDiaryOther(int planner_id) {
		log.info("ServiceImpl getDiaryOther()");
		return mapper.getDiaryOther(planner_id);
	}

	
	  @Override public int getImg_seq() { 
		  log.info("ServiceImpl getImg_seq()");
	  return mapper.getImg_seq();
	  
	  }

}
