package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.mapper.SearchMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

	private SearchMapper mapper;
	
	//통합 검색 일정 부분
	@Override
	public List<PlannerVO> searchPl(String keyword) {
		log.info("ServiceImpl searchPl() - 통합 검색 일정 부분");
			
		return mapper.searchPl(keyword);
		
	}//searchPl end
	
	//통합 검색 다이어리 부분
	@Override
	public List<MemberVO> searchDi(String keyword) {
		log.info("ServiceImpl searchDi() - 통합 검색 다이어리 부분");
		
		return mapper.searchDi(keyword);
	}
	
	//일정 더보기
	@Override
	public List<PlannerVO> searchPlMore(String keyword, String sorter, int nowPage, int amount) {
		log.info("ServiceImpl searchPlMore() - 일정 더보기");
		
		String order = null;
		
		switch(sorter) {
			case("basic")://기본 정렬 (일정 처음 보여지는 부분에서 정렬)
				order = "order by p.planner_id desc";
				break;
			case("startDate") ://최신순 - 여행 시작 날짜를 내림순
				order = "order by start_date desc";
				break;
			case("day") :// 여행 시작 날짜가 오늘 하루 전 날짜부터 검색  
				order = "and start_date >= DATE_SUB(NOW(), INTERVAL 1 day) order by start_date desc";
				break;
			case("week") :// 일주일 
				order = "and start_date >= DATE_SUB(NOW(), INTERVAL 1 week) order by start_date desc";		
				break;
			case("month") :// 한달
				order = "and start_date >= DATE_SUB(NOW(), INTERVAL 1 month) order by start_date desc";		
				break;
			case("year") :// 일년
				order = "and start_date >= DATE_SUB(NOW(), INTERVAL 1 year) order by start_date desc";		
				break;
		}
		
		return mapper.searchPlMore(keyword, order, nowPage, amount);
	} 
	
	//다이어리 더보기
	@Override
	public List<DiaryVO> searchDiMore(String keyword, String sorter,int nowPage, int amount) {
		log.info("ServiceImpl searchDiMore()-다이어리 더보기");
		
		String order = null;

		switch (sorter) {
			case ("basic"):// 기본 정렬 (다이어리 처음 보여지는 부분에서 정렬), 최신순
				order = "order by b.diary_date desc";
				break;
			case ("day"):// 다이어리 시작 날짜가 오늘 하루 전 날짜부터 검색
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 day) order by b.diary_date desc";
				break;
			case ("week"):// 일주일
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 week) order by b.diary_date desc";
				break;
			case ("month"):// 한달
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 month) order by b.diary_date desc";
				break;
			case ("year"):// 일년
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 year) order by b.diary_date desc";
				break;
		}
		
		return mapper.searchDiMore(keyword, order, nowPage, amount);
	}

	//다이어리 수
	@Override
	public int getDiTotal(String keyword, String sorter) {
		log.info("ServiceImpl getTotal()");
		
		String order = null;

		switch (sorter) {
			case ("basic"):// 기본 정렬 (다이어리 처음 보여지는 부분에서 정렬), 최신순
				order = "order by b.diary_date desc";
				break;
			case ("day"):// 다이어리 시작 날짜가 오늘 하루 전 날짜부터 검색
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 day) order by b.diary_date desc";
				break;
			case ("week"):// 일주일
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 week) order by b.diary_date desc";
				break;
			case ("month"):// 한달
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 month) order by b.diary_date desc";
				break;
			case ("year"):// 일년
				order = "where b.diary_date >= DATE_SUB(NOW(), INTERVAL 1 year) order by b.diary_date desc";
				break;
		}
		
		return mapper.getDiTotal(keyword, order);
	}

	@Override
	public int getPlTotal(String keyword, String sorter) {
		log.info("ServiceImpl getTotal()");
		
		String order = null;
		
		switch(sorter) {
			case("basic")://기본 정렬 (일정 처음 보여지는 부분에서 정렬)
				order = "order by b.planner_id desc";
				break;
			case("startDate") ://최신순 - 여행 시작 날짜를 내림순
				order = "order by b.start_date desc";
				break;
			case("day") :// 여행 시작 날짜가 오늘 하루 전 날짜부터 검색  
				order = "and b.start_date >= DATE_SUB(NOW(), INTERVAL 1 day) order by b.start_date desc";
				break;
			case("week") :// 일주일 
				order = "and b.start_date >= DATE_SUB(NOW(), INTERVAL 1 week) order by b.start_date desc";		
				break;
			case("month") :// 한달
				order = "and b.start_date >= DATE_SUB(NOW(), INTERVAL 1 month) order by b.start_date desc";		
				break;
			case("year") :// 일년
				order = "and b.start_date >= DATE_SUB(NOW(), INTERVAL 1 year) order by b.start_date desc";		
				break;
		}
		
		return mapper.getPlTotal(keyword, order);
	}

}
