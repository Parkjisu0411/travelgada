package com.gada.travelgada.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	private static final String FILE_SERVER_PATH = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources";
  	
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
	   
	   
	   @PostMapping("upload")
	   public String upload(@RequestParam("file") MultipartFile file,Model model) throws IllegalStateException, IOException {
	     System.out.println("파일 이름: " + file.getOriginalFilename());
	     System.out.println("파일 크기: " + file.getSize());

	     if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
		   }else {
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}

	     return "uploadok";
	   }
	  
}
