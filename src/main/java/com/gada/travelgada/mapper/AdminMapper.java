package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ShippingLocVO;

@Mapper
public interface AdminMapper {

	public List<MemberVO> getMemberList(int nowPage, int amount);

	//총 member 수
	public int getTotal();

	//탈퇴한 member 수
	public int getWithdrawal();
	
	//Withdrawal list
	public List<MemberVO> getWithdrawalList(int nowPage, int amount);

	//회원 탈퇴
	public void withdrawal(int withdrawal_flag, String member_id, int withdrawal_code);

	//검색
	public List<MemberVO> search(int nowPage, int amount, String keyword);

	//검색된 양
	public int searchTotal(String keyword);

	//회원 배송지
	public List<ShippingLocVO> selectShippingLoc(String member_id);

	//회원 포인트
	public List<PointVO> selectPoint(String member_id);

	//회원 정보
	public MemberVO selectMember(String member_id);

	//탈퇴한 회원 검색
	public List<MemberVO> searchWithdrawal(int nowPage, int amount, String keyword);

	//탈퇴한 회원 수
	public int searchWidthTotal(String keyword);

}
