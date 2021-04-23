package com.gada.travelgada.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			
			modelAndView.addObject("planner_id", planner.getPlanner_id());
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
	
	@GetMapping("/planner/schedule/callback")
	public ModelAndView callBackSchedule(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails member, @RequestParam(defaultValue = "0") int planner_id) throws ParseException {
		List<PlannerVO> plannerList = plannerService.getPlanner(member.getUsername());
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
		
		modelAndView.setViewName("planner/callback_schedule");
		
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
	public ResponseEntity<Map<String,String>> insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		ResponseEntity<Map<String,String>> entity = null;
		Map<String, String> data = new HashMap<>();
		try {
			scheduleService.insertSchedule(scheduleVO);
			ScheduleVO result = scheduleService.getLastSchedule(scheduleVO.getPlanner_id());
			data.put("planner_id",String.valueOf(result.getPlanner_id()));
			data.put("latitude", String.valueOf(result.getLatitude()));
			data.put("longitude", String.valueOf(result.getLongitude()));
			data.put("schedule_id", String.valueOf(result.getSchedule_id()));
			data.put("schedule_content", result.getSchedule_content());
			data.put("schedule_order", String.valueOf(result.getSchedule_order()));
			entity = new ResponseEntity<Map<String, String>>(data, HttpStatus.OK);
		} catch(Exception e) {
			data.put("error", e.getMessage());
			entity = new ResponseEntity<Map<String, String>>(data, HttpStatus.BAD_REQUEST);
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
}