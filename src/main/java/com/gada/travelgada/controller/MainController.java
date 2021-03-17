package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.DiaryService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class MainController {
	
	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mav) {
		mav.addObject("diary", diaryService.getDiary());
		mav.setViewName("main/main");
		
		return mav;
	}
	
	@GetMapping("/test")
	public ModelAndView test(ModelAndView mav) {
		mav.addObject("diary", diaryService.getDiary());
		mav.setViewName("main/test");
		
		return mav;
	}
}
