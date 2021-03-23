package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> getReviewBoard();
	
	public List<BoardVO> getQnABoard();
	
	public List<BoardVO> getAccompanyBoard();
	
	public BoardVO getBoard(int board_id);
	
	public void writeBoard(BoardVO boardVO);
	
	public void modifyBoard(int board_id);
	
	public void deleteBoard(int board_id);

}
