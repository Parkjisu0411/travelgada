package com.gada.travelgada.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public List<BoardVO> getReviewBoard(int nowPage, int amount, int board_type_id) {
		return boardMapper.selectReviewBoard(nowPage, amount, board_type_id);
	}
	
//	@Override
//	public List<BoardVO> getReviewBoard(CriteriaVO cri) {
//		return boardMapper.selectReviewBoard(cri);
//	}
	
	@Override
	public int getTotalReviewBoard(int i) {
		return boardMapper.getTotalReviewBoard(i);
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
	
	@Override
	public BoardVO boardContentView(BoardVO boardVO) {
		boardMapper.addHit(boardVO);
		return boardMapper.boardContentView(boardVO);
	}
	
	@Override
	public MemberVO boardImgPath(MemberVO memberVO) {
		return boardMapper.boardImgPath(memberVO);
	}
	
	@Override
	public List<BoardVO> getNotice() {
		return boardMapper.getNotice();
	}
	
//	@Override
//	public void writeBoard(BoardVO boardVO, String username) {
//		boardMapper.writeBoard(boardVO, username);
//	}
	
	@Override
	public void writeBoard(BoardVO boardVO) {
		boardMapper.writeBoard(boardVO);
	}

	@Override
	public void modifyBoardContent(BoardVO boardVO) {
		boardMapper.modifyBoardContent(boardVO);
	}


	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardMapper.deleteBoard(boardVO);
	}

	@Override
	public List<BoardVO> getReply(BoardVO boardVO) {
		return boardMapper.getReply(boardVO);
	}

	@Override
	public void writeReply(BoardVO boardVO) {
		boardMapper.writeReply(boardVO);
	}






	
	
	
	





	

















}
