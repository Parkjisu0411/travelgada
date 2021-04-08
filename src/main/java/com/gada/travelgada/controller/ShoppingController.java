package com.gada.travelgada.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.service.MemberService;
import com.gada.travelgada.service.ShippingLocServiceImpl;
import com.gada.travelgada.service.ShoppingServiceImpl;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ShoppingController {
	
	private ShoppingServiceImpl shoppingService;
	private ShippingLocServiceImpl shippingService;
	private MemberService memberService;
	
	@GetMapping("/shopping")
	public ModelAndView shoppingMain(ModelAndView modelAndView, @RequestParam("product_type_id") int product_type_id, @RequestParam(value="sorter", required=false, defaultValue="default") String sorter) {
		String type = shoppingService.getProductType(product_type_id);
		modelAndView.addObject("productList", shoppingService.getProductByTypeWithSorting(product_type_id, sorter));
		modelAndView.setViewName("/shopping/" + type);
		return modelAndView;
	}
	
	@GetMapping("/shopping/scroll")
	public List<ProductVO> shoppingPage(@RequestParam("product_type_id") int product_type_id, @RequestParam(value="sorter", required=false, defaultValue="defualt") String sorter, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		return shoppingService.getProductByTypeWithSortingAndPaging(product_type_id, sorter, page);
	}
	
	@GetMapping("/shopping/{product_id}")
	public ModelAndView productView(ModelAndView modelAndView, ProductVO productVO) {
		modelAndView.addObject("product", shoppingService.getProduct(productVO.getProduct_id()));
		modelAndView.setViewName("/shopping/product");
		return modelAndView;
	}
	
	@GetMapping("/shopping/cart")
	public ModelAndView memberCart(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		Map<Integer, Integer> cart = memberDetails.getCart(); 
		Set<Integer> idSet = cart.keySet();
		Map<ProductVO, Integer> productCart = new HashMap<>();
		for(Integer id : idSet) {
			productCart.put(shoppingService.getProduct(id), cart.get(id));
		}
		
		modelAndView.addObject("cart", productCart);
		modelAndView.setViewName("/shopping/cart");
		return modelAndView;
	}
	
	@PostMapping("/shopping/cart")
	public ResponseEntity<String> insertIntoCart(@RequestBody BuyDetailVO buyDetailVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		try {
			memberDetails.insertIntoCart(buyDetailVO.getProduct_id(), buyDetailVO.getQuantity());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@DeleteMapping("/shopping/cart")
	public ResponseEntity<String> deleteFromCart(@RequestBody ProductVO productVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		try {
			memberDetails.deleteFromCart(productVO.getProduct_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/shopping/buy_list")
	public ModelAndView buyList(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
		List<BuyVO> buyList = shoppingService.getBuyList(memberDetails.getUsername());
		List<BuyDetailVO> buyDetailList = null;
		for(BuyVO vo : buyList) {
			if(buyDetailList == null) {
				buyDetailList = shoppingService.getBuyDetailList(vo.getBuy_id());				
			} else {
				for(BuyDetailVO detailVO : shoppingService.getBuyDetailList(vo.getBuy_id())) {
					buyDetailList.add(detailVO);
				}
			}
		}
		Map<Integer, BuyVO> buyMap = new HashMap<>();
		Map<Integer, ProductVO> productMap = new HashMap<>();
		
		for(BuyDetailVO vo : buyDetailList) {
			buyMap.put(vo.getBuy_detail_id(), shoppingService.getBuyByDetail(vo));
			productMap.put(vo.getBuy_detail_id(), shoppingService.getProductByDetail(vo));
		}
		
		modelAndView.addObject("buyDetailList", buyDetailList);
		modelAndView.addObject("buyMap", buyMap);
		modelAndView.addObject("productMap", productMap);
		modelAndView.setViewName("/shopping/buy_list");
		return modelAndView;
	}
	
	@GetMapping("/shopping/buy_list/{buy_id}")
	public ModelAndView buyDetailList(ModelAndView modelAndView, BuyVO buyVO) {
		BuyVO buy = shoppingService.getBuy(buyVO.getBuy_id());
		List<BuyDetailVO> buyDetailList = shoppingService.getBuyDetailList(buy.getBuy_id());
		Map<Integer, ProductVO> productMap = new HashMap<>();
		for(BuyDetailVO vo : buyDetailList) {
			productMap.put(vo.getBuy_detail_id(), shoppingService.getProductByDetail(vo));
		}
		
		modelAndView.addObject("shoppingLoc", shippingService.getShippingLoc(buy.getMember_id(), buy.getShipping_loc_name()));
		modelAndView.addObject("buy", buy);
		modelAndView.addObject("buyDetailList", buyDetailList);
		modelAndView.addObject("productMap", productMap);
		modelAndView.setViewName("/shopping/buy_detail_list");
		return modelAndView;
	}
}