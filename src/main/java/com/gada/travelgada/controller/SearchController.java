package com.gada.travelgada.controller;

import java.util.List;

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

	// 다이어리
	@GetMapping("search")
	public ModelAndView searchView(ModelAndView mav) {
		log.info("controller searchView();");
		mav.setViewName("search/search");

		return mav;

	}// search end

	@PostMapping("search")
	public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword) {
		log.info("controller search();");

		mav.addObject("searchPl", searchService.getSearchPlanner(keyword));
		mav.addObject("searchDi", searchService.getSearchDiary(keyword));
		mav.addObject("keyword",keyword);

		mav.setViewName("search/search");

		return mav;

	}// search end
	
	// 일정 더보기 json
	@PostMapping("searchPl")
	public List<PlannerVO> searchPl(@RequestParam("keywordMore")String keyword) {
		log.info("controller searchPl();");
		log.info(keyword);

		return searchService.searchPlMore(keyword);

	}// searchPl end
	
	// 다이어리 더보기 json
	@PostMapping("searchDi")
	public List<DiaryVO> searchDi(@RequestParam("keywordMore")String keyword) {
		log.info("controller searchDi();");
		log.info(keyword);

		return searchService.searchDiMore(keyword);

	}// searchDi end
	
	
	
	
	

}// Controller end