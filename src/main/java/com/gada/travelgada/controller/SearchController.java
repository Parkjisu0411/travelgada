package com.gada.travelgada.controller;

import java.sql.Date;

import java.text.ParseException;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.MainService;
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
	private MainService mainService;

	//통합 검색 페이지
	@GetMapping("/search")
	public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword) {
		log.info("controller search();");
		
		String sorter = "basic";
		Integer limit = searchService.getLimit(keyword, sorter, 0, 2);
		log.info("============= limit : " + limit);
		
		if(limit == null) {
			mav.addObject("searchPl", searchService.searchPl(keyword ,0));
			
		}else {
			mav.addObject("searchPl", searchService.searchPl(keyword ,limit));
			
		}
		
		mav.addObject("member", searchService.searchDi(keyword));
		mav.addObject("keyword",keyword);
		
		mav.setViewName("search/search");

		return mav;

	}// search end
	
	//일정 더보기 
	@GetMapping("/search/planner")
	public ModelAndView searchPl(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter, CriteriaVO cri) {
		
		log.info("controller searchPl();");
		
		int amount = 4;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int beforPage = (cri.getNowPage() - 2) * amount;
		int total = searchService.getPlTotal(keyword, sorter);
		Integer limit = searchService.getLimit(keyword, sorter, nowPage ,amount);
		
		log.info("============= limit : " + limit);
		log.info("============= nowPage : " + nowPage);
		log.info("============= beforPage : " + beforPage);
		log.info("============= total : " + total);
		
		cri.setAmount(amount);

		if(nowPage == 0){
			
			if(limit == null) {
				mav.addObject("plMore",searchService.searchPlMore(keyword, sorter, 0, 0)); 
				
			}else {
				mav.addObject("plMore",searchService.searchPlMore(keyword, sorter, 0, limit)); 
			}
			
		}else{
			Integer beforeLimit = searchService.getLimit(keyword, sorter, beforPage ,amount);
			log.info("============= beforeLimit : " + beforeLimit);
			
			if(limit == null) {
				mav.addObject("plMore",searchService.searchPlMore(keyword, sorter, beforeLimit, 0)); 
				
			}else {
				mav.addObject("plMore",searchService.searchPlMore(keyword, sorter, beforeLimit, limit));
				
			}
			                                          		
		}
		
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("keyword",keyword);
		mav.addObject("sorter",sorter);
		
		mav.setViewName("search/searchPl");
		
		return mav;

	}// search end
	
	//다이어리 더보기
	@GetMapping("/search/diary")
	public ModelAndView searchDi(ModelAndView mav, @RequestParam("keyword") String keyword,
			@RequestParam(value="sorter", required=false, defaultValue="basic") String sorter, CriteriaVO cri) {
		log.info("controller searchDi();");

		int amount = 12;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = searchService.getDiTotal(keyword, sorter);
		
		cri.setAmount(amount);
		
		mav.addObject("member",searchService.searchDiMore(keyword, sorter, nowPage, amount));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("keyword",keyword);
		mav.addObject("sorter",sorter);
		
		mav.setViewName("search/searchDi");

		return mav;

	}// search end
	
	@GetMapping("/search/planner/{member_id}/{planner_id}")
	public ModelAndView getSchedule(ModelAndView mav, PlannerVO plannerVO) throws ParseException {
		log.info("View schedule ===========");
		
		List<PlannerVO> plannerList = plannerService.getPlanner(plannerVO.getMember_id());
		
		PlannerVO planner = plannerService.getPlannerById(plannerVO.getPlanner_id());
		
		List<String> dateList = DateCalculator.getDateList(planner.getStart_date(), planner.getEnd_date());
		mav.addObject("planner", planner);
		mav.addObject("country", mainService.getCountry());
		
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
	
	@GetMapping("/search/map/{member_id}/{planner_id}")
	public ModelAndView getMap(@PathVariable("planner_id") int planner_id, @RequestParam("schedule_date") Date schedule_date, @PathVariable("member_id") String member_id, 
			ModelAndView modelAndView) throws ParseException {
		List<PlannerVO> plannerList = plannerService.getPlanner(member_id);
		PlannerVO planner = null;
		if(planner_id != 0) {
			for(PlannerVO vo : plannerList) {
				if(vo.getPlanner_id() == planner_id) {
					planner = vo;
				}
			}
		} else {
			planner = plannerList.get(0);
		}
		List<String> dateList = DateCalculator.getDateList(planner.getStart_date(), planner.getEnd_date());
		
		modelAndView.addObject("scheduleList", scheduleService.getMap(planner_id, schedule_date));
		modelAndView.addObject("dateList", dateList);
		modelAndView.addObject("planner_id", planner_id);
		modelAndView.addObject("schedule_date", schedule_date);
		
		modelAndView.setViewName("map/map2");

		return modelAndView;
	}
	
}