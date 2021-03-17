package com.gada.travelgada.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.gada.travelgada.service.PrincipalOauth2UserService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("authorizeRequests >>> ");

		http.authorizeRequests().antMatchers("/member/admin").hasAuthority("role_admin")
		.antMatchers("/member/userInfo").hasAuthority("role_user")
		.antMatchers("/resources/**").permitAll()
		.and()
		.formLogin().loginPage("/member/login").permitAll()
		.and()
		.logout().logoutUrl("/member/logout").logoutSuccessUrl("/")
		.and()
		.oauth2Login().loginPage("/member/login").userInfoEndpoint().userService(principalOauth2UserService);
	}
	
	@Bean
	public BCryptPasswordEncoder bcryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
