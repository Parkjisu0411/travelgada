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
public class UserService {
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private MemberMapper memberMapper;

	public void addUser(MemberVO memberVO) {
		log.info("username : " + memberVO.getMember_id());
		log.info("password : " + memberVO.getPw());
		String password = memberVO.getPw();
		String encode = passEncoder.encode(password);
		log.info("encoding password : " + encode);

		memberVO.setPw(encode);
		memberVO.setMember_name("GADA");
		memberVO.setEmail("GADA@gada.com");
		memberVO.setPhone_num("01011112222");
		memberVO.setProfile_img_path("img_path");
		memberVO.setWithdrawal_flag(0);

		memberMapper.insertMember(memberVO);
		memberMapper.insertAuthorities(memberVO);
	}

}