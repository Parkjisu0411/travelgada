package com.gada.travelgada.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MemberVO;
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

	public MemberVO selectMember(String member_id) {
		return memberMapper.selectMember(member_id);
	}

}