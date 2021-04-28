package com.gada.travelgada.controller;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MapController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private PlannerService plannerService;
	
	@GetMapping("/paths/{planner_id}")
	public List<ScheduleVO> getPathsToJson(@PathVariable("planner_id") int planner_id, @RequestParam("schedule_date") Date schedule_date) {
		List<ScheduleVO> pathsToJson = scheduleService.getMap(planner_id, schedule_date);

		return pathsToJson;
	}
	
	@GetMapping("/map/{planner_id}")
	public ModelAndView getMap(@PathVariable("planner_id") int planner_id, @RequestParam("schedule_date") Date schedule_date, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) throws ParseException {
		List<PlannerVO> plannerList = plannerService.getPlanner(memberDetails.getUsername());
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
		
		modelAndView.setViewName("map/map");

		return modelAndView;
	}
}