package com.gada.travelgada.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gada.travelgada.domain.BoardVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BoardServiceTest {
	
	@Autowired
	private BoardService boardService;
	
	@Test
	public void writeBoardTest() {
		BoardVO boardVO = new BoardVO();
		
		boardVO.setBoard_id(134);
		boardVO.setTitle("테스트");
		boardVO.setText("테스트");
		//boardVO.setBoard_date();
		boardVO.setBhit(100);
		boardVO.setBgroup(133);
		boardVO.setBstep(0);
		boardVO.setBindent(0);
		boardVO.setBoard_type_id(4);
		boardVO.setMember_id("gada");
		
		boardService.writeBoard(boardVO);
	}
}
