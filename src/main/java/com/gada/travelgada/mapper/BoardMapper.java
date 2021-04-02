package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;

@Mapper
public interface BoardMapper {

	public List<BoardVO> selectReviewBoard(int nowPage, int amount);
	
	public int getTotalReviewBoard(CriteriaVO cri);

	public List<BoardVO> selectQnABoard(int nowPage, int amount);
	
	public int getTotalQnABoard(CriteriaVO cri);

	public List<BoardVO> getAccompanyBoard(int nowPage, int amount);
	
	public int getTotalAccompanyBoard(CriteriaVO cri);

	//public BoardVO boardContentView(MemberVO memberVO);

	public BoardVO boardContentView(int board_id, String member_id);

	public List<BoardVO> getNotice(int nowPage, int amount);

	public void writeBoard(BoardVO boardVO);


	
}
