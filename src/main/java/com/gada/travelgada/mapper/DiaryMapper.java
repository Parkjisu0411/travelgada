package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;

@Mapper
public interface DiaryMapper {

//	public List<Integer> getDday() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public List<DiaryVO> getDiary();
	public List<PlannerVO> getPlanner();
	public void writeDiary(DiaryVO diaryVO);

	

}
