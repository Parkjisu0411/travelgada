package com.gada.travelgada.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.service.ShoppingServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ShoppingController {
	
	private ShoppingServiceImpl shoppingService;
	
	@GetMapping("/shopping")
	public ModelAndView shoppingMain(ModelAndView modelAndView, @RequestParam("product_type_id") int product_type_id, @RequestParam(value="sorter", required=false, defaultValue="salePriceAsc") String sorter ) {
		String type = shoppingService.getProductType(product_type_id);
		modelAndView.addObject("productList", shoppingService.getProductByTypeWithSorting(product_type_id, sorter));
		modelAndView.setViewName("/shopping/" + type);
		return modelAndView;
	}
	
	@GetMapping("/shopping/{product_id}")
	public ModelAndView productView(ModelAndView modelAndView, ProductVO productVO) {
		modelAndView.addObject("product", shoppingService.getProduct(productVO.getProduct_id()));
		return modelAndView;
	}
	
	@GetMapping("/shopping/cart")
	public ModelAndView memberCart(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		modelAndView.addObject("cart", memberDetails.getCart());
		modelAndView.setViewName("/shopping/cart");
		return modelAndView;
	}
	
	@PostMapping("/shopping/cart")
	public ResponseEntity<String> insertIntoCart(@RequestBody ProductVO productVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		try {
			memberDetails.insertIntoCart(shoppingService.getProduct(productVO.getProduct_id()));
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/shopping/order")
	public ModelAndView order(ModelAndView modelAndView, HttpServletRequest request) {
		log.info("order ==================");
		String[] arrProduct_id = request.getParameterValues("product_id");
		String[] arrQuantity = request.getParameterValues("quantity");
		String[] arrPrice = request.getParameterValues("price");
		
		List<BuyDetailVO> buyList = new ArrayList<>();
		BuyDetailVO buy = new BuyDetailVO();
		for(int i = 0; i < arrProduct_id.length; i++) {
			buy.setProduct_id(Integer.parseInt(arrProduct_id[i]));
			buy.setQuantity(Integer.parseInt(arrQuantity[i]));
			buy.setPrice(Integer.parseInt(arrPrice[i]));
			buyList.add(buy);
		}
		modelAndView.addObject("buyDetailList", buy);
		modelAndView.setViewName("/shopping/order");
		
		return modelAndView;
	}
}