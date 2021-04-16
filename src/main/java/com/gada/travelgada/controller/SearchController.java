package com.gada.travelgada.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class SearchController {

	private SearchService searchService;

	//통합 검색 페이지
	@GetMapping("search")
	public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword) {
		log.info("controller search();");
		
		//통합 검색 일정 부분
		mav.addObject("searchPl", searchService.searchPl(keyword));
		//통합 검색 다이어리 부분 getSearchDiary
		mav.addObject("member", searchService.searchDi(keyword));
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
		mav.addObject("member",searchService.searchDiMore(keyword, sorter));
		
		mav.addObject("keyword",keyword);
		
		mav.setViewName("search/searchDi");

		return mav;

	}// search end
	
}// Controller end