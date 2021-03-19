package com.gada.travelgada.provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.MemberDetailsService;

@Service
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	MemberDetailsService memberDetailsService;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String name = authentication.getName();
		String password = (String) authentication.getCredentials();

		MemberDetails member = (MemberDetails) memberDetailsService.loadUserByUsername(name);

		if (member == null || !name.equals(member.getUsername())
				|| !pwEncoder.matches(password, member.getPassword())) {
			throw new BadCredentialsException(name);
		}
		Authentication auth = new UsernamePasswordAuthenticationToken(member, null, member.getAuthorities());

		return auth;
	}

	@Override
	public boolean supports(Class<?> authentication) {

		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
