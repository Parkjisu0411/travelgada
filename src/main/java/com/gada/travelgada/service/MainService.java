package com.gada.travelgada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MainVO;
import com.gada.travelgada.mapper.MainMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MainService {
	
	@Autowired
	private MainMapper diaryMapper;
	
	public List<MainVO> getDiary() {
		return diaryMapper.getDiary();
	}
}
