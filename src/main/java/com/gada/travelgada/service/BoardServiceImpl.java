package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardMapper;

	@Override
	public List<BoardVO> getReviewBoard() {
		return boardMapper.selectReviewBoard();
	}

	@Override
	public List<BoardVO> getQnABoard() {
		return boardMapper.selectQnABoard();
	}

	@Override
	public List<BoardVO> getAccompanyBoard() {
		return boardMapper.selectAccompanyBoard();
	}

	@Override
	public BoardVO getBoard(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
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
