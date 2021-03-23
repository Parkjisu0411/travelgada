package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;

@Mapper
public interface DiaryMapper {

//	public List<Integer> getDday() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public List<DiaryVO> getDiary(String member_id);
	public List<PlannerVO> getPlanner(String member_id);
	public void writeDiary(DiaryVO diaryVO);
	public void deleteDiary(int diary_id);
	public void modifyDiary(DiaryVO diaryVO);
	public DiaryVO view_Diary(int diary_id);
	public List<DiaryVO> getDiaryOther(int planner_id);
	
}
