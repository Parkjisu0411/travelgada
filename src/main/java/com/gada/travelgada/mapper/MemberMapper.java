package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.MemberVO;

@Mapper
public interface MemberMapper {
	
	void insertAuthorities(MemberVO memberVO);

	void insertMember(MemberVO memberVO);

	MemberVO selectMember(String member_id);
}