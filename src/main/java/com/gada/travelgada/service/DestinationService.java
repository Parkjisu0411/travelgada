package com.gada.travelgada.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.DestinationVO;
import com.gada.travelgada.mapper.DestinationMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Service
public class DestinationService {

	@Autowired
	private DestinationMapper destinationMapper;

	public List<DestinationVO> getTotalCount() {
		return destinationMapper.getTotalCount();
	}

	public List<Integer> getMonthlyCount(String year) {
		List<Integer> monthlyCountList = new ArrayList<>();
		for (int i = 1; i <= 12; i++) {
			monthlyCountList.add(destinationMapper.getMonthlyCount(year, String.valueOf(i)));
		}
		
		return monthlyCountList;
	}
	
	public List<DestinationVO> getMonthlyCountDetail(String year, String month) {
		List<DestinationVO> monthlyCountDetailList = new ArrayList<>();
		
		monthlyCountDetailList = destinationMapper.getMonthlyCountDetail(year, month);
		
		return monthlyCountDetailList;
	}
}