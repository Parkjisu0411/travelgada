package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PlannerVO;

public interface SearchService {

	public List<PlannerVO> searchPl(String keyword, int limit);
	
	public List<MemberVO> searchDi(String keyword);

	public List<PlannerVO> searchPlMore(String keyword, String sorter, int beforeLimit, int limit);

	public List<DiaryVO> searchDiMore(String keyword, String sorter, int nowPage, int amount);

	public int getDiTotal(String keyword, String sorter);

	public int getPlTotal(String keyword, String sorter);

	public Integer getLimit(String keyword, String sorter, int nowPage , int amount);
	
}
