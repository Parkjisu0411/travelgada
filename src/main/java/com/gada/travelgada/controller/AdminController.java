package com.gada.travelgada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.service.AdminService;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//회원
	@GetMapping("/admin/member")
	public ModelAndView admin(ModelAndView mav, CriteriaVO cri) {
		log.info("controller admin();");
		
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		int total = adminService.getTotal();

		mav.addObject("memberList",adminService.getMemberList(nowPage, cri.getAmount()));
		mav.addObject("pageMaker", new PageVO(cri, total));
		//전체 회원 수 
		mav.addObject("total", total);
		//탈퇴한 회원 수 
		mav.addObject("withdrawal",adminService.getWithdrawal());
		
		mav.setViewName("admin/admin");
		
		return mav;

	}// admin end
	
	//탈퇴한 회원
	@GetMapping("/admin/member/withdrawal")
	public ModelAndView withdrawalList(ModelAndView mav, CriteriaVO cri) {
		log.info("controller withdrawal();");
		
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		int total = adminService.getWithdrawal();
		int totalMember = adminService.getTotal();

		mav.addObject("memberList",adminService.getWithdrawalList(nowPage, cri.getAmount()));
		mav.addObject("pageMaker", new PageVO(cri, total));
		
		//전체 회원 수 
		mav.addObject("total", totalMember);
		//탈퇴한 회원 수 
		mav.addObject("withdrawal",adminService.getWithdrawal());
		
		mav.setViewName("admin/adminWithdrawal");
		
		return mav;

	}// withdrawal end
	
	//회원 탈퇴
	@PutMapping("/admin/member/withdrawal")
	public ResponseEntity<String> withdrawal(@RequestBody MemberVO memberVO, Model model) {
		
		log.info("controller diary_delete()");
		log.info("멤버 아이디 : " + memberVO.getMember_id());
		log.info("탈퇴 코드 : " + memberVO.getWithdrawal_code());
		
		ResponseEntity<String> entity = null;
		
		String member_id = memberVO.getMember_id();
		int withdrawal_code = memberVO.getWithdrawal_code();
		
		try {
			
			if(withdrawal_code == 0){
				
				adminService.withdrawal(0 ,member_id, withdrawal_code);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				
			}else {
				
				adminService.withdrawal(1, member_id, withdrawal_code);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		} // try catch end

		return entity;

	}// withdrawal end
	
	
	//검색
	@GetMapping("/admin/member/search")
	public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword, CriteriaVO cri) {
		log.info("controller search();");
		log.info(keyword);
		
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		int total = adminService.searchTotal(keyword);
		
		mav.addObject("memberList",adminService.search(nowPage, cri.getAmount(),keyword));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("keyword",keyword);
		
		mav.setViewName("admin/admin");

		return mav;

	}// search end
	
	//회원 상세 정보
	@GetMapping("/admin/member/search/{member_id}")
	public ModelAndView memberDetailList(ModelAndView mav, MemberVO memberVO) {
		log.info("controller memberDetailList();");
		
		mav.setViewName("admin/memberDetailList");
		
		//배송지 목록 조회
		List<ShippingLocVO> shippingList = null;
		
		try {
			
			shippingList = adminService.getShippingLoc(memberVO.getMember_id());
			
		}catch(Exception e) {
			
			log.info(memberVO.getMember_id() + "의 배송지 목록이 없습니다.");
			
			shippingList.add(new ShippingLocVO());
		}
		
		mav.addObject("point", PointCalculator.getCurrentPoint(adminService.getPoint(memberVO.getMember_id())));
		mav.addObject("member", adminService.getMember(memberVO.getMember_id()));
		mav.addObject("shippingList", shippingList);
		
		return mav;

	}// memberDetailList end
	
	//탈퇴한 회원 검색
	@GetMapping("/admin/member/search/withdrawal")
	public ModelAndView memberWithdrawal(ModelAndView mav, @RequestParam("keyword") String keyword, CriteriaVO cri) {
		log.info("controller search();");
		log.info(keyword);
		
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		int total = adminService.searchWidthTotal(keyword);
		int totalMember = adminService.getTotal();
		
		mav.addObject("memberList",adminService.searchWithdrawal(nowPage, cri.getAmount(),keyword));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("keyword",keyword);
		
		//전체 회원 수 
		mav.addObject("total", totalMember);
		//탈퇴한 회원 수 
		mav.addObject("withdrawal",adminService.getWithdrawal());
		
		mav.setViewName("admin/adminWithdrawal");

		return mav;

	}// memberWithdrawal end
}