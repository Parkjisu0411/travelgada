package com.gada.travelgada.service;

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

	public List<DestinationVO> getMonthCount(int month) {
		return destinationMapper.getMonthCount(month);
	}
}
