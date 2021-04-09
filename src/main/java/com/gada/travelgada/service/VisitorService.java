package com.gada.travelgada.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.mapper.VisitorMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@AllArgsConstructor
@Service

public class VisitorService {
	
	@Autowired
	private VisitorMapper mapper;
	
	//카운트 가지고 오는 서비스
	public List<Integer> getDayCount(String year, String month){
		log.info("VisitorService getDayCount()");
		log.info("여기 실행이 되었다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		List<Integer> list = new ArrayList<>();
		
		for(int day = 1; day <= 31; day++) {
			int monthVisitor;
			monthVisitor = mapper.getDayCount(year,month,day);
			list.add(monthVisitor);
     }
		
		return list;
	}
	
	public List<Integer> getMonthCount(String year) {
		log.info("VisitorService getMonthCount()");
		log.info("여기 실행이 되었다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		List<Integer> list = new ArrayList<>();
		
		for(int month = 1; month <= 12; month++) {
			int monthVisitor;
			monthVisitor = mapper.getMonthCount(year,month);
			list.add(monthVisitor);
     }
		
		return list;
	}

	//방문자수 insert
	public void setCount() {
		log.info("VisitorService setCount()");
		log.info("카운트가 들어가요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		mapper.setCount();
		
	}

}
