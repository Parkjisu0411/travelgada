package com.gada.travelgada.controller;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.VisitorService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class VisitorController {
	
	private VisitorService visitorService;

	@GetMapping("/visitor")
	public ModelAndView visitor(ModelAndView mav, HttpSession session) {
		log.info("controller visitor();");
		
		SimpleDateFormat format1= new SimpleDateFormat ( "yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		SimpleDateFormat format3 = new SimpleDateFormat ( "dd");
				
		Date time = new Date();
		
		String year = format1.format(time);
		String month = format2.format(time);
		String day = format3.format(time);
		
		log.info("오늘 날짜 : " + year+"년"+ month+"월"+ day+"일");
		
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		
		int total = visitorService.getTotal();
		
		//전체 회원 수 
		mav.addObject("total", total);
		//탈퇴한 회원 수 
		mav.addObject("withdrawal",visitorService.getWithdrawal());
		
		mav.addObject("monthCount",visitorService.getMonthCount(year));
		
		mav.addObject("dayCount",visitorService.getDayCount(year,month));
		
		mav.setViewName("statistic/visitor");
		
		return mav;

	}// diary_test end
	

}
