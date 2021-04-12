package com.gada.travelgada.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.mapper.AdminMapper_sales;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Service
public class AdminService_sales {
	
	@Autowired
	private AdminMapper_sales adminMapper;
	
	public Map<Integer, Integer> getMonthlySales(String year) {
		Map<Integer, Integer> monthlySalesMap = new HashMap<>();
		for(int i = 1; i <= 12; i++) {
			monthlySalesMap.put(i, adminMapper.selectBuyByMonth(year, String.valueOf(i)));
		}
		
		return monthlySalesMap;
	}
	
	public Map<Integer, Integer> getDailySales(String year, String month) {
		Map<Integer, Integer> dailySalesMap = new HashMap<>();
		for(int i = 1; i <= 31; i++) {
			dailySalesMap.put(i, adminMapper.selectBuyByDay(year, month, String.valueOf(i)));
		}
		
		return dailySalesMap;
	}
	
	
}