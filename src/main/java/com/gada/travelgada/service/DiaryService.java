package com.gada.travelgada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.mapper.DiaryMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class DiaryService {
	
	@Autowired
	private DiaryMapper diaryMapper;
	
	public List<DiaryVO> getDiary() {
		return diaryMapper.getDiary();
	}
}
