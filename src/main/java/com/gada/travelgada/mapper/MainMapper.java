package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.CountryVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.ScheduleVO;

@Mapper
public interface MainMapper {
	public List<MemberVO> getDiary();
	
	public List<ScheduleVO> getRecommendationCountry();
	
	public List<CountryVO> selectCountry();
	
	public List<ProductVO> getRecommendationProduct();
}
