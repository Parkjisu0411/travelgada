package com.gada.travelgada.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.MainService;
import com.gada.travelgada.service.MemberService;
import com.gada.travelgada.service.PlannerService;
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
	
	@GetMapping("/")
	public ModelAndView main(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		modelAndView.addObject("diary", diaryService.getDiary());
		if (memberDetails != null)
			modelAndView.addObject("plannerList", plannerService.getMainPlanner(memberDetails.getUsername()));
		modelAndView.setViewName("main/main");

		return modelAndView;
	}
	
	@PostMapping("/shopping/order")
	public ModelAndView sendOrderPage(@RequestParam("product_id") String productId, @RequestParam("quantity") String quantity, @RequestParam("price") String price, @RequestParam("product_name") String productName, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("order ==================");
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
	
	@PostMapping("/shopping/order/result")
	public ModelAndView insertOrderResult(HttpServletRequest request, ModelAndView modelAndView) {
		String[] productName = request.getParameterValues("product_name");
		String[] quantity = request.getParameterValues("quantity");
		String[] price = request.getParameterValues("price");
		String[] productId = request.getParameterValues("product_id");
		String impUid = request.getParameter("imp_uid");
		String shippingLocName = request.getParameter("address_name");
		
		for (int i = 0; i < productName.length; i++) {
			System.out.println(productName[i]);
			System.out.println(quantity[i]);
			System.out.println(price[i]);
			System.out.println(productId[i]);
			System.out.println(impUid);
			System.out.println(shippingLocName);
		}
		
		return modelAndView;
	}
	
	@GetMapping("/example")
	public ModelAndView example(ModelAndView modelAndView) {
		modelAndView.setViewName("example");

		return modelAndView;
	}
}