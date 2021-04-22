package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;

public interface DiaryService {
		
	public List<DiaryVO> getDiary(String member_id, int nowPage, int amount);
	public List<PlannerVO> getPlanner(String member_id);
	public void writeDiary(DiaryVO diaryVO);
	public void deleteDiary(int diary_id);
	public void modifyDiary(DiaryVO diaryVO);
	public DiaryVO view_Diary(int diary_id);
	public List<DiaryVO> getDiaryOther(int planner_id);
	public int getImg_seq();
	public int getTotal(String member_id);
	
}
