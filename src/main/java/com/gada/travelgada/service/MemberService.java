package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ShippingLocVO;

public interface MemberService {	
	
	public MemberVO getMember(String member_id);
	
	public void addMember(MemberVO memberVO);
	
	public List<PointVO> getPoint(String member_id);
	
	public List<ShippingLocVO> getShippingLoc(String member_id);
	
	public boolean isExist(String member_id);
	
	public boolean isPw(String username, String pw);
}
