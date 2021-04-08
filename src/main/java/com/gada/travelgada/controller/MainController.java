package com.gada.travelgada.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.MemberService;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.ShoppingServiceImpl;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class MainController {

	@Autowired
	private MainService diaryService;

	@Autowired
	private PlannerService plannerService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShoppingServiceImpl shoppingService;
	
	@GetMapping("/")
	public ModelAndView main(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		modelAndView.addObject("diary", diaryService.getDiary());
		if (memberDetails != null)
			modelAndView.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));
		modelAndView.setViewName("main/main");

		return modelAndView;
	}
	
	// 결제 페이지
	@PostMapping("/shopping/order")
	public ModelAndView sendOrderPage(@RequestParam("product_id") String productId, @RequestParam("quantity") String quantity, @RequestParam("price") String price, @RequestParam("product_name") String productName, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		String[] arrProduct_id = productId.split(",");
		String[] arrQuantity = quantity.split(",");
		String[] arrPrice = price.split(",");
		String[] arrProduct_name = productName.split(",");
		
		List<BuyDetailVO> buyList = new ArrayList<>();
		
		for(int i = 0; i < arrProduct_id.length; i++) {
			BuyDetailVO buy = new BuyDetailVO();
			buy.setProduct_id(Integer.parseInt(arrProduct_id[i]));
			buy.setQuantity(Integer.parseInt(arrQuantity[i]));
			buy.setPrice(Integer.parseInt(arrPrice[i]));
			buy.setProduct_name(arrProduct_name[i]);
			buyList.add(buy);
		}
		
		modelAndView.addObject("buyDetailList", buyList);
		modelAndView.addObject("shippingList", memberService.getShippingLoc(memberDetails.getUsername()));
		modelAndView.addObject("point", PointCalculator.getCurrentPoint(memberService.getPoint(memberDetails.getUsername())));
		modelAndView.addObject("member", memberService.getMember(memberDetails.getUsername()));
		
		modelAndView.setViewName("/shopping/order");
		
		return modelAndView;
	}
	
	// 결제 정보, 포인트 사용-적립 내역을 테이블에 저장
	@PostMapping("/shopping/order/result")
	public ModelAndView insertOrderResult(HttpServletRequest request, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		String[] productName = request.getParameterValues("product_name");
		String[] quantity = request.getParameterValues("quantity");
		String[] price = request.getParameterValues("price");
		String[] productId = request.getParameterValues("product_id");
		String buyId = request.getParameter("buy_id");
		String shippingLocName = request.getParameter("shipping_loc_name");
		String usedPoint = request.getParameter("used_point");
		String savedPoint = request.getParameter("accumulate_point");
		
		// buy 테이블에 결제 내역 저장
		BuyVO payResult = new BuyVO();
		payResult.setBuy_id(buyId);
		payResult.setMember_id(memberDetails.getUsername());
		payResult.setShipping_loc_name(shippingLocName);
		
		shoppingService.insertPaymentResult(payResult);
		
		// buy_detail 테이블에 결제 상세 내역 저장
		for (int i = 0; i < productName.length; i++) {
			BuyDetailVO payResultDetail = new BuyDetailVO();
			payResultDetail.setProduct_name(productName[i]);
			payResultDetail.setPrice(Integer.parseInt(price[i]));
			payResultDetail.setQuantity(Integer.parseInt(quantity[i]));
			payResultDetail.setBuy_id(buyId);
			payResultDetail.setProduct_id(Integer.parseInt(productId[i]));
			
			shoppingService.insertPaymentResultDetail(payResultDetail);
		}
		
		// 결제 금액의 1%를 포인트로 적립
		PointVO accumulatePoint = new PointVO();
		accumulatePoint.setAmount(Integer.parseInt(savedPoint));
		accumulatePoint.setMember_id(memberDetails.getUsername());
		
		shoppingService.accumulatePoint(accumulatePoint);
		
		// 결제 단게에서 포인트 사용 시 포인트 차감
		if (Integer.parseInt(usedPoint) > 0) {
			PointVO deductionPoint = new PointVO();
			deductionPoint.setAmount(Integer.parseInt(usedPoint));
			deductionPoint.setMember_id(memberDetails.getUsername());
			
			shoppingService.deductionPoint(deductionPoint);
		}
		
		modelAndView.setViewName("redirect:/shopping/order/" + buyId);
		
		return modelAndView;
	}
	
	// 결제 완료 페이지
	@GetMapping("/shopping/order/{buy_id}")
	public ModelAndView getOrderResultPage(@PathVariable("buy_id") String buyId, ModelAndView modelAndView) {
		modelAndView.addObject("payResultInformation", shoppingService.getPaymentResult(buyId));
		
		modelAndView.setViewName("shopping/order_result");
		
		return modelAndView;
	}
	
	@GetMapping("/example")
	public ModelAndView example(ModelAndView modelAndView) {
		modelAndView.setViewName("example");

		return modelAndView;
	}
}