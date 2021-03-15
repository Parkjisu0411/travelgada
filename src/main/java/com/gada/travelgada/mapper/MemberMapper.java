package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.MemberVO;

@Mapper
public interface MemberMapper {
	
	MemberVO getMember(String username);
}