package com.gada.travelgada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.mapper.MemberMapper;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private MemberMapper memberMapper;

	public void addMember(MemberVO memberVO) {
		log.info("username >>> " + memberVO.getMember_id());
		log.info("password >>> " + memberVO.getPw());
		
		String password = memberVO.getPw();
		String encode = passEncoder.encode(password);
		log.info("encoding password : " + encode);

		memberVO.setPw(encode);
		memberVO.setWithdrawal_flag(0);

		memberMapper.insertMember(memberVO);
		memberMapper.insertAuthorities(memberVO);
	}

	public MemberVO getMember(String member_id) {
		return memberMapper.selectMember(member_id);
	}

	@Override
	public List<PointVO> getPoint(String member_id) {
		return memberMapper.selectPoint(member_id);
	}

	@Override
	public List<ShippingLocVO> getShippingLoc(String member_id) {
		return memberMapper.selectShippingLoc(member_id);
	}

<<<<<<< HEAD
=======
	@Override
	public boolean isExist(String member_id) {
		MemberVO member = memberMapper.selectMember(member_id);
		if (member == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean isCorrect(String member_id, String pw) {
		MemberVO member = memberMapper.selectMember(member_id);
		if (passEncoder.matches(pw, member.getPw())) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public void updateMember(MemberVO memberVO) {
		log.info("UPDATE MEMBER ========================");
		MemberVO member = memberMapper.selectMember(memberVO.getMember_id());
		if(memberVO.getMember_name() != null) {
			member.setMember_name(memberVO.getMember_name());
		} if(memberVO.getEmail() != null) {
			member.setEmail(memberVO.getEmail());
		} if(memberVO.getPhone_num() != null) {
			member.setPhone_num(memberVO.getPhone_num());
		} if(memberVO.getProfile_img_path() != null) {
			member.setProfile_img_path(memberVO.getProfile_img_path());
		} if(memberVO.getPw() != null) {
			log.info("============================raw pw : " + memberVO.getPw());
			member.setPw(passEncoder.encode(memberVO.getPw()));
		} if((Integer)memberVO.getWithdrawal_flag() != null) {
			member.setWithdrawal_flag(memberVO.getWithdrawal_flag());
		} if((Integer)memberVO.getWithdrawal_code() != null) {
			member.setWithdrawal_code(memberVO.getWithdrawal_code());
		} if(memberVO.getProfile_img_path() != null) {
			member.setProfile_img_path(memberVO.getProfile_img_path());
		}
		
		memberMapper.updateMember(member);
	}

>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
}