package com.gada.travelgada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DestinationVO;
import com.gada.travelgada.service.DestinationService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class DestinationController {
	
	@Autowired
	private DestinationService destinationService;
	
	// JSON
	@GetMapping("/destination/json/total")
	public List<DestinationVO> getDestinationTotalToJson(ModelAndView modelAndView) {
		return destinationService.getTotalCount();
	}
	
	@GetMapping("/destination/json/{month}")
	public List<DestinationVO> getDestinationMonthToJson(@PathVariable("month") int month, ModelAndView modelAndView) {
		return destinationService.getMonthCount(month);
	}
	
	// 뷰 페이지
	@GetMapping("/destination/total")
	public ModelAndView getDestinationTotal(ModelAndView modelAndView) {
		modelAndView.setViewName("statistic/destination_total");
		
		return modelAndView;
	}
	
	@GetMapping("/destination/month")
	public ModelAndView getDestinationMonth(ModelAndView modelAndView) {
		modelAndView.setViewName("statistic/destination_month");
		
		return modelAndView;
	}
}