package com.gada.travelgada.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class SearchController {

	private SearchService searchService;

	// 다이어리 보이는 부분 테스트 , 여기는 헤더에 있어서 필요 없다.
	@GetMapping("searchT")
	public ModelAndView searchView(ModelAndView mav) {
		log.info("controller searchView();");
		mav.setViewName("search/search");

		return mav;

	}// searchT end

	//통합 검색 페이지
	@GetMapping("search")
	public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword) {
		log.info("controller search();");
		
		//통합 검색 일정 부분
		mav.addObject("searchPl", searchService.searchPl(keyword));
		//통합 검색 다이어리 부분 getSearchDiary
		mav.addObject("searchDi", searchService.searchDi(keyword));
		//키워드 보내는 부분
		mav.addObject("keyword",keyword);
		
		mav.setViewName("search/search");

		return mav;

	}// search end
	
	//일정 더보기 
	@GetMapping("searchPl")
	public ModelAndView searchPl(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter) {
		log.info("controller searchPl();");
		
		//일정 더보기 getSearchPl
		mav.addObject("plMore",searchService.searchPlMore(keyword, sorter));
		
		mav.addObject("keyword",keyword);
		
		mav.setViewName("search/searchPl");

		return mav;

	}// search end
	
	//다이어리 더보기
	@GetMapping("searchDi")
	public ModelAndView searchDi(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter) {
		log.info("controller searchDi();");

		//다이어리 더보기
		mav.addObject("diMore",searchService.searchDiMore(keyword, sorter));
		
		mav.addObject("keyword",keyword);
		
		mav.setViewName("search/searchDi");

		return mav;

	}// search end
	
	
	
	
	
//	@PostMapping("searchAll")
//	public ModelAndView searchAll(ModelAndView mav, @RequestParam("keyword") String keyword,PlannerVO plannerVO) {
//		log.info("controller searchAll();");
//
//		mav.addObject("searchPl", searchService.getSearchPlanner(keyword));
//		mav.addObject("searchDi", searchService.getSearchDiary(keyword));
//		mav.addObject("search",searchService.getSearch(keyword));
//		mav.addObject("keyword",keyword);
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.getPlanner_id());
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.getMember_id());
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.getPlanner_name());
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.getSatisfaction());
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.hashCode());
//		log.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+plannerVO.getPlanner_id());
//		mav.addObject("vo",plannerVO.getScheduleVO());
//		
//		mav.setViewName("redirect:search/search");
//
//		return mav;
//
//	}// search end
//	
	
//	// 일정 더보기 json
//	@PostMapping("searchPl")
//	public List<PlannerVO> searchPl(@RequestParam("keywordMore")String keyword) {
//		log.info("controller searchPl();");
//		log.info(keyword);
//
//		return searchService.searchPlMore(keyword);
//
//	}// searchPl end
	
//	// 다이어리 더보기 json
//	@PostMapping("searchDi")
//	public List<DiaryVO> searchDi(@RequestParam("keywordMore")String keyword) {
//		log.info("controller searchDi();");
//		log.info(keyword);
//
//		return searchService.searchDiMore(keyword);
//
//	}// searchDi end
	
	
	
	
	

}// Controller end