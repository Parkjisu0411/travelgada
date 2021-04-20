package com.gada.travelgada.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.service.MemberServiceImpl;
import com.gada.travelgada.service.ShoppingServiceImpl;
import com.gada.travelgada.utils.MemberValidator;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class MemberController {
	

	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private MemberValidator memberValidator;
	@Autowired
	private ShoppingServiceImpl shoppingService;
	
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
	public ModelAndView memberInfo(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		//배송지 목록 조회
		List<ShippingLocVO> shippingList = null;
		try {
			shippingList = memberService.getShippingLoc(memberDetails.getUsername());
		} catch(Exception e) {
			log.info(memberDetails.getUsername() + "의 배송지 목록이 없습니다.");
			shippingList.add(new ShippingLocVO());
		}
		//주문 목록 조회
		List<BuyVO> buyList = shoppingService.getBuyList(memberDetails.getUsername());;
		List<BuyDetailVO> buyDetailList = null;
	    for(BuyVO vo : buyList) {
	    	if(buyDetailList == null) {
	    		buyDetailList = shoppingService.getBuyDetailList(vo.getBuy_id());            
	    	} else {
	    		for(BuyDetailVO detailVO : shoppingService.getBuyDetailList(vo.getBuy_id())) {
	    			buyDetailList.add(detailVO);
	    		}
	    	}
	    	if(buyDetailList.size() > 4) {
	    		for(int i = 4; i < buyDetailList.size(); i++) {
	    			buyDetailList.remove(i);
	    		}
	    		break;
	    	}
	    }
	    Map<Integer, BuyVO> buyMap = new HashMap<>();
	    Map<Integer, ProductVO> productMap = new HashMap<>();
	      
	    for(BuyDetailVO vo : buyDetailList) {
	    	buyMap.put(vo.getBuy_detail_id(), shoppingService.getBuyByDetail(vo));
	    	productMap.put(vo.getBuy_detail_id(), shoppingService.getProductByDetail(vo));
	    }
	      
	    modelAndView.addObject("point", PointCalculator.getCurrentPoint(memberService.getPoint(memberDetails.getUsername())));
		modelAndView.addObject("member", memberService.getMember(memberDetails.getUsername()));
		modelAndView.addObject("shippingList", shippingList);
		modelAndView.addObject("buyDetailList", buyDetailList);
		modelAndView.addObject("buyMap", buyMap);
		modelAndView.addObject("productMap", productMap);
		
		modelAndView.setViewName("member/memberInfo");
		return modelAndView;
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
	
	@PostMapping("/member/authMail")
	public String authMail(@RequestBody MemberVO memberVO) {
		log.info("=========================== email : " + memberVO.getEmail());
		Random random = new Random();
		String key = "";
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(memberVO.getEmail());
		
		for(int i = 0; i < 3; i++) {
			int idx = random.nextInt(25) + 65;
			key += (char) idx;
		}
		int ranNum = random.nextInt(8999) + 1000;
		key += ranNum;
		mailMessage.setSubject("GADA 인증번호 전송");
		mailMessage.setText("인증 번호 : " + key);
		javaMailSender.send(mailMessage);
		
		return key;
	}
	
}
