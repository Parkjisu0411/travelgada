package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;

@Mapper
public interface SearchMapper {

	//통합 검색 일정 부분
	public List<PlannerVO> searchPl(String keyword);
	
	//통합 검색 다이어리 부분
	public List<DiaryVO> searchDi(String keyword);
	
	//일정 더보기
	public List<PlannerVO> searchPlMore(String keyword,String order);
	
	//다이어리 더보기
	public List<DiaryVO> searchDiMore(String keyword,String order);
	
}
