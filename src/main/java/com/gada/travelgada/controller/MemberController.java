package com.gada.travelgada.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/member")
	public ModelAndView signUpForm(ModelAndView mv) {
		mv.setViewName("member/signUpForm");
		
		return mv;
	}
	
	@PostMapping("/member")
	public ResponseEntity<String> signUp(@RequestBody MemberVO memberVO) {
		log.info("Sign Up Member >>> " + memberVO.getMember_id());
		ResponseEntity<String> entity = null;
		
		try {
			memberService.addMember(memberVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping("/member/{member_id}")
	public ModelAndView memberInfo(ModelAndView mv, MemberVO memberVO) {
		mv.setViewName("member/memberInfo");
		mv.addObject("memberInfo", memberService.selectMember(memberVO.getMember_id()));
		return mv;
	}
	
	@PostMapping("/member/{member_id}")
	public ResponseEntity<String> modifyMemberInfo(@RequestBody MemberVO memberVO) {
		ResponseEntity<String> entity = null;
		log.info("Modify Member ID :  " + memberVO.getMember_id());
		return null;
	}
	
	@GetMapping("/member/login")
	public ModelAndView loginForm(ModelAndView mv) {
		log.info("Login Form >>> ");
		mv.setViewName("member/loginForm");
		
		return mv;
	}
	
	@PostMapping("/member/login")
	public ResponseEntity<String> login(@RequestBody MemberVO memberVO) {
		log.info("Member Login >>> " + memberVO.getMember_id());
		ResponseEntity<String> entity = null;
		
		return entity;
	}

}
