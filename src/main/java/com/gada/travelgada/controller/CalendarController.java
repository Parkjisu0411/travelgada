package com.gada.travelgada.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.CalendarService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	//플래너 달력 페이지
	@GetMapping("calendar")
	public ModelAndView calendar(ModelAndView mav,@AuthenticationPrincipal MemberDetails member) {
		mav.setViewName("calendar/calendar");
		mav.addObject("member",member.getUsername());
		
		return mav;
		
	}//calendar end
	
	//플래너 생성
	@PostMapping("planner_create")
	public ModelAndView planner_create(ModelAndView mav, PlannerVO plannerVO,ScheduleVO scheduleVO){
		
		calendarService.planner_create(plannerVO);
		
		int id = calendarService.getPlanner_id();
		log.info("가장 최근 작성된 플래너의 아이디 : "+id);
		
		Date schedule_date = plannerVO.getStart_date();
		log.info("시작하는 날짜 = 스케줄 날짜 : "+schedule_date);
		
		scheduleVO.setPlanner_id(id);
		scheduleVO.setSchedule_date(schedule_date);
			
		calendarService.schedule_create(scheduleVO);
		
		mav.setViewName("redirect:planner/schedule");
		
		return mav;
		
	}//planner_create end

}
