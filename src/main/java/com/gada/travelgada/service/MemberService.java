package com.gada.travelgada.service;

import com.gada.travelgada.domain.MemberVO;

public interface MemberService {	
	
	public MemberVO selectMember(String member_id);
	
	public void addMember(MemberVO memberVO);
}
