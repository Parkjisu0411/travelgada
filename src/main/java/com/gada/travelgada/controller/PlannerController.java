package com.gada.travelgada.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.PlannerService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
public class PlannerController {
	
	private PlannerService plannerService;
	
	@GetMapping("/planner")
	public ModelAndView plannerMain(ModelAndView mav, @AuthenticationPrincipal MemberDetails memberDetails) {
		mav.addObject("plannerList", plannerService.getPlanner(memberDetails.getUsername()));
		mav.addObject("DDayMap", plannerService.getDDay(memberDetails.getUsername()));
		mav.setViewName("planner/planner_main");
		return mav;
	}
	
	@GetMapping("/planner/{planner_id}")
	public ResponseEntity<String> selectPlanner(PlannerVO plannerVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		try {
			memberDetails.setPlanner_id(plannerVO.getPlanner_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/planner/write")
	public ModelAndView write_view(ModelAndView mav) {
		mav.setViewName("planner/planner_write_view");
		return mav;
	}
	
	@PostMapping("/planner/write")
	public ResponseEntity<String> write(PlannerVO plannerVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		
		ResponseEntity<String> entity = null;
		try {
			plannerVO.setMember_id(memberDetails.getUsername());
			plannerService.writePlanner(plannerVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
