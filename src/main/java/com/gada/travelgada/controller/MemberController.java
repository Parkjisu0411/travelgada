package com.gada.travelgada.controller;

import java.util.List;

import org.apache.ibatis.exceptions.IbatisException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.service.MemberServiceImpl;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
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
	
	@GetMapping("/member/mypage")
	public ModelAndView memberInfo(ModelAndView mv, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("MyPage=================");
		mv.setViewName("member/memberInfo");
		
		//배송지 목록 조회
		List<ShippingLocVO> shippingList = null;
		try {
			shippingList = memberService.getShippingLoc(memberDetails.getUsername());
		} catch(IbatisException e) {
			log.info(memberDetails.getUsername() + "의 배송지 목록이 없습니다.");
			shippingList.add(new ShippingLocVO());
		}
		mv.addObject("point", PointCalculator.getCurrentPoint(memberService.getPoint(memberDetails.getUsername())));
		mv.addObject("member", memberService.getMember(memberDetails.getUsername()));
		mv.addObject("shippingList", shippingList);
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
}
