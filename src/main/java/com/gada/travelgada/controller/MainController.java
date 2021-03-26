package com.gada.travelgada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.ScheduleService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MainController {

	@Autowired
	private MainService diaryService;

	@Autowired
	private PlannerService plannerService;

	@Autowired
	private ScheduleService scheduleService;

	// Main Page
	@GetMapping("/")
	public ModelAndView main(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		modelAndView.addObject("diary", diaryService.getDiary());
		if (memberDetails != null)
			modelAndView.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));
		modelAndView.setViewName("main/main");

		return modelAndView;
	}

	// Schedule Object => JSON
	@GetMapping("/paths")
	public List<ScheduleVO> locationsToJson(@AuthenticationPrincipal MemberDetails member) {
		List<PlannerVO> plannerList = scheduleService.selectPlanner(member.getUsername());
		PlannerVO planner = plannerList.get(0);

		List<ScheduleVO> pathsToJson = scheduleService.getSchedule(planner.getPlanner_id());

		return pathsToJson;
	}
	
	// Map Page
	@GetMapping("/map")
	public ModelAndView map(ModelAndView modelAndView) {
		modelAndView.setViewName("main/map");

		return modelAndView;
	}

	// Header, Footer Guide
	@GetMapping("/example")
	public ModelAndView example(ModelAndView modelAndView) {
		modelAndView.setViewName("example");

		return modelAndView;
	}
}
