package com.gada.travelgada.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	@GetMapping("/destination/total")
	public List<DestinationVO> getDestinationTotalCountToJson(ModelAndView modelAndView) {
		return destinationService.getTotalCount();
	}
	
	@GetMapping("/destination/{year}/{month}")
	public List<DestinationVO> getDestinationMonthlyCountDetailToJson(@PathVariable("year") String year, @PathVariable("month") String month, ModelAndView modelAndView) {
		return destinationService.getMonthlyCountDetail(year, month);
	}
	
	// 뷰 페이지
	@GetMapping("statistic/destination")
	public ModelAndView getDestinationTotal(ModelAndView modelAndView) {
		SimpleDateFormat simpleDateFormatYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat simpleDateFormatMonth = new SimpleDateFormat("MM");
		SimpleDateFormat simpleDateFormatDay = new SimpleDateFormat("dd");
		
		Date time = new Date();
		
		String year = simpleDateFormatYear.format(time);
		String month = simpleDateFormatMonth.format(time);
		String day = simpleDateFormatDay.format(time);
		
		modelAndView.addObject("year", year);
		modelAndView.addObject("month", month);
		modelAndView.addObject("day", day);
		
		modelAndView.addObject("destinationMonthly", destinationService.getMonthlyCount(year));
		
		modelAndView.setViewName("statistic/destination");
		
		return modelAndView;
	}
}