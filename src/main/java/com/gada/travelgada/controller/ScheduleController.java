
package com.gada.travelgada.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/planner/schedule")
	public ModelAndView getSchedule(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails member) {
		
		DateCalculator dateCalculator = new DateCalculator();
		
		Calendar cal = Calendar.getInstance();
		List<PlannerVO> plannerList = scheduleService.selectPlanner(member.getUsername());
		PlannerVO planner = plannerList.get(0);
		
		modelAndView.addObject("plannerList", plannerList);
		//modelAndView.addObject("dateList", dateCalculator.getDateList(planner.getStart_date(), planner.getEnd_date()));
		modelAndView.addObject("cityList", scheduleService.getCity(planner.getPlanner_id()));
		modelAndView.addObject("vehicleList", scheduleService.getVehicle(planner.getPlanner_id()));
		modelAndView.addObject("scheduleList", scheduleService.getSchedule(planner.getPlanner_id()));
		modelAndView.addObject("hotelList", scheduleService.getHotel(planner.getPlanner_id()));
		modelAndView.setViewName("planner/schedule");
		
		return modelAndView;
	}
	

	  
	@DeleteMapping("/schedule/{shcedule_type_id}")
	public ResponseEntity<String> delete_Schedule(@RequestBody ScheduleVO scheduleVO) {
		ResponseEntity<String> entity = null;
		log.info("delete_Schedule");
		try {
			scheduleService.delete_Schedule(scheduleVO.getSchedule_id());
		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		  return entity;
	}
	
	
}
