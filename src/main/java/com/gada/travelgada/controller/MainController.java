package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.MainService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MainController {
	
	@Autowired
	private MainService diaryService;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mav) {
		mav.addObject("diary", diaryService.getDiary());
		mav.setViewName("main/main");
		
		return mav;
	}
	
	@GetMapping("/example")
	public ModelAndView example(ModelAndView mav) {
		mav.setViewName("example");
		
		return mav;
	}
}
