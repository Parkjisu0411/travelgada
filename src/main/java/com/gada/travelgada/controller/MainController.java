package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.PlannerService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MainController {

	@Autowired
	private MainService diaryService;

	@Autowired
	private PlannerService plannerService;

	// Main Page
	@GetMapping("/")
	public ModelAndView main(ModelAndView mav, @AuthenticationPrincipal MemberDetails memberDetails) {
		mav.addObject("diary", diaryService.getDiary());
		if (memberDetails != null)
			mav.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));
		mav.setViewName("main/main");

		return mav;
	}

	// Main Widget
	@GetMapping("/map")
	public ModelAndView map(ModelAndView mav) {
		mav.setViewName("main/map");

		return mav;
	}

	@PostMapping("/map/callback")
	public ModelAndView mapCallback(@RequestBody PlannerVO plannerVO, ModelAndView mav) {

		return mav;
	}

	// Header, Footer Guide
	@GetMapping("/example")
	public ModelAndView example(ModelAndView mav) {
		mav.setViewName("example");

		return mav;
	}
}
