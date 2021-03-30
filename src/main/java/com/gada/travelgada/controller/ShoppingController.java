package com.gada.travelgada.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.ShoppingServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class ShoppingController {
	
	private ShoppingServiceImpl shoppingService;
	
	@GetMapping("/shopping")
	public ModelAndView shoppingMain(ModelAndView modelAndView) {
		modelAndView.addObject("productList", shoppingService.getProduct());
		modelAndView.setViewName("/shopping/shopping_main");
		return modelAndView;
	}

}