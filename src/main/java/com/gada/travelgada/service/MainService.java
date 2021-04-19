package com.gada.travelgada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.CountryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.mapper.MainMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MainService {
	
	@Autowired
	private MainMapper mainMapper;
	
	public List<MemberVO> getDiary() {
		return mainMapper.getDiary();
	}
	
	public List<ScheduleVO> getRecommendationCountry() {
		return mainMapper.getRecommendationCountry();
	}
	
	public List<CountryVO> getCountry() {
		return mainMapper.selectCountry();
	}
	
	public List<ProductVO> getRecommendationProduct() {
		return mainMapper.getRecommendationProduct();
	}
}
