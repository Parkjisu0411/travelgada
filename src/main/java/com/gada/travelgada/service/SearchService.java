package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PlannerVO;

public interface SearchService {

	//통합 검색 일정 부분
	public List<PlannerVO> searchPl(String keyword);
	
	//통합 검색 다이어리 부분
	public List<MemberVO> searchDi(String keyword);
	
	//일정 더보기
	public List<PlannerVO> searchPlMore(String keyword, String sorter);
	
	//다이어리 더보기
	public List<DiaryVO> searchDiMore(String keyword, String sorter);
	
}
