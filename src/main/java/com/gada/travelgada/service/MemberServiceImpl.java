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
public class MemberServiceImpl implements MemberService {

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
		MemberVO member = memberMapper.selectMember(memberVO.getMember_id());
		if(member.getMember_name() != memberVO.getMember_name()) {
			member.setMember_name(memberVO.getMember_name());
		} else if(member.getEmail() != memberVO.getEmail()) {
			member.setEmail(memberVO.getEmail());
		} else if(member.getPhone_num() != memberVO.getPhone_num()) {
			member.setPhone_num(memberVO.getPhone_num());
		} else if(member.getProfile_img_path() != memberVO.getProfile_img_path()) {
			member.setProfile_img_path(memberVO.getProfile_img_path());
		} else if(memberVO.getPw() != null); {
			member.setPw(passEncoder.encode(memberVO.getPw()));
		}
		
		memberMapper.updateMember(member);
	}

}