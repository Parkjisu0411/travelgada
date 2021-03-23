package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.service.MemberServiceImpl;
import com.gada.travelgada.service.ShippingLocServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
public class ShippingController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	private ShippingLocServiceImpl shippingLocService;
	
	@GetMapping("/member/shipping")
	public ModelAndView memberShippingLoc(ModelAndView mv, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("MyPage==========ShippingLoc==========");
		mv.addObject("shippingList", memberService.getShippingLoc(memberDetails.getUsername()));
		mv.setViewName("/member/shipping/list");
		return mv;
	}
	
	@DeleteMapping("/member/shipping/{shipping_loc_name}")
	public ResponseEntity<String> deleteShippingLoc(ShippingLocVO shippingLocVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		shippingLocVO.setMember_id(memberDetails.getUsername());
		try {
			log.info(shippingLocVO.getShipping_loc_name() + "의 삭제를 시도합니다.=============");
			shippingLocService.deleteShippingLoc(shippingLocVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/shipping/enroll")
	public ModelAndView enroll(ModelAndView mav) {
		mav.setViewName("/member/shipping/enroll");
		return mav;
	}
	
	@GetMapping("/address-search")
	public ModelAndView popup(ModelAndView mav) {
		mav.setViewName("/member/shipping/address-search");
		return mav;
	}
	
}
