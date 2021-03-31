package com.gada.travelgada.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.utils.DateCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ShoppingController {
	
	
	@RequestMapping(value = "/shopping")
	public String home() {
		return "shopping/shopping.jsp";
	}
	
	// 다이어리
	   @GetMapping("shopping")
	   public ModelAndView shopping(ModelAndView mav, @AuthenticationPrincipal MemberDetails member) {
	      log.info("controller shopping();");

	     
	      mav.setViewName("shopping/shopping");

	      return mav;

	   }// diary end
	
}