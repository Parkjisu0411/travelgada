package com.gada.travelgada.controller;

import java.io.File;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.DiaryService;
import com.gada.travelgada.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class SearchController {
	
	private SearchService searchService;

   // 다이어리
   @GetMapping("searchView")
   public ModelAndView searchView(ModelAndView mav) {
      log.info("controller searchView();");
      mav.setViewName("search/searchView");

      return mav;

   }// search end
   
   @PostMapping("search")
   public ModelAndView search(ModelAndView mav, @RequestParam("keyword") String keyword) {
      log.info("controller search();");
        
      mav.addObject("searchPl",searchService.getSearchPlanner(keyword));
      mav.addObject("searchDi",searchService.getSearchDiary(keyword));
      
      mav.setViewName("search/search");

      return mav;

   }// search end

}// Controller end