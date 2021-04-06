package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;

@Mapper
public interface BoardMapper {

	public List<BoardVO> selectReviewBoard(int nowPage, int amount);
	//public List<BoardVO> selectReviewBoard(CriteriaVO cri);
	
	public int getTotalReviewBoard(CriteriaVO cri);

	public List<BoardVO> selectQnABoard(int nowPage, int amount);
	
	public int getTotalQnABoard(CriteriaVO cri);

	public List<BoardVO> getAccompanyBoard(int nowPage, int amount);
	
	public int getTotalAccompanyBoard(CriteriaVO cri);
	
	public BoardVO boardContentView(BoardVO boardVO);

	public List<BoardVO> getNotice();

	public MemberVO boardImgPath(MemberVO memberVO);
	
	

	public void addHit(BoardVO boardVO);

	//public void writeBoard(BoardVO boardVO, @Param("username") String username);
	public void writeBoard(BoardVO boardVO);

	
}
