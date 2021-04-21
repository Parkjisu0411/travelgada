package com.gada.travelgada.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.service.SearchService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class SearchController {

	
	private SearchService searchService;
	
	private ScheduleService scheduleService;
	
	private PlannerService plannerService;

	//통합 검색 페이지
	@GetMapping("/search")
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
	@GetMapping("/searchPl")
	public ModelAndView searchPl(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter, CriteriaVO cri) {
		log.info("controller searchPl();");
		int amount = 4;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = searchService.getPlTotal(keyword, sorter);
		
		cri.setAmount(amount);
		
		//일정 더보기 getSearchPl
		mav.addObject("plMore",searchService.searchPlMore(keyword, sorter, nowPage, amount));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("keyword",keyword);
		mav.addObject("sorter",sorter);
		
		mav.setViewName("search/searchPl");

		return mav;

	}// search end
	
	//다이어리 더보기
	@GetMapping("/searchDi")
	public ModelAndView searchDi(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter, CriteriaVO cri) {
		log.info("controller searchDi();");

		int amount = 12;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = searchService.getDiTotal(keyword, sorter);
		
		cri.setAmount(amount);
		
		//다이어리 더보기
		mav.addObject("member",searchService.searchDiMore(keyword, sorter, nowPage, amount));
		mav.addObject("pageMaker", new PageVO(cri, total));
		
		mav.addObject("keyword",keyword);
		mav.addObject("sorter",sorter);
		
		mav.setViewName("search/searchDi");

		return mav;

	}// search end
	
	@GetMapping("/search/{member_id}/{planner_id}")
	public ModelAndView getSchedule(ModelAndView mav, PlannerVO plannerVO) throws ParseException {
		
		List<PlannerVO> plannerList = plannerService.getPlanner(plannerVO.getMember_id());
		
			log.info("View schedule ===========");
			PlannerVO planner = plannerService.getPlannerById(plannerVO.getPlanner_id());
			List<String> dateList = DateCalculator.getDateList(planner.getStart_date(), planner.getEnd_date());
			mav.addObject("planner_id", planner.getPlanner_id());
			mav.addObject("plannerList", plannerList);
			mav.addObject("dateList", dateList);
			mav.addObject("countryList", scheduleService.getCountry(planner.getPlanner_id()));
			mav.addObject("cityList", scheduleService.getCity(planner.getPlanner_id()));
			mav.addObject("vehicleList", scheduleService.getVehicle(planner.getPlanner_id()));
			mav.addObject("scheduleList", scheduleService.getSchedule(planner.getPlanner_id()));
			mav.addObject("hotelList", scheduleService.getHotel(planner.getPlanner_id()));
			mav.addObject("dayBudget", scheduleService.getBudget(planner.getPlanner_id()));
			mav.addObject("member_id", plannerVO.getMember_id());
			
			mav.setViewName("search/searchSchedule");
			
		return mav;
	}
	
}// Controller end