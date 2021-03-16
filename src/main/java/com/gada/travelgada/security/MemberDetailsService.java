package com.gada.travelgada.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MemberUser;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		log.warn("Load user by user name >>> " + member_id);

		MemberVO vo = memberMapper.selectMember(member_id);

		log.warn("queried by MemberVO mapper: " + vo);

		return vo == null ? null : new MemberUser(vo);
	}
}