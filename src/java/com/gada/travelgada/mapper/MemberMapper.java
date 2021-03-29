package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ShippingLocVO;

@Mapper
public interface MemberMapper {
	
	void insertAuthorities(MemberVO memberVO);

	void insertMember(MemberVO memberVO);

	MemberVO selectMember(String member_id);

	List<PointVO> selectPoint(String member_id);

	List<ShippingLocVO> selectShippingLoc(String member_id);
}