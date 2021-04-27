package com.gada.travelgada.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.CountryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.PlannerService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class PlannerController {
	
	private PlannerService plannerService;
	private MainService mainService;
	
	@GetMapping("/planner")
	public ModelAndView plannerMain(ModelAndView mav, @AuthenticationPrincipal MemberDetails memberDetails) {
		mav.addObject("countryList", mainService.getCountry());
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
	
	@Transactional
	@PostMapping("/planner")
	public ModelAndView write(PlannerVO plannerVO, CountryVO countryVO, @AuthenticationPrincipal MemberDetails memberDetails, ModelAndView modelAndView) {
		log.info("create planner ======= 플래너 이름 : " + plannerVO.getPlanner_name() + " 나라 : " + countryVO.getCountry_name() + " start_date : " + plannerVO.getStart_date().toString() + " end_date : " + plannerVO.getEnd_date().toString());
		plannerVO.setMember_id(memberDetails.getUsername());
		plannerVO.setPlanner_img_path(countryVO.getCountry_name());
		plannerService.writePlanner(plannerVO);
		plannerService.setCountry(plannerService.getPlanner_id(memberDetails.getUsername()), plannerVO.getStart_date(), plannerVO.getEnd_date(), countryVO.getCountry_name());
		
		modelAndView.setViewName("redirect:planner");
		
		return modelAndView;
	}
	
	@DeleteMapping("/planner/{planner_id}")
	public ResponseEntity<String> deletePlanner(@RequestBody PlannerVO plannerVO) {
		ResponseEntity<String> entity = null;
		try {
			plannerService.deletePlanner(plannerVO.getPlanner_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PutMapping("/planner/{planner_id}")
	public ResponseEntity<String> modifyPlanner(@RequestBody PlannerVO plannerVO) {
		ResponseEntity<String> entity = null;
		try {
			plannerService.modifyPlanner(plannerVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
