package com.gada.travelgada.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ScheduleController2 {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/planner/schedule2")
	public ModelAndView getSchedule(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails member, @RequestParam(defaultValue = "0") int planner_id) throws ParseException {
		log.info(String.valueOf(planner_id) + "=====================");
		List<PlannerVO> plannerList = scheduleService.selectPlanner(member.getUsername());
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
		modelAndView.addObject("planner_id", planner.getPlanner_id());
		modelAndView.addObject("plannerList", plannerList);
		modelAndView.addObject("dateList", dateList);
		modelAndView.addObject("countryList", scheduleService.getCountry(planner.getPlanner_id()));
		modelAndView.addObject("cityList", scheduleService.getCity(planner.getPlanner_id()));
		modelAndView.addObject("vehicleList", scheduleService.getVehicle(planner.getPlanner_id()));
		modelAndView.addObject("scheduleList", scheduleService.getSchedule(planner.getPlanner_id()));
		modelAndView.addObject("hotelList", scheduleService.getHotel(planner.getPlanner_id()));
		modelAndView.addObject("dayBudget", scheduleService.getBudget(planner.getPlanner_id()));
		
		modelAndView.setViewName("planner/schedule2");
		
		return modelAndView;
	}
	
	@DeleteMapping("/planner/schedule/{schedule_id}")
	public ResponseEntity<String> deleteSchedule(ScheduleVO scheduleVO) {
		ResponseEntity<String> entity = null;
		try {
			scheduleService.deleteSchedule(scheduleVO.getSchedule_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("/planner/schedule2")
	public ResponseEntity<String> insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		ResponseEntity<String> entity = null;
		try {
			scheduleService.insertSchedule(scheduleVO);
			if(scheduleVO.getSchedule_type_id() == 4) {
				entity = new ResponseEntity<String>(scheduleVO.getSchedule_order() + ". " + scheduleVO.getSchedule_content(), HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(scheduleVO.getSchedule_content(), HttpStatus.OK);
			}
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			log.info("ERROR Message : " + e.getMessage());
		}
		return entity;
	}
}
