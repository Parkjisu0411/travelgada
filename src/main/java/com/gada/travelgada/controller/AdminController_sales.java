package com.gada.travelgada.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.ProductCountVO;
import com.gada.travelgada.service.AdminService_sales;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class AdminController_sales {
	
	private AdminService_sales adminService;
	
	@GetMapping("/statistic/sales")
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
		
		modelAndView.addObject("monthlySales", adminService.getMonthlySales(year));
		
		modelAndView.setViewName("/statistic/sales");
		return modelAndView;
	}
	
	@GetMapping("/statistic/dailySales")
	public List<Integer> getDailySales(@Param("year") String year, @Param("month") String month) {
		
		return adminService.getDailySales(year, month);
	}
	
	@GetMapping("/statistic/product")
	public List<ProductCountVO> getProductSales(@Param("year") String year, @Param("month") String month) {
		
		return adminService.getProductSales(year, month);
	}
}
