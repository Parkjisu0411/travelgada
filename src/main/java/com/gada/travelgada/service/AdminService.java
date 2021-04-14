package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class AdminService {
	
	private AdminMapper mapper;

	//member list
	public List<MemberVO> getMemberList(int nowPage, int amount) {
		log.info("AdminService getMemberList()");
		
		return mapper.getMemberList(nowPage,amount);
	}

	//총 member 수
	public int getTotal() {
		log.info("AdminService getTotal()");
		
		return mapper.getTotal();
	}

	//탈퇴한 member 수
	public int getWithdrawal() {
		log.info("AdminService getWithdrawal()");
		
		return mapper.getWithdrawal();
	}

	//Withdrawal list
	public List<MemberVO> getWithdrawalList(int nowPage, int amount) {
		log.info("AdminService getWithdrawalList()");
		
		return mapper.getWithdrawalList(nowPage, amount);
	}

	//회원 탈퇴
	public void withdrawal(int withdrawal_flag, String member_id, int withdrawal_code) {
		log.info("AdminService withdrawal()");
		
		mapper.withdrawal(withdrawal_flag, member_id, withdrawal_code);
		
	}

	//검색
	public List<MemberVO> search(int nowPage, int amount, String keyword) {
		log.info("AdminService search()");
		
		return mapper.search(nowPage, amount, keyword);
	}

	//검색된 양
	public int searchTotal(String keyword) {
		log.info("AdminService searchTotal()");
		
		return mapper.searchTotal(keyword);
	}

	
	public List<ShippingLocVO> getShippingLoc(String member_id) {
		return mapper.selectShippingLoc(member_id);
	}

	public List<PointVO> getPoint(String member_id) {
		return mapper.selectPoint(member_id);
	}

	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}

	public int searchWidthTotal(String keyword) {
		log.info("searchWidthTotal searchTotal()");
		return mapper.searchWidthTotal(keyword);
	}

	public List<MemberVO> searchWithdrawal(int nowPage, int amount, String keyword) {
		log.info("searchWithdrawal searchTotal()");
		return mapper.searchWithdrawal(nowPage, amount, keyword);
	}

}
