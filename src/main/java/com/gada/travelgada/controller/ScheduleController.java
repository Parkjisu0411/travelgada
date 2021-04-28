package com.gada.travelgada.controller;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ScheduleController {
	
	private ScheduleService scheduleService;
	private PlannerService plannerService;
	private MainService mainService;
	
	@GetMapping("/planner/schedule")
	public ModelAndView getSchedule(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails member) throws ParseException {
		
		List<PlannerVO> plannerList = plannerService.getPlanner(member.getUsername());
		
		if(member.getPlanner_id() == 0) {
			log.info("Select planner First ==========");
			modelAndView.setViewName("redirect:/planner");
		} else {
			log.info("View schedule ===========" + member.getPlanner_id());
			PlannerVO planner = plannerService.getPlannerById(member.getPlanner_id());
			
			if(planner == null) {
				modelAndView.setViewName("redirect:/planner");
				return modelAndView;
			}
			
			List<String> dateList = DateCalculator.getDateList(planner.getStart_date(), planner.getEnd_date());
			
			modelAndView.addObject("planner", planner);
			modelAndView.addObject("country", mainService.getCountry());
			
			modelAndView.addObject("plannerList", plannerList);
			modelAndView.addObject("dateList", dateList);
			modelAndView.addObject("countryList", scheduleService.getCountry(planner.getPlanner_id()));
			modelAndView.addObject("cityList", scheduleService.getCity(planner.getPlanner_id()));
			modelAndView.addObject("vehicleList", scheduleService.getVehicle(planner.getPlanner_id()));
			modelAndView.addObject("scheduleList", scheduleService.getSchedule(planner.getPlanner_id()));
			modelAndView.addObject("hotelList", scheduleService.getHotel(planner.getPlanner_id()));
			modelAndView.addObject("dayBudget", scheduleService.getBudget(planner.getPlanner_id()));
			
			modelAndView.setViewName("planner/schedule");
			
		}
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
	
	@PostMapping("/planner/schedule")
	public ResponseEntity<ScheduleVO> insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		ResponseEntity<ScheduleVO> entity = null;
		try {
			scheduleService.insertSchedule(scheduleVO);
			ScheduleVO result = scheduleService.getLastSchedule(scheduleVO.getPlanner_id());
			entity = new ResponseEntity<ScheduleVO>(result, HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<ScheduleVO>(new ScheduleVO(), HttpStatus.BAD_REQUEST);
			log.info("ERROR Message : " + e.getMessage());
		}
		return entity;
	}
	
	@PutMapping("/planner/schedule")
	public ResponseEntity<String> modifySchedule(@RequestBody ScheduleVO scheduleVO) {
		ResponseEntity<String> entity = null;
		try {
			scheduleService.modifySchedule(scheduleVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/planner/schedule/budget")
	public ResponseEntity<Integer> getBudget(@RequestParam("schedule_date") String date, @RequestParam("planner_id") int planner_id) {
		ResponseEntity<Integer> entity = null;
		log.info("----------------------------- date >>" + date);
		try {
			entity = new ResponseEntity<Integer>(scheduleService.getBudgetByDate(planner_id, Date.valueOf(date)), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(0, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}