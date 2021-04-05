package com.gada.travelgada.service;

import java.util.List;
import java.util.Map;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;

public interface BoardService {

	public List<BoardVO> getReviewBoard(int nowPage, int amount);
	//public List<BoardVO> getReviewBoard(CriteriaVO cri);
	
	public int getTotalReviewBoard(CriteriaVO cri);
	
	public List<BoardVO> getQnABoard(int nowPage, int amount);
	
	public int getTotalQnABoard(CriteriaVO cri);
	
	public List<BoardVO> getAccompanyBoard(int nowPage, int amount);
	
	public int getTotalAccompanyBoard(CriteriaVO cri);
	
	//public BoardVO boardContentView(MemberVO memberVO);'
	
	public BoardVO boardContentView(BoardVO boardVO);
	
	//public BoardVO boardContentView(int board_id, String member_id);

	public List<BoardVO> getNotice();
	
	public void writeBoard(BoardVO boardVO);
	//public void writeBoard(BoardVO boardVO, String username);
	
	
	public void modifyBoard(int board_id);
	
	public void deleteBoard(int board_id);

	
	
	
	public MemberVO boardImgPath(MemberVO memberVO);

	



	

	

	

	

	



	

	
	
	
	

	



}
