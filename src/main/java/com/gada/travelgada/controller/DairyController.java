package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gada.travelgada.service.DiaryService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class DairyController {
	
	@Autowired
	private DiaryService diaryService;

	  @RequestMapping("/")
	   public String Home() {
	      return "hello, spring boot";      // 리턴값을 body로 가져다 직접 출력하는 것임.
	   }   
	
	   @GetMapping("diary")
	   public String diary(Model model) {
		   log.info("diary();");
		   model.addAttribute("diary",diaryService.getDiary());
//		   model.addAttribute("planner",diaryService.getPlanner());
		   return "diary/diary";
	   }
	   
	   @GetMapping("diary_write_view")
	   public String diary_write_view(Model model) {
		   log.info("diary_write_view();");
		   return "diary/diary_write_view";
	   }
	   
}
