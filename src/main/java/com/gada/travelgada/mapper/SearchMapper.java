package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;

@Mapper
public interface SearchMapper {

	//통합 검색 일정 부분
	public List<PlannerVO> searchPl(String keyword, int limit);
	
	//통합 검색 다이어리 부분
	public List<MemberVO> searchDi(String keyword);
	
	//일정 더보기
	public List<PlannerVO> searchPlMore(String keyword,String order, int beforeLimit, int limit);
	
	//다이어리 더보기
	public List<DiaryVO> searchDiMore(String keyword,String order,int nowPage, int amount);

	//다이어리 total
	public int getDiTotal(String keyword,String order);

	//일정 total
	public int getPlTotal(String keyword, String order, String choose);

	//limit
	public Integer getLimit(String keyword, String order, int nowPage , int amount, String choose);
	
}
