package com.gada.travelgada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.service.DiaryService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class DairyController {
	
	@Autowired//?
	private DiaryService diaryService;
  	
	   @GetMapping("diary")
	   public String diary(Model model) {
		   log.info("diary();");
		   model.addAttribute("diary",diaryService.getDiary());
		   model.addAttribute("planner",diaryService.getPlanner());
		   return "diary/diary";
	   }
	   
	   @GetMapping("diary_write_view")
	   public String diary_write_view(Model model,DiaryVO diaryVO) {
		   log.info("diary_write_view();");
		   model.addAttribute("planner",diaryVO); 
		   return "diary/diary_write_view";
	   }
	   
	   @PostMapping("diary_write")
	   public String diary_write(Model model,DiaryVO diaryVO) {
		   log.info("diary_write();");
//		   model.addAttribute("write")
		   diaryService.writeDiary(diaryVO);
		   return "redirect:diary";
	   }
	   
	   @GetMapping("test")
	   public String test(Model model) {
		   log.info("test();");
		   return "test";
	   }
	   
	   
}
