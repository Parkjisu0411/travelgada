package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;

public interface BoardService {

	public List<BoardVO> getReviewBoard(int nowPage, int amount);
	
	public int getTotalReviewBoard(CriteriaVO cri);
	
	public List<BoardVO> getQnABoard(int nowPage, int amount);
	
	public int getTotalQnABoard(CriteriaVO cri);
	
	public List<BoardVO> getAccompanyBoard(int nowPage, int amount);
	
	public int getTotalAccompanyBoard(CriteriaVO cri);
	
	public BoardVO boardContentView(int board_id);
	
	//public BoardVO getBoard(int board_id);
	
	public void writeBoard(BoardVO boardVO);
	
	public void modifyBoard(int board_id);
	
	public void deleteBoard(int board_id);

	



	

	
	
	
	

	



}
