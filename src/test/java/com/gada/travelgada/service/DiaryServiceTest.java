package com.gada.travelgada.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gada.travelgada.domain.DiaryVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DiaryServiceTest {
	
	@Autowired
	DiaryService diayrService;
	
	@Test
	public void writeDiaryTest() {
		
		DiaryVO diaryVO = new DiaryVO();
		
		diaryVO.setText("테스트");
		diaryVO.setPlanner_id(1);
		diaryVO.setHashtag("#테스트");
		diaryVO.setImg_path("테스트");
		
		diayrService.writeDiary(diaryVO);
		
	}
	
	@Test
	public void getImg_seqTest() {
		
		assertNotNull(diayrService.getImg_seq());
		
	}
	
	@Test
	public void getDiaryTest() {
		
		assertNotNull(diayrService.getDiary("gada",1,10));
	
	}
	
	@Test
	public void getDiaryOtherPagingTest() {
		
		assertNotNull(diayrService.getDiaryOtherPaging(1,1,10));
	
	}
	
	@Test
	public void getPlannerTest() {
		
		assertNotNull(diayrService.getPlanner("gada"));
	
	}
	
	@Test
	public void deleteDiary() {
		
		diayrService.deleteDiary(1);

	}
	
	@Test
	public void modifyDiaryTest() {
		
		DiaryVO diaryVO = new DiaryVO();
		
		diaryVO.setText("테스트수정");
		diaryVO.setDiary_id(322);
		diaryVO.setHashtag("#테스트수정");
		diaryVO.setImg_path("테스트수정");
		
		diayrService.modifyDiary(diaryVO);
		
	}
	
	@Test
	public void view_DiaryTest() {
		
		assertNotNull(diayrService.view_Diary(2));
	}

	@Test
	public void getDiaryOtherTest() {
		
		assertNotNull(diayrService.getDiaryOther(1));
		
	}

	@Test
	public void getTotalTest() {
		
	
		assertNotNull(diayrService.getTotal("gada"));
	}

	@Test
	public void getOtherTotalTest() {
		
		assertNotNull(diayrService.getOtherTotal("gada", 1));
	}
	
	
}
