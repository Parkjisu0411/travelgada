package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.BoardVO;

@Mapper
public interface BoardMapper {

	public List<BoardVO> selectReviewBoard();

	public List<BoardVO> selectQnABoard();

	public List<BoardVO> selectAccompanyBoard();
	
}
