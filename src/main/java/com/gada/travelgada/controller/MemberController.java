package com.gada.travelgada.controller;

import java.util.List;

import org.apache.ibatis.exceptions.IbatisException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.service.MemberServiceImpl;
import com.gada.travelgada.utils.MemberValidator;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@AllArgsConstructor
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	private MemberValidator memberValidator;
	
	@GetMapping("/member")
	public ModelAndView signUpForm(ModelAndView mv) {
		mv.setViewName("member/signUpForm");
		
		return mv;
	}
	
	@PostMapping("/member")
	public ResponseEntity<String> signUp(@RequestBody MemberVO memberVO, BindingResult result) {
		log.info("Sign Up Member >>> " + memberVO.getMember_id());
		ResponseEntity<String> entity = null;
		
		memberValidator.validate(memberVO, result);
		if(result.hasErrors()) {
			System.out.println("===========유효성 검사 오류===============");
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				log.info(error.toString());
			}
			entity = new ResponseEntity<String>(errors.get(0).toString(), HttpStatus.BAD_REQUEST);
			return entity;
		}
		
		
		try {
			memberService.addMember(memberVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("member/{member_id}")
	public ResponseEntity<String> updateMember(@RequestBody MemberVO memberVO) {
		ResponseEntity<String> entity = null;
		
		try {
			memberService.updateMember(memberVO);
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
	
	@GetMapping("/member/mypage/point")
	public ModelAndView memberPoint(ModelAndView mv, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("MyPage==========Point==========");
		mv.addObject("amount", PointCalculator.getCurrentPoint(memberService.getPoint(memberDetails.getUsername())));
		mv.addObject("pointList", memberService.getPoint(memberDetails.getUsername()));
		mv.setViewName("/member/memberPoint");
		return mv;
	}
	
	@GetMapping("/member/modify")
	public ModelAndView memberInfoModify(ModelAndView mv, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("MyPage==========Modify==========");
		mv.addObject("member", memberService.getMember(memberDetails.getUsername()));
		mv.setViewName("/member/modify");
		return mv;
	}
	
	@GetMapping("/member/checkid")
	public ResponseEntity<String> checkId(@RequestParam("id") String id) {
		ResponseEntity<String> entity = null;
		
		if(memberService.isExist(id)) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return entity;
		
	}
	
	@GetMapping("/member/checkpw")
	public ResponseEntity<String> checkPw(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		ResponseEntity<String> entity = null;
		
		if(memberService.isCorrect(id, pw)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		return entity;
		
	}
}
