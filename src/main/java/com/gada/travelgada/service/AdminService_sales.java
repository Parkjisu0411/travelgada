package com.gada.travelgada.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ProductCountVO;
import com.gada.travelgada.mapper.AdminMapper_sales;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Service
public class AdminService_sales {
	
	@Autowired
	private AdminMapper_sales adminMapper;
	
	public List<Integer> getMonthlySales(String year) {
		List<Integer> monthlySalesList = new ArrayList<>();
		for(int i = 1; i <= 12; i++) {
			monthlySalesList.add(adminMapper.selectBuyByMonth(year, String.valueOf(i)));
		}
		
		return monthlySalesList;
	}
	
	public List<Integer> getDailySales(String year, String month) {
		List<Integer> dailySalesList = new ArrayList<>();
		for(int i = 1; i <= 31; i++) {
			dailySalesList.add(adminMapper.selectBuyByDay(year, month, String.valueOf(i)));
		}
		
		return dailySalesList;
	}
	
	public List<ProductCountVO> getProductSales(String year, String month) {
		List<ProductCountVO> productCountList = new ArrayList<>();
		if(month.equals("0")) {
			productCountList = adminMapper.selectProductCount();
		} else {
			
		}
		return productCountList;
	}
}