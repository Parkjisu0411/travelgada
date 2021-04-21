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

	private VisitorMapper mapper;

	// 일별
	public List<Integer> getDayCount(String year, String month) {
		log.info("VisitorService getDayCount()");

		List<Integer> list = new ArrayList<>();

		for (int day = 1; day <= 31; day++) {
			int monthVisitor;
			monthVisitor = mapper.getDayCount(year, month, day);
			list.add(monthVisitor);
		}

		return list;
	}

	// 월별
	public List<Integer> getMonthCount(String year) {
		log.info("VisitorService getMonthCount()");

		List<Integer> list = new ArrayList<>();

		for (int month = 1; month <= 12; month++) {
			int monthVisitor;
			monthVisitor = mapper.getMonthCount(year, month);
			list.add(monthVisitor);
		}

		return list;
	}

	// 방문자수 insert
	public void setCount() {
		log.info("VisitorService setCount()");

		mapper.setCount();

	}

	// 총 member 수
	public int getTotal() {
		log.info("AdminService getTotal()");

		return mapper.getTotal();
	}

	// 탈퇴한 member 수
	public int getWithdrawal() {
		log.info("AdminService getWithdrawal()");

		return mapper.getWithdrawal();
	}

}
