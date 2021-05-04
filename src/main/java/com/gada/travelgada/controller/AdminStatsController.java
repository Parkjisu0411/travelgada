package com.gada.travelgada.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DestinationVO;
import com.gada.travelgada.domain.ProductCountVO;
import com.gada.travelgada.service.DestinationService;
import com.gada.travelgada.service.SalesService;
import com.gada.travelgada.service.VisitorService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class AdminStatsController {
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private VisitorService visitorService;
	
	@Autowired
	private DestinationService destinationService;
	
	// 매출 통계
	@GetMapping("/admin/statistic/sales")
	public ModelAndView salesStatistic(ModelAndView modelAndView) {
		
		SimpleDateFormat format1= new SimpleDateFormat ("yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat ("MM");
		SimpleDateFormat format3 = new SimpleDateFormat ("dd");
				
		Date time = new Date();
		
		String year = format1.format(time);
		String month = format2.format(time);
		String day = format3.format(time);
		
		modelAndView.addObject("year",year);
		modelAndView.addObject("month",month);
		modelAndView.addObject("day",day);
		
		modelAndView.addObject("monthlySales", salesService.getMonthlySales(year));
		
		modelAndView.setViewName("/statistic/sales");
		return modelAndView;
	}
	
	@GetMapping("/admin/statistic/sales/daily")
	public List<Integer> getDailySales(@Param("year") String year, @Param("month") String month) {
		
		return salesService.getDailySales(year, month);
	}
	
	@GetMapping("/admin/statistic/sales/product")
	public List<ProductCountVO> getProductSales(@Param("year") String year, @Param("month") String month) {
		
		return salesService.getProductSales(year, month);
	}
	
	// 방문자 통계
	@GetMapping("/admin/statistic/visitor")
	public ModelAndView visitor(ModelAndView mav, HttpSession session) {
		log.info("controller visitor();");
		
		SimpleDateFormat format1= new SimpleDateFormat ( "yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		SimpleDateFormat format3 = new SimpleDateFormat ( "dd");
				
		Date time = new Date();
		
		String year = format1.format(time);
		String month = format2.format(time);
		String day = format3.format(time);
		int total = visitorService.getTotal();
		
		log.info("오늘 날짜 : " + year+"년"+ month+"월"+ day+"일");
		
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		
		//전체 회원 수 
		mav.addObject("total", total);
		//탈퇴한 회원 수 
		mav.addObject("withdrawal",visitorService.getWithdrawal());
		mav.addObject("monthCount",visitorService.getMonthCount(year));
		mav.addObject("dayCount",visitorService.getDayCount(year,month));
		
		mav.setViewName("statistic/visitor");
		
		return mav;
	}
	
	// 여행지 통계
	@GetMapping("/admin/statistic/destination/total")
	public List<DestinationVO> getDestinationTotalCountToJson(ModelAndView modelAndView) {
		return destinationService.getTotalCount();
	}
	
	@GetMapping("/admin/statistic/destination/{year}/{month}")
	public List<DestinationVO> getDestinationMonthlyCountDetailToJson(@PathVariable("year") String year, @PathVariable("month") String month, ModelAndView modelAndView) {
		return destinationService.getMonthlyCountDetail(year, month);
	}
	
	@GetMapping("/admin/statistic/destination")
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
