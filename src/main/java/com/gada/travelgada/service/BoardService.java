package com.gada.travelgada.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;

public interface BoardService {

	public List<BoardVO> getReviewBoard(int nowPage, int amount);
	public List<BoardVO> getReviewBoard(int nowPage, int amount, int board_type_id);
	//public List<BoardVO> getReviewBoard(CriteriaVO cri);
	
	public int getTotalReviewBoard(int i);
	
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
	
	
	public MemberVO boardImgPath(MemberVO memberVO);

	public void modifyBoardContent(BoardVO boardVO);

	
	public void deleteBoard(BoardVO boardVO);

	public List<BoardVO> getReply(BoardVO boardVO);

	public void writeReply(BoardVO boardVO);

	

	


	

	

	

	

	



	

	
	
	
	

	



}
