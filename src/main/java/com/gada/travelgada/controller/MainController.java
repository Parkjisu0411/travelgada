package com.gada.travelgada.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.MemberDetails;
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
	
	@GetMapping("/")
	public ModelAndView main(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		modelAndView.addObject("diary", diaryService.getDiary());
		if (memberDetails != null)
			modelAndView.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));
		modelAndView.setViewName("main/main");

		return modelAndView;
	}
	
	@GetMapping("/shopping/result")
	public ModelAndView getOrderResult(ModelAndView modelAndView) {
		modelAndView.setViewName("shopping/result");
		
		return modelAndView; 
	}
	
	@PostMapping("/shopping/result")
	public ModelAndView insertOrderResult(BuyVO buyVO, HttpServletRequest request, ModelAndView modelAndView) {
		String buyId = request.getParameter("buy_id");
		String shippingLocName = request.getParameter("shipping_loc_name");
		
		return modelAndView;
	}
	
	@GetMapping("/example")
	public ModelAndView example(ModelAndView modelAndView) {
		modelAndView.setViewName("example");

		return modelAndView;
	}
}