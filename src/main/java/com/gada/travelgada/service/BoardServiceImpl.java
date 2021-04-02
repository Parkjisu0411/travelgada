package com.gada.travelgada.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.mapper.BoardMapper;

import lombok.AllArgsConstructor;

//@NoArgsConstructor
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getReviewBoard(int nowPage, int amount) {
		return boardMapper.selectReviewBoard(nowPage, amount);
	}

	@Override
	public int getTotalReviewBoard(CriteriaVO cri) {
		return boardMapper.getTotalReviewBoard(cri);
	}
	
	@Override
	public List<BoardVO> getQnABoard(int nowPage, int amount) {
		return boardMapper.selectQnABoard(nowPage, amount);
	}
	
	@Override
	public int getTotalQnABoard(CriteriaVO cri) {
		return boardMapper.getTotalQnABoard(cri);
	}

	@Override
	public List<BoardVO> getAccompanyBoard(int nowPage, int amount) {
		return boardMapper.getAccompanyBoard(nowPage, amount);
	}
	
	@Override
	public int getTotalAccompanyBoard(CriteriaVO cri) {
		return boardMapper.getTotalAccompanyBoard(cri);
	}

//	@Override
//	public BoardVO boardContentView(MemberVO memberVO) {
//		return boardMapper.boardContentView(memberVO);
//	}
	

	@Override
	public BoardVO boardContentView(int board_id, String member_id) {
		return boardMapper.boardContentView(board_id, member_id);
	}

	
	@Override
	public List<BoardVO> getNotice(int nowPage, int amount) {
		return boardMapper.getNotice(nowPage, amount);
	}
	
	

	
	



	@Override
	public void writeBoard(BoardVO boardVO) {
		boardMapper.writeBoard(boardVO);
	}

	@Override
	public void modifyBoard(int board_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int board_id) {
		// TODO Auto-generated method stub
		
	}




	

















}
