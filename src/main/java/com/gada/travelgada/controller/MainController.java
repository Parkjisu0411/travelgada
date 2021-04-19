package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.PlannerService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MainController {

	@Autowired
	private MainService mainService;

	@Autowired
	private PlannerService plannerService;
	
	@GetMapping("/")
	public ModelAndView main(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		
		modelAndView.addObject("member", mainService.getDiary());
		if (memberDetails != null)
			modelAndView.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));

		modelAndView.addObject("recommendation", mainService.getRecommendationCountry());
		
		modelAndView.setViewName("main/main");

		return modelAndView;
	}
	
	@GetMapping("/example")
	public ModelAndView example(ModelAndView modelAndView) {
		modelAndView.setViewName("example");

		return modelAndView;
	}
}